import 'dart:convert';

import 'package:fuse_core/fuse_core.dart';
import 'package:test/test.dart';

GameSetup _setup(int players, int seed) => GameSetup(
  players: [for (var i = 1; i <= players; i++) PlayerSeat('p$i', 'P$i')],
  seed: seed,
);

Map<String, Bot> _bots(int players, int seed) {
  const iqs = BotIq.values;
  const reactions = [
    FixedReaction(500),
    FixedReaction(1500),
    UniformReaction(300, 1500),
    FixedReaction(900),
  ];
  return {
    for (var i = 0; i < players; i++)
      'p${i + 1}': BasicBot(
        seed: seed * 31 + i,
        profile: BotProfile(
          iq: iqs[i % iqs.length],
          reaction: reactions[i % reactions.length],
        ),
      ),
  };
}

void _checkInvariants(GameState s) {
  final ids = s.allCards.map((c) => c.id).toList();
  expect(ids.toSet(), hasLength(ids.length), reason: 'duplicate card');
  expect(ids, hasLength(s.nextCardId), reason: 'card lost or created');
  for (final p in s.players) {
    expect(p.lives, inInclusiveRange(0, s.rules.startLives));
    expect(p.hand.any((c) => c.kind == CardKind.bomb), isFalse);
  }
  expect(s.target.isNumber, isTrue);
  if (!s.isOver) {
    expect(s.player(s.turn.playerId).isAlive, isTrue);
    expect(s.aliveCount, greaterThan(1));
  } else {
    expect(s.aliveCount, lessThanOrEqualTo(1));
  }
}

void main() {
  group('rng', () {
    test('same seed → same sequence; values in range', () {
      final a = Rng.seeded(123), b = Rng.seeded(123), c = Rng.seeded(124);
      final sa = [for (var i = 0; i < 50; i++) a.nextInt(10)];
      expect([for (var i = 0; i < 50; i++) b.nextInt(10)], sa);
      expect([for (var i = 0; i < 50; i++) c.nextInt(10)], isNot(sa));
      expect(sa.every((v) => v >= 0 && v < 10), isTrue);
      expect(sa.toSet().length, greaterThan(5));
    });

    test('state can be saved and restored mid-sequence', () {
      final a = Rng.seeded(9)..nextUint32();
      final b = Rng.fromState(a.state);
      expect(b.nextUint32(), a.nextUint32());
    });

    test('hashUnit is deterministic and in [0, 1)', () {
      expect(hashUnit(1, 2, 3), hashUnit(1, 2, 3));
      expect(hashUnit(1, 2, 3), isNot(hashUnit(1, 2, 4)));
      for (var i = 0; i < 200; i++) {
        expect(hashUnit(i, i * 7), inInclusiveRange(0, 0.9999999999));
      }
    });
  });

  group('serialization', () {
    test('card codes round-trip', () {
      for (final c in [
        ...buildDeck(const RulesConfig()).dealable,
        Card.special(99, CardKind.bomb),
      ]) {
        expect(Card.fromJson(c.toJson()), c);
      }
    });

    test('commands round-trip', () {
      const commands = <Command>[
        PlayCard(
          playerId: 'a',
          cardId: 3,
          targetPlayerId: 'b',
          serverTs: 10,
          clientTs: 8,
        ),
        PlayReaction(playerId: 'a', cardId: 4, serverTs: 11),
        GhostNope(playerId: 'c', serverTs: 12),
        TimerExpired(serverTs: 13),
        DebugGiveCard(playerId: 'a', code: 'NOPE', serverTs: 14),
        DebugSetBomb(fuse: null, serverTs: 15),
        DebugSetTurnLimit(limitMs: 900, serverTs: 16),
        DebugSetLives(playerId: 'b', lives: 1, serverTs: 17),
        DebugSetTarget(code: 'Y4', serverTs: 18),
      ];
      for (final c in commands) {
        final json = jsonDecode(jsonEncode(c.toJson())) as Map<String, Object?>;
        expect(Command.fromJson(json).toJson(), c.toJson());
      }
    });
  });

  group('bot games', () {
    for (var players = 2; players <= 5; players++) {
      test('$players players: 25 games finish, invariants hold every step', () {
        for (var seed = 0; seed < 25; seed++) {
          final sim = Simulation(
            setup: _setup(players, seed),
            bots: _bots(players, seed),
            onStep: (state, command, events) => _checkInvariants(state),
          );
          final r = sim.run();
          expect(r.finished, isTrue, reason: 'seed $seed did not finish');
          expect(r.state.winnerId, isNotNull);
          expect(r.rejectedBotCommands, 0, reason: 'seed $seed');
        }
      });
    }
  });

  group('replay', () {
    test('JSON replay reproduces the exact final state and events', () {
      final r = Simulation(setup: _setup(4, 77), bots: _bots(4, 77)).run();
      final decoded = Replay.decode(r.game.replay.encode());
      final again = decoded.run();
      expect(jsonEncode(again.state.toJson()), jsonEncode(r.state.toJson()));
      expect(
        again.events.map((e) => e.toJson()).toList(),
        r.game.events.map((e) => e.toJson()).toList(),
      );
    });

    test('stepping a replay part-way matches the live game at that point', () {
      final states = <String>[];
      final r = Simulation(
        setup: _setup(3, 5),
        bots: _bots(3, 5),
        onStep: (s, _, _) => states.add(jsonEncode(s.toJson())),
      ).run();
      final half = r.game.commands.length ~/ 2;
      expect(
        jsonEncode(r.game.replay.run(upTo: half).state.toJson()),
        states[half - 1],
      );
    });

    test('game state JSON round-trips mid-game', () {
      final r = Simulation(
        setup: _setup(5, 3),
        bots: _bots(5, 3),
        maxSteps: 60,
      ).run();
      final json = jsonEncode(r.state.toJson());
      final restored = GameState.fromJson(
        jsonDecode(json) as Map<String, Object?>,
      );
      expect(jsonEncode(restored.toJson()), json);
    });
  });

  group('clock', () {
    test('ManualClock', () {
      final c = ManualClock(100)..advance(50);
      expect(c.nowMs, 150);
      expect(() => c.advance(-1), throwsArgumentError);
    });

    test('ScaledClock: speed, pause, step — time stays continuous', () {
      var real = 0; // µs
      final c = ScaledClock(realMicros: () => real);
      real += 1000000;
      expect(c.nowMs, 1000);
      c.speed = 0.5;
      real += 1000000;
      expect(c.nowMs, 1500);
      c.pause();
      real += 5000000;
      expect(c.nowMs, 1500);
      c.stepPaused(20);
      expect(c.nowMs, 1520);
      c
        ..resume()
        ..speed = 2;
      real += 1000000;
      expect(c.nowMs, 3520);
    });
  });
}
