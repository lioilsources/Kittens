import '../events.dart';
import '../model/card.dart';
import '../model/game_state.dart';
import '../model/rules_config.dart';
import '../rules/bomb_fuse.dart';
import '../util/rng.dart';

/// Mutable player record used only inside a transaction.
final class MPlayer {
  MPlayer.from(PlayerState p)
    : id = p.id,
      name = p.name,
      lives = p.lives,
      hand = [...p.hand],
      ghostNopeRound = p.ghostNopeRound;

  final String id;
  final String name;
  int lives;
  final List<Card> hand;
  int ghostNopeRound;

  bool get isAlive => lives > 0;
  bool get isGhost => lives <= 0;

  Card? cardById(int id) {
    for (final c in hand) {
      if (c.id == id) return c;
    }
    return null;
  }

  PlayerState freeze() => PlayerState(
    id: id,
    name: name,
    lives: lives,
    hand: hand,
    ghostNopeRound: ghostNopeRound,
  );
}

/// A single engine step: mutable working copy of [GameState] plus the event
/// list. Holds the rule primitives shared by all command handlers.
final class Tx {
  Tx(GameState s)
    : rules = s.rules,
      players = [for (final p in s.players) MPlayer.from(p)],
      deck = [...s.deck],
      discard = [...s.discard],
      target = s.target,
      bomb = s.bomb,
      matchMode = s.matchMode,
      blindTurnsLeft = s.blindTurnsLeft,
      turn = s.turn,
      round = s.round,
      turnsInRound = s.turnsInRound,
      eliminations = s.eliminations,
      losses = [...s.pendingLosses],
      lastAction = s.lastAction,
      rng = Rng.fromState(s.rng),
      nextCardId = s.nextCardId,
      nextSeq = s.nextSeq,
      lastTs = s.lastTs,
      phase = s.phase,
      winnerId = s.winnerId;

  RulesConfig rules;
  final List<MPlayer> players;
  final List<Card> deck;
  final List<Card> discard;
  Card target;
  BombState? bomb;
  MatchMode matchMode;
  int blindTurnsLeft;
  TurnState turn;
  int round;
  int turnsInRound;
  int eliminations;
  final List<PendingLifeLoss> losses;
  ActionRecord? lastAction;
  final Rng rng;
  int nextCardId;
  int nextSeq;
  int lastTs;
  GamePhase phase;
  String? winnerId;

  final List<GameEvent> events = [];

  bool get isOver => phase == GamePhase.over;

  GameState build() => GameState(
    rules: rules,
    players: [for (final p in players) p.freeze()],
    deck: deck,
    discard: discard,
    target: target,
    bomb: bomb,
    matchMode: matchMode,
    blindTurnsLeft: blindTurnsLeft,
    turn: turn,
    round: round,
    turnsInRound: turnsInRound,
    eliminations: eliminations,
    pendingLosses: losses,
    lastAction: lastAction,
    rng: rng.state,
    nextCardId: nextCardId,
    nextSeq: nextSeq,
    lastTs: lastTs,
    phase: phase,
    winnerId: winnerId,
  );

  void emit(GameEvent e) => events.add(e);

  int newSeq() => nextSeq++;

  MPlayer? tryPlayer(String id) {
    for (final p in players) {
      if (p.id == id) return p;
    }
    return null;
  }

  MPlayer player(String id) =>
      tryPlayer(id) ?? (throw StateError('Unknown player $id'));

  int get aliveCount => players.where((p) => p.isAlive).length;

  /// Next living player after [id] in seat order (skips ghosts).
  String nextAliveAfter(String id) {
    final i = players.indexWhere((p) => p.id == id);
    for (var k = 1; k <= players.length; k++) {
      final q = players[(i + k) % players.length];
      if (q.isAlive) return q.id;
    }
    return id;
  }

  // ---------------------------------------------------------------- turns

  void startTurn(String playerId, int at, TurnStartReason reason) {
    turnsInRound++;
    if (turnsInRound > aliveCount) {
      round++;
      turnsInRound = 1;
    }
    final limit = rules.turnLimitFor(round: round, eliminations: eliminations);
    if (reason != TurnStartReason.gameStart && limit != turn.limitMs) {
      emit(TurnLimitChanged(at, limitMs: limit, round: round));
    }
    turn = TurnState(
      playerId: playerId,
      seq: turn.seq + 1,
      startedAt: at,
      limitMs: limit,
    );
    emit(
      TurnStarted(
        at,
        playerId: playerId,
        seq: turn.seq,
        round: round,
        limitMs: limit,
        reason: reason,
      ),
    );
  }

  /// A *completed* turn ticks the bomb fuse and the Slepá counter.
  void completeTurn(String playerId, int at) {
    final active = bomb;
    if (active != null) {
      final r = tickFuse(active);
      if (r.exploded) {
        bomb = null;
        emit(BombExploded(at, playerId: playerId));
        reinsertBomb(active.card, at);
        addLoss(playerId, rules.bombDamage, LifeLossCause.bomb, at);
      } else {
        bomb = r.bomb;
        emit(FuseTicked(at, fuse: r.bomb!.fuse));
      }
    }
    if (blindTurnsLeft > 0) {
      blindTurnsLeft--;
      emit(BlindChanged(at, turnsLeft: blindTurnsLeft));
    }
  }

  /// Timeout of the current turn: −life, penalty draw, next player.
  void timeout(int at) {
    final pid = turn.playerId;
    emit(TurnTimedOut(at, playerId: pid, handSize: player(pid).hand.length));
    addLoss(pid, rules.lifePenalty, LifeLossCause.timeout, at);
    completeTurn(pid, at);
    draw(pid, rules.drawPenalty, at, DrawReason.penalty);
    startTurn(nextAliveAfter(pid), at, TurnStartReason.normal);
  }

  // ----------------------------------------------------------------- deck

  /// Bomb goes back to a random position in the deck (v1: random, §2).
  void reinsertBomb(Card card, int at) {
    final index = rng.nextInt(deck.length + 1);
    deck.insert(index, card);
    emit(BombReinserted(at, index: index));
  }

  void reshuffle(int at) {
    deck.addAll(discard);
    discard.clear();
    rng.shuffle(deck);
    emit(DeckReshuffled(at, size: deck.length));
  }

  /// Draws up to [n] cards. A drawn bomb surfaces (and uses up that draw);
  /// a bomb drawn while another is active goes to the discard pile.
  List<Card> draw(String playerId, int n, int at, DrawReason reason) {
    final p = player(playerId);
    final drawn = <Card>[];
    var remaining = n;
    var reshuffled = false;
    while (remaining > 0) {
      if (deck.isEmpty) {
        if (discard.isEmpty || reshuffled) break;
        reshuffle(at);
        reshuffled = true;
      }
      final c = deck.removeAt(0);
      if (c.kind == CardKind.bomb) {
        if (bomb == null) {
          bomb = BombState(card: c, fuse: rules.bombFuseTurns);
          emit(BombSurfaced(at, drawnBy: playerId, fuse: rules.bombFuseTurns));
          remaining--;
        } else {
          discard.add(c);
        }
        continue;
      }
      p.hand.add(c);
      drawn.add(c);
      remaining--;
    }
    if (drawn.isNotEmpty) {
      emit(CardsDrawn(at, playerId: playerId, cards: drawn, reason: reason));
    }
    return drawn;
  }

  /// Removes and returns the first card with [code] from deck, then discard.
  Card? takeFromPiles(String code) {
    for (final pile in [deck, discard]) {
      final i = pile.indexWhere((c) => c.code == code);
      if (i >= 0) return pile.removeAt(i);
    }
    return null;
  }

  // ---------------------------------------------------------------- lives

  PendingLifeLoss addLoss(
    String playerId,
    int amount,
    LifeLossCause cause,
    int at,
  ) {
    final loss = PendingLifeLoss(
      id: newSeq(),
      playerId: playerId,
      amount: amount,
      cause: cause,
      startedAt: at,
      deadline: at + rules.shieldWindowMs,
    );
    losses.add(loss);
    emit(LifeLossPending(at, loss: loss));
    return loss;
  }

  void commitLoss(PendingLifeLoss loss, int at) {
    losses.removeWhere((l) => l.id == loss.id);
    final p = player(loss.playerId);
    if (p.isGhost || loss.amount <= 0) return;
    final left = p.lives - loss.amount;
    p.lives = left < 0 ? 0 : left;
    emit(
      LifeLost(
        at,
        playerId: p.id,
        amount: loss.amount,
        cause: loss.cause,
        livesLeft: p.lives,
      ),
    );
    if (p.isAlive) return;

    eliminations++;
    losses.removeWhere((l) => l.playerId == p.id);
    emit(PlayerBecameGhost(at, playerId: p.id));
    if (aliveCount <= 1) {
      gameOver(at);
    } else if (turn.playerId == p.id) {
      startTurn(nextAliveAfter(p.id), at, TurnStartReason.ghostSkip);
    }
  }

  void gameOver(int at) {
    phase = GamePhase.over;
    final alive = players.where((p) => p.isAlive).toList();
    winnerId = alive.length == 1 ? alive.single.id : null;
    losses.clear();
    emit(GameOver(at, winnerId: winnerId));
  }

  /// Resolves deadlines in chronological order up to [upTo] (strictly before
  /// it unless [inclusive]). On a tie, life losses resolve before a timeout.
  void resolveDeadlines(int upTo, {required bool inclusive}) {
    bool due(int d) => inclusive ? d <= upTo : d < upTo;
    while (!isOver) {
      PendingLifeLoss? next;
      for (final l in losses) {
        if (next == null ||
            l.deadline < next.deadline ||
            (l.deadline == next.deadline && l.id < next.id)) {
          next = l;
        }
      }
      if (next != null &&
          next.deadline <= turn.deadline &&
          due(next.deadline)) {
        commitLoss(next, next.deadline);
      } else if (due(turn.deadline)) {
        timeout(turn.deadline);
      } else {
        return;
      }
    }
  }
}
