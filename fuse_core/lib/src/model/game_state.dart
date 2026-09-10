import 'card.dart';
import 'rules_config.dart';

enum MatchMode {
  /// Colour or number must match.
  normal,

  /// After Otoč: number ±1, colour ignored.
  twist,
}

enum GamePhase { playing, over }

enum LifeLossCause { timeout, invalidCard, bomb, debug }

List<Card> _cards(Object? json) => [
  for (final c in json as List<Object?>) Card.fromJson(c),
];

List<Object?> _cardsJson(List<Card> cards) => [
  for (final c in cards) c.toJson(),
];

final class PlayerState {
  PlayerState({
    required this.id,
    required this.name,
    required this.lives,
    required List<Card> hand,
    this.ghostNopeRound = -1,
  }) : hand = List.unmodifiable(hand);

  final String id;
  final String name;
  final int lives;
  final List<Card> hand;

  /// Round in which this player (as a ghost) last used Ne!; -1 = never.
  final int ghostNopeRound;

  bool get isGhost => lives <= 0;
  bool get isAlive => lives > 0;

  Card? cardById(int cardId) {
    for (final c in hand) {
      if (c.id == cardId) return c;
    }
    return null;
  }

  PlayerState copyWith({int? lives, List<Card>? hand, int? ghostNopeRound}) =>
      PlayerState(
        id: id,
        name: name,
        lives: lives ?? this.lives,
        hand: hand ?? this.hand,
        ghostNopeRound: ghostNopeRound ?? this.ghostNopeRound,
      );

  Map<String, Object?> toJson() => {
    'id': id,
    'name': name,
    'lives': lives,
    'hand': _cardsJson(hand),
    'ghostNopeRound': ghostNopeRound,
  };

  factory PlayerState.fromJson(Map<String, Object?> j) => PlayerState(
    id: j['id'] as String,
    name: j['name'] as String,
    lives: (j['lives'] as num).toInt(),
    hand: _cards(j['hand']),
    ghostNopeRound: (j['ghostNopeRound'] as num?)?.toInt() ?? -1,
  );
}

final class TurnState {
  const TurnState({
    required this.playerId,
    required this.seq,
    required this.startedAt,
    required this.limitMs,
  });

  final String playerId;

  /// Monotonic turn counter; also closes Ne! windows.
  final int seq;
  final int startedAt;
  final int limitMs;

  int get deadline => startedAt + limitMs;

  Map<String, Object?> toJson() => {
    'playerId': playerId,
    'seq': seq,
    'startedAt': startedAt,
    'limitMs': limitMs,
  };

  factory TurnState.fromJson(Map<String, Object?> j) => TurnState(
    playerId: j['playerId'] as String,
    seq: (j['seq'] as num).toInt(),
    startedAt: (j['startedAt'] as num).toInt(),
    limitMs: (j['limitMs'] as num).toInt(),
  );
}

final class BombState {
  const BombState({required this.card, required this.fuse});

  final Card card;

  /// Completed turns left, including the current one. The player whose
  /// completed turn brings it to 0 takes the damage.
  final int fuse;

  Map<String, Object?> toJson() => {'card': card.toJson(), 'fuse': fuse};

  factory BombState.fromJson(Map<String, Object?> j) => BombState(
    card: Card.fromJson(j['card']),
    fuse: (j['fuse'] as num).toInt(),
  );
}

/// A life loss whose animation has started; it commits at [deadline] unless
/// Štít reduces it first.
final class PendingLifeLoss {
  const PendingLifeLoss({
    required this.id,
    required this.playerId,
    required this.amount,
    required this.cause,
    required this.startedAt,
    required this.deadline,
  });

  final int id;
  final String playerId;
  final int amount;
  final LifeLossCause cause;
  final int startedAt;
  final int deadline;

  PendingLifeLoss copyWith({int? amount, int? deadline}) => PendingLifeLoss(
    id: id,
    playerId: playerId,
    amount: amount ?? this.amount,
    cause: cause,
    startedAt: startedAt,
    deadline: deadline ?? this.deadline,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'playerId': playerId,
    'amount': amount,
    'cause': cause.name,
    'startedAt': startedAt,
    'deadline': deadline,
  };

  factory PendingLifeLoss.fromJson(Map<String, Object?> j) => PendingLifeLoss(
    id: (j['id'] as num).toInt(),
    playerId: j['playerId'] as String,
    amount: (j['amount'] as num).toInt(),
    cause: LifeLossCause.values.byName(j['cause'] as String),
    startedAt: (j['startedAt'] as num).toInt(),
    deadline: (j['deadline'] as num).toInt(),
  );
}

/// The last played nope-able action plus everything needed to undo it.
final class ActionRecord {
  const ActionRecord({
    required this.seq,
    required this.playerId,
    required this.card,
    required this.playedAt,
    required this.turnSeq,
    this.noped = false,
    this.targetPlayerId,
    this.bombBefore,
    this.drawnCardIds = const [],
    this.modeBefore,
    this.blindBefore,
    this.lossBefore,
  });

  final int seq;
  final String playerId;
  final Card card;
  final int playedAt;

  /// Turn that was current right after the action resolved. Ne! is only
  /// possible while this turn lasts (and within the nope window).
  final int turnSeq;
  final bool noped;

  /// Odpal target / Kradež victim.
  final String? targetPlayerId;

  /// Zneškodni, Odpal: the bomb as it was before the action.
  final BombState? bombBefore;

  /// Kradež: cards the victim drew.
  final List<int> drawnCardIds;

  /// Otoč.
  final MatchMode? modeBefore;

  /// Slepá.
  final int? blindBefore;

  /// Štít: the pending loss as it was before the shield.
  final PendingLifeLoss? lossBefore;

  CardKind get kind => card.kind;

  bool isOpenAt(int ts, int currentTurnSeq, RulesConfig rules) =>
      currentTurnSeq == turnSeq && ts <= playedAt + rules.nopeWindowMs;

  /// [turnSeq] follows the turn a revert may have started, so a late second
  /// Ne! still finds the (cancelled) action and fizzles instead of bouncing.
  ActionRecord markNoped({required int turnSeq}) => ActionRecord(
    seq: seq,
    playerId: playerId,
    card: card,
    playedAt: playedAt,
    turnSeq: turnSeq,
    noped: true,
    targetPlayerId: targetPlayerId,
    bombBefore: bombBefore,
    drawnCardIds: drawnCardIds,
    modeBefore: modeBefore,
    blindBefore: blindBefore,
    lossBefore: lossBefore,
  );

  Map<String, Object?> toJson() => {
    'seq': seq,
    'playerId': playerId,
    'card': card.toJson(),
    'playedAt': playedAt,
    'turnSeq': turnSeq,
    'noped': noped,
    if (targetPlayerId != null) 'targetPlayerId': targetPlayerId,
    if (bombBefore != null) 'bombBefore': bombBefore!.toJson(),
    if (drawnCardIds.isNotEmpty) 'drawnCardIds': drawnCardIds,
    if (modeBefore != null) 'modeBefore': modeBefore!.name,
    if (blindBefore != null) 'blindBefore': blindBefore,
    if (lossBefore != null) 'lossBefore': lossBefore!.toJson(),
  };

  factory ActionRecord.fromJson(Map<String, Object?> j) => ActionRecord(
    seq: (j['seq'] as num).toInt(),
    playerId: j['playerId'] as String,
    card: Card.fromJson(j['card']),
    playedAt: (j['playedAt'] as num).toInt(),
    turnSeq: (j['turnSeq'] as num).toInt(),
    noped: j['noped'] as bool? ?? false,
    targetPlayerId: j['targetPlayerId'] as String?,
    bombBefore: j['bombBefore'] == null
        ? null
        : BombState.fromJson(j['bombBefore'] as Map<String, Object?>),
    drawnCardIds: [
      for (final id in (j['drawnCardIds'] as List<Object?>? ?? const []))
        (id as num).toInt(),
    ],
    modeBefore: j['modeBefore'] == null
        ? null
        : MatchMode.values.byName(j['modeBefore'] as String),
    blindBefore: (j['blindBefore'] as num?)?.toInt(),
    lossBefore: j['lossBefore'] == null
        ? null
        : PendingLifeLoss.fromJson(j['lossBefore'] as Map<String, Object?>),
  );
}

/// Complete, immutable, serializable game state. The engine is the only thing
/// that produces new states.
final class GameState {
  GameState({
    required this.rules,
    required List<PlayerState> players,
    required List<Card> deck,
    required List<Card> discard,
    required this.target,
    required this.bomb,
    required this.matchMode,
    required this.blindTurnsLeft,
    required this.turn,
    required this.round,
    required this.turnsInRound,
    required this.eliminations,
    required List<PendingLifeLoss> pendingLosses,
    required this.lastAction,
    required List<int> rng,
    required this.nextCardId,
    required this.nextSeq,
    required this.lastTs,
    required this.phase,
    required this.winnerId,
  }) : players = List.unmodifiable(players),
       deck = List.unmodifiable(deck),
       discard = List.unmodifiable(discard),
       pendingLosses = List.unmodifiable(pendingLosses),
       rng = List.unmodifiable(rng);

  final RulesConfig rules;

  /// Seat order = direction of play.
  final List<PlayerState> players;

  /// Draw pile, index 0 = top.
  final List<Card> deck;
  final List<Card> discard;

  /// The face-up card to match (always a number card).
  final Card target;
  final BombState? bomb;
  final MatchMode matchMode;
  final int blindTurnsLeft;
  final TurnState turn;

  /// 0-based round index; drives the turn limit.
  final int round;
  final int turnsInRound;
  final int eliminations;
  final List<PendingLifeLoss> pendingLosses;
  final ActionRecord? lastAction;
  final List<int> rng;
  final int nextCardId;
  final int nextSeq;

  /// serverTs of the last applied command (commands must not go back).
  final int lastTs;
  final GamePhase phase;
  final String? winnerId;

  bool get isOver => phase == GamePhase.over;
  bool get isBlind => blindTurnsLeft > 0;

  PlayerState player(String id) => players.firstWhere(
    (p) => p.id == id,
    orElse: () => throw ArgumentError.value(id, 'id', 'unknown player'),
  );

  PlayerState? tryPlayer(String id) {
    for (final p in players) {
      if (p.id == id) return p;
    }
    return null;
  }

  PlayerState get currentPlayer => player(turn.playerId);

  int get aliveCount => players.where((p) => p.isAlive).length;

  int get currentTurnLimitMs =>
      rules.turnLimitFor(round: round, eliminations: eliminations);

  /// Earliest time at which the host must send `TimerExpired`.
  int? get nextDeadline {
    if (isOver) return null;
    var d = turn.deadline;
    for (final l in pendingLosses) {
      if (l.deadline < d) d = l.deadline;
    }
    return d;
  }

  /// Every card in the game, wherever it is (for invariants / debugging).
  List<Card> get allCards => [
    ...deck,
    ...discard,
    target,
    if (bomb != null) bomb!.card,
    for (final p in players) ...p.hand,
  ];

  Map<String, Object?> toJson() => {
    'rules': rules.toJson(),
    'players': [for (final p in players) p.toJson()],
    'deck': _cardsJson(deck),
    'discard': _cardsJson(discard),
    'target': target.toJson(),
    'bomb': bomb?.toJson(),
    'matchMode': matchMode.name,
    'blindTurnsLeft': blindTurnsLeft,
    'turn': turn.toJson(),
    'round': round,
    'turnsInRound': turnsInRound,
    'eliminations': eliminations,
    'pendingLosses': [for (final l in pendingLosses) l.toJson()],
    'lastAction': lastAction?.toJson(),
    'rng': rng,
    'nextCardId': nextCardId,
    'nextSeq': nextSeq,
    'lastTs': lastTs,
    'phase': phase.name,
    'winnerId': winnerId,
  };

  factory GameState.fromJson(Map<String, Object?> j) => GameState(
    rules: RulesConfig.fromJson(j['rules'] as Map<String, Object?>),
    players: [
      for (final p in j['players'] as List<Object?>)
        PlayerState.fromJson(p as Map<String, Object?>),
    ],
    deck: _cards(j['deck']),
    discard: _cards(j['discard']),
    target: Card.fromJson(j['target']),
    bomb: j['bomb'] == null
        ? null
        : BombState.fromJson(j['bomb'] as Map<String, Object?>),
    matchMode: MatchMode.values.byName(j['matchMode'] as String),
    blindTurnsLeft: (j['blindTurnsLeft'] as num).toInt(),
    turn: TurnState.fromJson(j['turn'] as Map<String, Object?>),
    round: (j['round'] as num).toInt(),
    turnsInRound: (j['turnsInRound'] as num).toInt(),
    eliminations: (j['eliminations'] as num).toInt(),
    pendingLosses: [
      for (final l in j['pendingLosses'] as List<Object?>)
        PendingLifeLoss.fromJson(l as Map<String, Object?>),
    ],
    lastAction: j['lastAction'] == null
        ? null
        : ActionRecord.fromJson(j['lastAction'] as Map<String, Object?>),
    rng: [for (final w in j['rng'] as List<Object?>) (w as num).toInt()],
    nextCardId: (j['nextCardId'] as num).toInt(),
    nextSeq: (j['nextSeq'] as num).toInt(),
    lastTs: (j['lastTs'] as num).toInt(),
    phase: GamePhase.values.byName(j['phase'] as String),
    winnerId: j['winnerId'] as String?,
  );
}
