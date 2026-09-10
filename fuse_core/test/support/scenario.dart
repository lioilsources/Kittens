import 'package:fuse_core/fuse_core.dart';

/// Builds an exact game state for rule tests. Cards are given as codes
/// (`R5`, `NOPE`, …); deck is listed top first.
GameState scenario({
  int players = 3,
  Map<String, List<String>> hands = const {},
  List<String> deck = const [],
  List<String> discard = const [],
  String target = 'R1',
  int? fuse,
  Map<String, int> lives = const {},
  MatchMode mode = MatchMode.normal,
  int blind = 0,
  String turnPlayer = 'p1',
  int turnStartedAt = 0,
  int round = 0,
  RulesConfig rules = const RulesConfig(),
  int seed = 7,
}) {
  var nextId = 0;
  Card card(String code) => Card.parseCode(code, nextId++);

  final seats = [for (var i = 1; i <= players; i++) 'p$i'];
  final built = [
    for (final id in seats)
      PlayerState(
        id: id,
        name: id.toUpperCase(),
        lives: lives[id] ?? rules.startLives,
        hand: [for (final c in hands[id] ?? const <String>[]) card(c)],
      ),
  ];
  final deckCards = [for (final c in deck) card(c)];
  final discardCards = [for (final c in discard) card(c)];
  final targetCard = card(target);
  final bomb = fuse == null ? null : BombState(card: card('BOMB'), fuse: fuse);

  return GameState(
    rules: rules,
    players: built,
    deck: deckCards,
    discard: discardCards,
    target: targetCard,
    bomb: bomb,
    matchMode: mode,
    blindTurnsLeft: blind,
    turn: TurnState(
      playerId: turnPlayer,
      seq: 1,
      startedAt: turnStartedAt,
      limitMs: rules.turnLimitFor(round: round, eliminations: 0),
    ),
    round: round,
    turnsInRound: 1,
    eliminations: 0,
    pendingLosses: const [],
    lastAction: null,
    rng: Rng.seeded(seed).state,
    nextCardId: nextId,
    nextSeq: 1,
    lastTs: turnStartedAt,
    phase: GamePhase.playing,
    winnerId: null,
  );
}

/// Fluent driver around the engine for tests.
final class G {
  G(this.state);

  GameState state;
  final List<GameEvent> log = [];
  List<GameEvent> last = const [];

  G cmd(Command c) {
    final step = GameEngine.apply(state, c);
    state = step.state;
    last = step.events;
    log.addAll(step.events);
    return this;
  }

  Card cardOf(String playerId, String code) => state
      .player(playerId)
      .hand
      .firstWhere(
        (c) => c.code == code,
        orElse: () => throw StateError('$playerId has no $code'),
      );

  G play(String pid, String code, int at, {String? target}) => cmd(
    PlayCard(
      playerId: pid,
      cardId: cardOf(pid, code).id,
      targetPlayerId: target,
      serverTs: at,
    ),
  );

  G react(String pid, String code, int at, {String? target}) => cmd(
    PlayReaction(
      playerId: pid,
      cardId: cardOf(pid, code).id,
      targetPlayerId: target,
      serverTs: at,
    ),
  );

  G ghostNope(String pid, int at) =>
      cmd(GhostNope(playerId: pid, serverTs: at));

  G tick(int at) => cmd(TimerExpired(serverTs: at));

  Iterable<T> lastOf<T extends GameEvent>() => last.whereType<T>();
  Iterable<T> allOf<T extends GameEvent>() => log.whereType<T>();

  String? get rejection {
    final r = last.whereType<CommandRejected>();
    return r.isEmpty ? null : r.first.reason;
  }

  PlayerState p(String id) => state.player(id);
  List<String> hand(String id) => [for (final c in p(id).hand) c.code];
}
