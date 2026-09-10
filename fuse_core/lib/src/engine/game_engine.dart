import '../commands.dart';
import '../events.dart';
import '../model/card.dart';
import '../model/game_state.dart';
import '../model/setup.dart';
import '../rules/match_rule.dart';
import '../rules/reactions.dart';
import '../rules/turn_reward.dart';
import '../util/rng.dart';
import 'tx.dart';

typedef EngineStep = ({GameState state, List<GameEvent> events});

/// Reasons attached to [CommandRejected]. A rejected command changes nothing
/// (apart from deadlines that were due before it anyway).
abstract final class RejectReason {
  static const gameOver = 'gameOver';
  static const timeTravel = 'timeTravel';
  static const unknownPlayer = 'unknownPlayer';
  static const notYourTurn = 'notYourTurn';
  static const cardNotInHand = 'cardNotInHand';
  static const invalidTarget = 'invalidTarget';
  static const notAReaction = 'notAReaction';
  static const ghost = 'ghostCannotDoThat';
  static const notGhost = 'notGhost';
  static const ghostNopeUsed = 'ghostNopeUsedThisRound';
  static const ghostNeedsCard = 'ghostNopeNeedsCard';
  static const nothingToNope = 'nothingToNope';
  static const noPendingLoss = 'noPendingLoss';
  static const ownTurn = 'cannotStealOwnTurn';
  static const tooEarly = 'stealTooEarly';
  static const badDebug = 'badDebugCommand';
}

/// Pure, deterministic rules engine: `apply(state, command) → (state, events)`.
abstract final class GameEngine {
  static EngineStep newGame(GameSetup setup) {
    final rules = setup.rules;
    final ids = setup.players.map((p) => p.id).toSet();
    if (setup.players.length < rules.minPlayers ||
        setup.players.length > rules.maxPlayers) {
      throw ArgumentError(
        'Players must be ${rules.minPlayers}–'
        '${rules.maxPlayers}, got ${setup.players.length}',
      );
    }
    if (ids.length != setup.players.length) {
      throw ArgumentError('Player ids must be unique');
    }

    final rng = Rng.seeded(setup.seed);
    final built = buildDeck(rules);
    final dealable = [...built.dealable];
    rng.shuffle(dealable);

    final hands = [for (final _ in setup.players) <Card>[]];
    for (var r = 0; r < rules.handSize; r++) {
      for (final hand in hands) {
        if (dealable.isNotEmpty) hand.add(dealable.removeAt(0));
      }
    }
    final deck = [...dealable, ...built.afterDeal];
    rng.shuffle(deck);
    final targetIndex = deck.indexWhere((c) => c.isNumber);
    if (targetIndex < 0) throw StateError('Deck has no number card');
    final target = deck.removeAt(targetIndex);

    final initial = GameState(
      rules: rules,
      players: [
        for (var i = 0; i < setup.players.length; i++)
          PlayerState(
            id: setup.players[i].id,
            name: setup.players[i].name,
            lives: rules.startLives,
            hand: hands[i],
          ),
      ],
      deck: deck,
      discard: const [],
      target: target,
      bomb: null,
      matchMode: MatchMode.normal,
      blindTurnsLeft: 0,
      turn: TurnState(
        playerId: setup.players.first.id,
        seq: 0,
        startedAt: setup.startTs,
        limitMs: rules.turnLimitMs,
      ),
      round: 0,
      turnsInRound: 0,
      eliminations: 0,
      pendingLosses: const [],
      lastAction: null,
      rng: rng.state,
      nextCardId: rules.deckSize,
      nextSeq: 1,
      lastTs: setup.startTs,
      phase: GamePhase.playing,
      winnerId: null,
    );

    final tx = Tx(initial)
      ..emit(
        GameStarted(
          setup.startTs,
          playerIds: [for (final p in setup.players) p.id],
          target: target,
        ),
      );
    tx.startTurn(
      setup.players.first.id,
      setup.startTs,
      TurnStartReason.gameStart,
    );
    return (state: tx.build(), events: tx.events);
  }

  static EngineStep apply(GameState state, Command cmd) {
    if (state.isOver) {
      return _rejectUnchanged(state, cmd, RejectReason.gameOver);
    }
    if (cmd.serverTs < state.lastTs) {
      return _rejectUnchanged(state, cmd, RejectReason.timeTravel);
    }

    final tx = Tx(state);
    tx.resolveDeadlines(cmd.serverTs, inclusive: cmd is TimerExpired);
    tx.lastTs = cmd.serverTs;

    if (tx.isOver) {
      if (cmd is! TimerExpired) _reject(tx, cmd, RejectReason.gameOver);
    } else {
      switch (cmd) {
        case TimerExpired():
          break;
        case PlayCard():
          _playCard(tx, cmd);
        case PlayReaction():
          _playReaction(tx, cmd);
        case GhostNope():
          _ghostNope(tx, cmd);
        case DebugCommand():
          _debug(tx, cmd);
      }
    }
    return (state: tx.build(), events: tx.events);
  }

  // -------------------------------------------------------------- helpers

  static EngineStep _rejectUnchanged(
    GameState state,
    Command cmd,
    String reason,
  ) => (
    state: state,
    events: [CommandRejected(cmd.serverTs, command: cmd, reason: reason)],
  );

  static void _reject(Tx tx, Command cmd, String reason) =>
      tx.emit(CommandRejected(cmd.serverTs, command: cmd, reason: reason));

  static ActionRecord _record(
    Tx tx,
    MPlayer p,
    Card card,
    int ts, {
    String? targetPlayerId,
    BombState? bombBefore,
    List<int> drawnCardIds = const [],
    MatchMode? modeBefore,
    int? blindBefore,
    PendingLifeLoss? lossBefore,
  }) => ActionRecord(
    seq: tx.newSeq(),
    playerId: p.id,
    card: card,
    playedAt: ts,
    turnSeq: tx.turn.seq,
    targetPlayerId: targetPlayerId,
    bombBefore: bombBefore,
    drawnCardIds: drawnCardIds,
    modeBefore: modeBefore,
    blindBefore: blindBefore,
    lossBefore: lossBefore,
  );

  // ------------------------------------------------------------ throwing

  static void _playCard(Tx tx, PlayCard c) {
    final p = tx.tryPlayer(c.playerId);
    if (p == null) return _reject(tx, c, RejectReason.unknownPlayer);
    if (tx.turn.playerId != p.id) {
      return _reject(tx, c, RejectReason.notYourTurn);
    }
    final card = p.cardById(c.cardId);
    if (card == null) return _reject(tx, c, RejectReason.cardNotInHand);

    final ts = c.serverTs;
    final throwMs = ts - tx.turn.startedAt;
    final valid = isValidThrow(tx.build(), card);

    String? detonateTarget;
    if (valid && card.kind == CardKind.detonate) {
      final t = c.targetPlayerId == null
          ? null
          : tx.tryPlayer(c.targetPlayerId!);
      if (t == null || t.id == p.id || t.isGhost) {
        return _reject(tx, c, RejectReason.invalidTarget);
      }
      detonateTarget = t.id;
    }

    if (!valid) {
      // Card bounces back into the hand.
      tx.emit(InvalidThrow(ts, playerId: p.id, card: card, throwMs: throwMs));
      tx.addLoss(p.id, tx.rules.lifePenalty, LifeLossCause.invalidCard, ts);
      tx.completeTurn(p.id, ts);
      tx.draw(p.id, tx.rules.drawPenalty, ts, DrawReason.penalty);
      tx.startTurn(tx.nextAliveAfter(p.id), ts, TurnStartReason.normal);
      return;
    }

    p.hand.remove(card);
    final drawCount = rewardDraw(tx.rules, throwMs);
    tx.emit(
      CardThrown(
        ts,
        playerId: p.id,
        card: card,
        throwMs: throwMs,
        draw: drawCount,
        targetPlayerId: detonateTarget,
      ),
    );

    void finishCompletedTurn() {
      tx.completeTurn(p.id, ts);
    }

    void drawAndPass() {
      tx.draw(p.id, drawCount, ts, DrawReason.reward);
      tx.startTurn(tx.nextAliveAfter(p.id), ts, TurnStartReason.normal);
    }

    switch (card.kind) {
      case CardKind.number:
        tx.discard.add(tx.target);
        tx.target = card;
        finishCompletedTurn();
        drawAndPass();

      case CardKind.twist:
        tx.discard.add(card);
        final before = tx.matchMode;
        tx.matchMode = before == MatchMode.normal
            ? MatchMode.twist
            : MatchMode.normal;
        tx.emit(MatchModeChanged(ts, mode: tx.matchMode));
        finishCompletedTurn();
        drawAndPass();
        tx.lastAction = _record(tx, p, card, ts, modeBefore: before);

      case CardKind.blind:
        tx.discard.add(card);
        finishCompletedTurn(); // ticks an older Slepá first
        final before = tx.blindTurnsLeft;
        tx.blindTurnsLeft = tx.rules.blindTurns;
        tx.emit(BlindChanged(ts, turnsLeft: tx.blindTurnsLeft));
        drawAndPass();
        tx.lastAction = _record(tx, p, card, ts, blindBefore: before);

      case CardKind.defuse:
        tx.discard.add(card);
        final before = tx.bomb!;
        tx.bomb = null;
        tx.emit(BombDefused(ts, playerId: p.id));
        tx.reinsertBomb(before.card, ts);
        finishCompletedTurn();
        drawAndPass();
        tx.lastAction = _record(tx, p, card, ts, bombBefore: before);

      case CardKind.detonate:
        // Transfer, not a completed turn: no fuse tick.
        tx.discard.add(card);
        final before = tx.bomb!;
        tx.bomb = BombState(card: before.card, fuse: 1);
        tx.emit(
          BombRedirected(ts, playerId: p.id, targetPlayerId: detonateTarget!),
        );
        tx.draw(p.id, drawCount, ts, DrawReason.reward);
        tx.startTurn(detonateTarget, ts, TurnStartReason.detonate);
        tx.lastAction = _record(
          tx,
          p,
          card,
          ts,
          targetPlayerId: detonateTarget,
          bombBefore: before,
        );

      case CardKind.bomb || CardKind.nope || CardKind.shield || CardKind.steal:
        throw StateError('unreachable: ${card.kind} is never a valid throw');
    }
  }

  // ------------------------------------------------------------ reactions

  static void _playReaction(Tx tx, PlayReaction c) {
    final p = tx.tryPlayer(c.playerId);
    if (p == null) return _reject(tx, c, RejectReason.unknownPlayer);
    final card = p.cardById(c.cardId);
    if (card == null) return _reject(tx, c, RejectReason.cardNotInHand);
    final ts = c.serverTs;

    switch (card.kind) {
      case CardKind.nope:
        if (p.isGhost) {
          if (!ghostNopeAvailable(tx.build(), p.freeze())) {
            return _reject(tx, c, RejectReason.ghostNopeUsed);
          }
        }
        _nope(tx, c, p, card: card, ghost: p.isGhost);

      case CardKind.shield:
        if (p.isGhost) return _reject(tx, c, RejectReason.ghost);
        final loss = shieldableLoss(tx.build(), p.id, ts);
        if (loss == null) return _reject(tx, c, RejectReason.noPendingLoss);
        p.hand.remove(card);
        tx.discard.add(card);
        final saved = loss.amount < tx.rules.shieldSavesLives
            ? loss.amount
            : tx.rules.shieldSavesLives;
        final remaining = loss.amount - saved;
        final i = tx.losses.indexWhere((l) => l.id == loss.id);
        if (remaining <= 0) {
          tx.losses.removeAt(i);
        } else {
          tx.losses[i] = loss.copyWith(amount: remaining);
        }
        tx.emit(
          ShieldUsed(
            ts,
            playerId: p.id,
            lossId: loss.id,
            saved: saved,
            remaining: remaining,
          ),
        );
        tx.lastAction = _record(tx, p, card, ts, lossBefore: loss);

      case CardKind.steal:
        if (p.isGhost) return _reject(tx, c, RejectReason.ghost);
        final victimId = tx.turn.playerId;
        if (victimId == p.id) return _reject(tx, c, RejectReason.ownTurn);
        if (c.targetPlayerId != null && c.targetPlayerId != victimId) {
          return _reject(tx, c, RejectReason.invalidTarget);
        }
        if (!stealAllowedAt(tx.build(), ts)) {
          return _reject(tx, c, RejectReason.tooEarly);
        }
        p.hand.remove(card);
        tx.discard.add(card);
        tx.emit(
          TurnStolen(
            ts,
            byPlayerId: p.id,
            fromPlayerId: victimId,
            hesitationMs: ts - tx.turn.startedAt,
            fuse: tx.bomb?.fuse,
          ),
        );
        final drawn = tx.draw(
          victimId,
          tx.rules.stealVictimDraw,
          ts,
          DrawReason.stolen,
        );
        tx.startTurn(p.id, ts, TurnStartReason.steal);
        tx.lastAction = _record(
          tx,
          p,
          card,
          ts,
          targetPlayerId: victimId,
          drawnCardIds: [for (final d in drawn) d.id],
        );

      case CardKind.number ||
          CardKind.bomb ||
          CardKind.defuse ||
          CardKind.detonate ||
          CardKind.twist ||
          CardKind.blind:
        _reject(tx, c, RejectReason.notAReaction);
    }
  }

  static void _ghostNope(Tx tx, GhostNope c) {
    final p = tx.tryPlayer(c.playerId);
    if (p == null) return _reject(tx, c, RejectReason.unknownPlayer);
    if (!p.isGhost) return _reject(tx, c, RejectReason.notGhost);
    if (tx.rules.ghostNopeNeedsCard) {
      return _reject(tx, c, RejectReason.ghostNeedsCard);
    }
    if (!ghostNopeAvailable(tx.build(), p.freeze())) {
      return _reject(tx, c, RejectReason.ghostNopeUsed);
    }
    _nope(tx, c, p, card: null, ghost: true);
  }

  static void _nope(
    Tx tx,
    Command c,
    MPlayer p, {
    required Card? card,
    required bool ghost,
  }) {
    final ts = c.serverTs;
    if (!nopeTargetOpen(tx.build(), ts)) {
      return _reject(tx, c, RejectReason.nothingToNope);
    }
    if (ghost) p.ghostNopeRound = tx.round;
    if (card != null) {
      p.hand.remove(card);
      tx.discard.add(card);
    }
    final action = tx.lastAction!;
    if (action.noped) {
      tx.emit(NopeFizzled(ts, playerId: p.id, ghost: ghost));
      return;
    }
    final undone = _undo(tx, action, ts);
    tx.lastAction = action.markNoped(turnSeq: tx.turn.seq);
    if (undone) {
      tx.emit(
        ActionNoped(
          ts,
          byPlayerId: p.id,
          actionPlayerId: action.playerId,
          actionKind: action.kind,
          ghost: ghost,
        ),
      );
    } else {
      tx.emit(NopeFizzled(ts, playerId: p.id, ghost: ghost));
    }
  }

  /// Reverts [a]. Returns false when there is nothing left to revert.
  static bool _undo(Tx tx, ActionRecord a, int ts) {
    switch (a.kind) {
      case CardKind.defuse:
        final before = a.bombBefore!;
        final active = tx.bomb;
        if (active == null) {
          final i = tx.deck.indexWhere((c) => c.id == before.card.id);
          if (i < 0) return false;
          tx.deck.removeAt(i);
        } else if (active.card.id != before.card.id) {
          return false;
        }
        tx.bomb = before;
        tx.emit(BombSurfaced(ts, drawnBy: null, fuse: before.fuse));
        return true;

      case CardKind.detonate:
        final before = a.bombBefore!;
        if (tx.bomb?.card.id == before.card.id) tx.bomb = before;
        if (tx.player(a.playerId).isAlive) {
          tx.startTurn(a.playerId, ts, TurnStartReason.nopeRevert);
        }
        return true;

      case CardKind.twist:
        tx.matchMode = a.modeBefore!;
        tx.emit(MatchModeChanged(ts, mode: tx.matchMode));
        return true;

      case CardKind.blind:
        tx.blindTurnsLeft = a.blindBefore!;
        tx.emit(BlindChanged(ts, turnsLeft: tx.blindTurnsLeft));
        return true;

      case CardKind.shield:
        final before = a.lossBefore!;
        if (tx.player(before.playerId).isGhost) return false;
        tx.losses
          ..removeWhere((l) => l.id == before.id)
          ..add(before);
        tx.emit(LifeLossPending(ts, loss: before));
        if (before.deadline < ts) tx.commitLoss(before, ts);
        return true;

      case CardKind.steal:
        final victim = tx.player(a.targetPlayerId!);
        for (final id in a.drawnCardIds.reversed) {
          final card = victim.cardById(id);
          if (card == null) continue;
          victim.hand.remove(card);
          tx.deck.insert(0, card);
        }
        if (victim.isAlive) {
          tx.startTurn(victim.id, ts, TurnStartReason.nopeRevert);
        }
        return true;

      case CardKind.number || CardKind.bomb || CardKind.nope:
        return false;
    }
  }

  // ---------------------------------------------------------------- debug

  static void _debug(Tx tx, DebugCommand c) {
    final ts = c.serverTs;
    switch (c) {
      case DebugGiveCard(:final playerId, :final code):
        final p = tx.tryPlayer(playerId);
        final Card parsed;
        try {
          parsed = Card.parseCode(code, -1);
        } on FormatException {
          return _reject(tx, c, RejectReason.badDebug);
        }
        if (p == null || parsed.kind == CardKind.bomb) {
          return _reject(tx, c, RejectReason.badDebug);
        }
        final card =
            tx.takeFromPiles(code) ?? Card.parseCode(code, tx.nextCardId++);
        p.hand.add(card);
        tx.emit(DebugApplied(ts, description: 'give $code to $playerId'));

      case DebugSetBomb(:final fuse):
        if (fuse == null || fuse <= 0) {
          final active = tx.bomb;
          if (active != null) {
            tx.bomb = null;
            tx.reinsertBomb(active.card, ts);
          }
          tx.emit(DebugApplied(ts, description: 'remove bomb'));
          return;
        }
        final card =
            tx.bomb?.card ??
            tx.takeFromPiles(CardKind.bomb.code) ??
            Card.special(tx.nextCardId++, CardKind.bomb);
        tx.bomb = BombState(card: card, fuse: fuse);
        tx.emit(BombSurfaced(ts, drawnBy: null, fuse: fuse));
        tx.emit(DebugApplied(ts, description: 'bomb fuse $fuse'));

      case DebugSetTurnLimit(:final limitMs):
        if (limitMs <= 0) return _reject(tx, c, RejectReason.badDebug);
        tx.rules = tx.rules.copyWith(
          turnLimitMs: limitMs,
          turnLimitMinMs: limitMs < tx.rules.turnLimitMinMs
              ? limitMs
              : tx.rules.turnLimitMinMs,
        );
        final limit = tx.rules.turnLimitFor(
          round: tx.round,
          eliminations: tx.eliminations,
        );
        final t = tx.turn;
        tx.turn = TurnState(
          playerId: t.playerId,
          seq: t.seq,
          startedAt: t.startedAt,
          limitMs: limit,
        );
        tx.emit(TurnLimitChanged(ts, limitMs: limit, round: tx.round));

      case DebugSetLives(:final playerId, :final lives):
        final p = tx.tryPlayer(playerId);
        if (p == null || lives < 0) {
          return _reject(tx, c, RejectReason.badDebug);
        }
        tx.emit(DebugApplied(ts, description: 'lives $playerId = $lives'));
        if (lives < p.lives) {
          tx.commitLoss(
            PendingLifeLoss(
              id: tx.newSeq(),
              playerId: p.id,
              amount: p.lives - lives,
              cause: LifeLossCause.debug,
              startedAt: ts,
              deadline: ts,
            ),
            ts,
          );
        } else {
          p.lives = lives;
        }

      case DebugSetTarget(:final code):
        final Card parsed;
        try {
          parsed = Card.parseCode(code, -1);
        } on FormatException {
          return _reject(tx, c, RejectReason.badDebug);
        }
        if (!parsed.isNumber) return _reject(tx, c, RejectReason.badDebug);
        final card =
            tx.takeFromPiles(code) ?? Card.parseCode(code, tx.nextCardId++);
        tx.discard.add(tx.target);
        tx.target = card;
        tx.emit(DebugApplied(ts, description: 'target $code'));
    }
  }
}
