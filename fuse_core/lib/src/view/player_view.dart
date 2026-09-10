import '../model/card.dart';
import '../model/game_state.dart';
import '../model/rules_config.dart';
import '../rules/match_rule.dart';

final class SeatView {
  const SeatView({
    required this.id,
    required this.name,
    required this.lives,
    required this.handCount,
  });

  final String id;
  final String name;
  final int lives;
  final int handCount;

  bool get isGhost => lives <= 0;
  bool get isAlive => lives > 0;
}

/// What one player is allowed to know. Bots only ever see this, and later the
/// host sends exactly this to each client (hidden hands, Slepá).
final class PlayerView {
  PlayerView._({
    required this.myId,
    required this.me,
    required this.seats,
    required this.target,
    required this.matchMode,
    required this.blindTurnsLeft,
    required this.bomb,
    required this.turn,
    required this.round,
    required this.rules,
    required this.pendingLosses,
    required this.lastAction,
    required this.deckCount,
    required this.discardCount,
    required this.phase,
    required this.winnerId,
    required this.lastTs,
  });

  factory PlayerView.of(GameState s, String playerId) => PlayerView._(
    myId: playerId,
    me: s.player(playerId),
    seats: [
      for (final p in s.players)
        SeatView(
          id: p.id,
          name: p.name,
          lives: p.lives,
          handCount: p.hand.length,
        ),
    ],
    target: s.isBlind ? null : s.target,
    matchMode: s.matchMode,
    blindTurnsLeft: s.blindTurnsLeft,
    bomb: s.bomb,
    turn: s.turn,
    round: s.round,
    rules: s.rules,
    pendingLosses: s.pendingLosses,
    lastAction: s.lastAction,
    deckCount: s.deck.length,
    discardCount: s.discard.length,
    phase: s.phase,
    winnerId: s.winnerId,
    lastTs: s.lastTs,
  );

  final String myId;
  final PlayerState me;
  final List<SeatView> seats;

  /// `null` while Slepá is active.
  final Card? target;
  final MatchMode matchMode;
  final int blindTurnsLeft;
  final BombState? bomb;
  final TurnState turn;
  final int round;
  final RulesConfig rules;
  final List<PendingLifeLoss> pendingLosses;
  final ActionRecord? lastAction;
  final int deckCount;
  final int discardCount;
  final GamePhase phase;
  final String? winnerId;
  final int lastTs;

  bool get isMyTurn => turn.playerId == myId && phase == GamePhase.playing;
  bool get isOver => phase == GamePhase.over;

  SeatView seat(String id) => seats.firstWhere((s) => s.id == id);

  List<SeatView> get aliveOpponents => [
    for (final s in seats)
      if (s.isAlive && s.id != myId) s,
  ];

  /// Cards that are certainly a valid throw with the information visible
  /// (while blind, number cards are a guess and are not included).
  List<Card> certainThrows() => [
    for (final c in me.hand)
      if (_certainlyValid(c)) c,
  ];

  bool _certainlyValid(Card c) => switch (c.kind) {
    CardKind.number => target != null && matchesTarget(c, target!, matchMode),
    CardKind.twist || CardKind.blind => true,
    CardKind.defuse || CardKind.detonate => bomb != null,
    CardKind.bomb ||
    CardKind.nope ||
    CardKind.shield ||
    CardKind.steal => false,
  };

  List<Card> cardsOf(CardKind kind) => [
    for (final c in me.hand)
      if (c.kind == kind) c,
  ];
}
