import '../commands.dart';
import '../model/card.dart';
import '../view/player_view.dart';
import '../util/rng.dart';
import 'bot.dart';

/// Deterministic bot covering turns and all reactions.
final class BasicBot implements Bot {
  const BasicBot({this.profile = const BotProfile(), this.seed = 0});

  final BotProfile profile;
  final int seed;

  // Hash "channels" so different decisions get independent randomness.
  static const _think = 1, _mistake = 2, _steal = 3, _shield = 4, _nope = 5;

  double _u(int channel, int key, [int extra = 0]) =>
      hashUnit(seed, channel, key, extra);

  int _delay(int channel, int key) =>
      profile.reaction.delayFor(_u(channel, key));

  @override
  BotIntent? plan(PlayerView v) {
    if (v.isOver) return null;
    BotIntent? best;
    void consider(BotIntent? i) {
      if (i == null) return;
      final at = i.at < v.lastTs ? v.lastTs : i.at;
      if (best == null || at < best!.at) best = BotIntent(at, i.command);
    }

    consider(_planShield(v));
    consider(_planNope(v));
    consider(_planSteal(v));
    consider(_planTurn(v));
    return best;
  }

  // ------------------------------------------------------------------ turn

  BotIntent? _planTurn(PlayerView v) {
    if (!v.isMyTurn || v.me.hand.isEmpty) return null;
    final at = v.turn.startedAt + _delay(_think, v.turn.seq);
    final choice = switch (profile.iq) {
      BotIq.smart => _smartChoice(v),
      BotIq.firstValid => _firstValidChoice(v),
      BotIq.sloppy =>
        _u(_mistake, v.turn.seq) < profile.mistakeRate
            ? v.me.hand[(_u(_mistake, v.turn.seq, 1) * v.me.hand.length)
                  .floor()]
            : _firstValidChoice(v),
    };
    if (choice == null) return null;
    return BotIntent(
      at,
      PlayCard(
        playerId: v.myId,
        cardId: choice.id,
        targetPlayerId: choice.kind == CardKind.detonate
            ? _detonateTarget(v)
            : null,
        serverTs: at,
      ),
    );
  }

  Card? _firstValidChoice(PlayerView v) {
    final valid = v.certainThrows();
    if (valid.isNotEmpty) return valid.first;
    return v.me.hand.first; // hopeless: throw anyway
  }

  Card? _smartChoice(PlayerView v) {
    final valid = v.certainThrows();
    final bomb = v.bomb;
    if (bomb != null && bomb.fuse == 1) {
      for (final kind in [CardKind.defuse, CardKind.detonate]) {
        final c = valid.where((c) => c.kind == kind);
        if (c.isNotEmpty) return c.first;
      }
    }
    final numbers = valid.where((c) => c.isNumber);
    if (numbers.isNotEmpty) return numbers.first;
    final wild = valid.where(
      (c) => c.kind == CardKind.twist || c.kind == CardKind.blind,
    );
    if (wild.isNotEmpty) return wild.first;
    if (valid.isNotEmpty) return valid.first; // defuse/detonate as last resort
    if (v.target == null) {
      // Blind: guess with a number card.
      final guess = v.me.hand.where((c) => c.isNumber);
      if (guess.isNotEmpty) return guess.first;
    }
    return null; // wait: a timeout costs the same, and someone may steal
  }

  String? _detonateTarget(PlayerView v) {
    final opponents = v.aliveOpponents;
    if (opponents.isEmpty) return null;
    if (profile.iq != BotIq.smart) return opponents.first.id;
    opponents.sort((a, b) => b.lives.compareTo(a.lives));
    return opponents.first.id;
  }

  // ------------------------------------------------------------- reactions

  BotIntent? _planShield(PlayerView v) {
    final shields = v.cardsOf(CardKind.shield);
    if (shields.isEmpty || v.me.isGhost) return null;
    for (final loss in v.pendingLosses) {
      if (loss.playerId != v.myId) continue;
      final at = loss.startedAt + _delay(_shield, loss.id);
      if (at > loss.startedAt + v.rules.shieldWindowMs || at > loss.deadline) {
        continue;
      }
      return BotIntent(
        at,
        PlayReaction(playerId: v.myId, cardId: shields.first.id, serverTs: at),
      );
    }
    return null;
  }

  BotIntent? _planNope(PlayerView v) {
    final a = v.lastAction;
    if (a == null || a.noped || a.playerId == v.myId) return null;
    // The living cancel what hurts them; ghosts spitefully cancel any
    // Odpal/Kradež (otherwise ghosts would never act at all).
    final worthIt = switch (a.kind) {
      CardKind.detonate ||
      CardKind.steal => v.me.isGhost || a.targetPlayerId == v.myId,
      _ => false,
    };
    if (!worthIt) return null;
    final at = a.playedAt + _delay(_nope, a.seq);
    if (!a.isOpenAt(at, v.turn.seq, v.rules)) return null;

    if (v.me.isGhost) {
      if (v.me.ghostNopeRound == v.round) return null;
      if (!v.rules.ghostNopeNeedsCard) {
        return BotIntent(at, GhostNope(playerId: v.myId, serverTs: at));
      }
    }
    final nopes = v.cardsOf(CardKind.nope);
    if (nopes.isEmpty) return null;
    return BotIntent(
      at,
      PlayReaction(playerId: v.myId, cardId: nopes.first.id, serverTs: at),
    );
  }

  BotIntent? _planSteal(PlayerView v) {
    if (v.isMyTurn || v.me.isGhost) return null;
    final steals = v.cardsOf(CardKind.steal);
    if (steals.isEmpty) return null;
    if (profile.iq == BotIq.smart) {
      if (v.bomb?.fuse == 1) return null; // would inherit the explosion
      final canPlay = v.certainThrows().any(
        (c) => c.kind != CardKind.defuse && c.kind != CardKind.detonate,
      );
      if (!canPlay) return null;
    }
    final at =
        v.turn.startedAt +
        v.rules.stealThresholdMs +
        1 +
        _delay(_steal, v.turn.seq) ~/ 2;
    if (at > v.turn.deadline) return null;
    return BotIntent(
      at,
      PlayReaction(
        playerId: v.myId,
        cardId: steals.first.id,
        targetPlayerId: v.turn.playerId,
        serverTs: at,
      ),
    );
  }
}
