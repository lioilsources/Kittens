import 'package:fuse_core/fuse_core.dart';
import 'package:test/test.dart';

import 'support/scenario.dart';

const _filler = ['B7', 'B8', 'B9', 'Y7', 'Y8', 'Y9', 'G7', 'G8', 'G9', 'B6'];

void main() {
  group('setup', () {
    test('deck v1 has 72 cards with the planned composition', () {
      final d = buildDeck(const RulesConfig());
      final all = [...d.dealable, ...d.afterDeal];
      expect(all, hasLength(72));
      expect(all.map((c) => c.id).toSet(), hasLength(72));
      int count(CardKind k) => all.where((c) => c.kind == k).length;
      expect(count(CardKind.number), 40);
      expect(count(CardKind.bomb), 4);
      expect(count(CardKind.defuse), 6);
      expect(count(CardKind.detonate), 4);
      expect(count(CardKind.nope), 6);
      expect(count(CardKind.shield), 4);
      expect(count(CardKind.steal), 4);
      expect(count(CardKind.twist), 2);
      expect(count(CardKind.blind), 2);
      expect(
        d.afterDeal.every(
          (c) => c.kind == CardKind.bomb || c.kind == CardKind.defuse,
        ),
        isTrue,
      );
    });

    for (var n = 2; n <= 5; n++) {
      test('$n players: 3 lives, 5 cards, no bombs/defuses dealt', () {
        final step = GameEngine.newGame(
          GameSetup(
            players: [for (var i = 1; i <= n; i++) PlayerSeat('p$i', 'P$i')],
            seed: 42 + n,
          ),
        );
        final s = step.state;
        expect(s.players, hasLength(n));
        for (final p in s.players) {
          expect(p.lives, 3);
          expect(p.hand, hasLength(5));
          expect(
            p.hand.any(
              (c) => c.kind == CardKind.bomb || c.kind == CardKind.defuse,
            ),
            isFalse,
          );
        }
        expect(s.target.isNumber, isTrue);
        expect(s.allCards, hasLength(72));
        expect(s.turn.playerId, 'p1');
        expect(s.turn.seq, 1);
        expect(s.turn.limitMs, 3000);
        expect(step.events.first, isA<GameStarted>());
        expect(step.events.last, isA<TurnStarted>());
      });
    }

    test('player count outside 2–5 is refused', () {
      for (final n in [1, 6]) {
        expect(
          () => GameEngine.newGame(
            GameSetup(
              players: [for (var i = 1; i <= n; i++) PlayerSeat('p$i', 'P')],
              seed: 1,
            ),
          ),
          throwsArgumentError,
        );
      }
    });

    test('same seed → identical deal, different seed → different deal', () {
      String deal(int seed) => GameEngine.newGame(
        GameSetup(
          players: const [PlayerSeat('a', 'A'), PlayerSeat('b', 'B')],
          seed: seed,
        ),
      ).state.toJson().toString();
      expect(deal(5), deal(5));
      expect(deal(5), isNot(deal(6)));
    });
  });

  group('matching', () {
    Card c(String code) => Card.parseCode(code, 0);

    test('colour or number matches', () {
      expect(matchesTarget(c('R3'), c('R9'), MatchMode.normal), isTrue);
      expect(matchesTarget(c('G9'), c('R9'), MatchMode.normal), isTrue);
      expect(matchesTarget(c('G3'), c('R9'), MatchMode.normal), isFalse);
    });

    test('Otoč: number ±1, colour ignored', () {
      expect(matchesTarget(c('G4'), c('R5'), MatchMode.twist), isTrue);
      expect(matchesTarget(c('G6'), c('R5'), MatchMode.twist), isTrue);
      expect(matchesTarget(c('R5'), c('R5'), MatchMode.twist), isFalse);
      expect(matchesTarget(c('R7'), c('R5'), MatchMode.twist), isFalse);
    });

    test('action cards: wild vs. bomb-only vs. never', () {
      final noBomb = scenario();
      final withBomb = scenario(fuse: 2);
      expect(isValidThrow(noBomb, c('TWIST')), isTrue);
      expect(isValidThrow(noBomb, c('BLIND')), isTrue);
      expect(isValidThrow(noBomb, c('DEFUSE')), isFalse);
      expect(isValidThrow(withBomb, c('DEFUSE')), isTrue);
      expect(isValidThrow(withBomb, c('DETONATE')), isTrue);
      for (final code in ['NOPE', 'SHIELD', 'STEAL']) {
        expect(isValidThrow(withBomb, c(code)), isFalse, reason: code);
      }
    });
  });

  group('throw reward', () {
    GameState base() => scenario(
      hands: {
        'p1': ['R5', 'G2'],
      },
      deck: _filler,
      target: 'R1',
    );

    test('≤ 1.0 s → draw 0; the card becomes the target; turn passes', () {
      final g = G(base()).play('p1', 'R5', 1000);
      expect(g.hand('p1'), ['G2']);
      expect(g.state.target.code, 'R5');
      expect(g.state.discard.map((c) => c.code), contains('R1'));
      expect(g.lastOf<CardThrown>().single.draw, 0);
      expect(g.state.turn.playerId, 'p2');
      expect(g.state.turn.startedAt, 1000);
    });

    test('1.0 s – limit → draw 1', () {
      final g = G(base()).play('p1', 'R5', 1001);
      expect(g.hand('p1'), ['G2', 'B7']);
      expect(g.lastOf<CardThrown>().single.draw, 1);
    });

    test('a throw exactly at the limit is still on time', () {
      final g = G(base()).play('p1', 'R5', 3000);
      expect(g.lastOf<TurnTimedOut>(), isEmpty);
      expect(g.lastOf<CardThrown>().single.draw, 1);
      expect(g.state.pendingLosses, isEmpty);
    });

    test('only the player on turn may throw', () {
      final s = scenario(
        hands: {
          'p1': ['R5'],
          'p2': ['R6'],
        },
      );
      final g = G(s).play('p2', 'R6', 500);
      expect(g.rejection, RejectReason.notYourTurn);
      expect(g.state.toJson(), s.toJson()..['lastTs'] = 500);
    });
  });

  group('timeout', () {
    test('−1 life after the shield window, draw 2, next player', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['G2'],
          },
          deck: _filler,
        ),
      ).tick(3000);
      expect(g.lastOf<TurnTimedOut>().single.playerId, 'p1');
      expect(g.hand('p1'), ['G2', 'B7', 'B8']);
      expect(g.state.turn.playerId, 'p2');
      expect(g.state.turn.startedAt, 3000);
      final loss = g.state.pendingLosses.single;
      expect(loss.cause, LifeLossCause.timeout);
      expect(loss.deadline, 4000);
      expect(g.p('p1').lives, 3, reason: 'not committed yet');

      g.tick(4000);
      expect(g.p('p1').lives, 2);
      expect(g.lastOf<LifeLost>().single.cause, LifeLossCause.timeout);
    });

    test('a tick before the deadline does nothing', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['G2'],
          },
        ),
      ).tick(2999);
      expect(g.last, isEmpty);
      expect(g.state.turn.playerId, 'p1');
    });

    test(
      'host late: a throw after the deadline is judged after the timeout',
      () {
        final g = G(
          scenario(
            hands: {
              'p1': ['R2'],
            },
            deck: _filler,
          ),
        ).play('p1', 'R2', 3500);
        expect(g.lastOf<TurnTimedOut>(), hasLength(1));
        expect(g.rejection, RejectReason.notYourTurn);
        expect(g.hand('p1'), contains('R2'));
      },
    );

    test('commands must not go back in time', () {
      final g = G(
        scenario(
          turnStartedAt: 1000,
          hands: {
            'p1': ['R2'],
          },
        ),
      ).play('p1', 'R2', 999);
      expect(g.rejection, RejectReason.timeTravel);
    });
  });

  group('invalid throw', () {
    test('card bounces back, −1 life, draw 2, turn passes', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['G2'],
          },
          deck: _filler,
          target: 'R1',
        ),
      ).play('p1', 'G2', 500);
      expect(g.lastOf<InvalidThrow>().single.card.code, 'G2');
      expect(g.hand('p1'), ['G2', 'B7', 'B8']);
      expect(g.state.pendingLosses.single.cause, LifeLossCause.invalidCard);
      expect(g.state.target.code, 'R1');
      expect(g.state.turn.playerId, 'p2');
    });

    test('a reaction card thrown onto the deck is invalid', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['NOPE'],
          },
          deck: _filler,
        ),
      ).play('p1', 'NOPE', 500);
      expect(g.lastOf<InvalidThrow>(), hasLength(1));
    });

    test('Zneškodni without a bomb is invalid', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['DEFUSE'],
          },
          deck: _filler,
        ),
      ).play('p1', 'DEFUSE', 500);
      expect(g.lastOf<InvalidThrow>(), hasLength(1));
      expect(g.hand('p1'), contains('DEFUSE'));
    });
  });

  group('turn order & limit', () {
    test('turn passes in seat order and wraps', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['R2', 'R5'],
            'p2': ['R3'],
            'p3': ['R4'],
          },
          deck: _filler,
        ),
      );
      g.play('p1', 'R2', 500).play('p2', 'R3', 1000).play('p3', 'R4', 1500);
      expect(g.state.turn.playerId, 'p1');
      expect(g.state.turn.seq, 4);
    });

    test('ghosts are skipped', () {
      final g = G(
        scenario(
          lives: {'p2': 0},
          hands: {
            'p1': ['R2'],
          },
          deck: _filler,
        ),
      ).play('p1', 'R2', 500);
      expect(g.state.turn.playerId, 'p3');
    });

    test('limit: −250 ms per round, min 1.5 s', () {
      const r = RulesConfig();
      expect(r.turnLimitFor(round: 0, eliminations: 0), 3000);
      expect(r.turnLimitFor(round: 1, eliminations: 0), 2750);
      expect(r.turnLimitFor(round: 6, eliminations: 0), 1500);
      expect(r.turnLimitFor(round: 20, eliminations: 0), 1500);
      final e = r.copyWith(limitDecay: LimitDecay.perElimination);
      expect(e.turnLimitFor(round: 5, eliminations: 0), 3000);
      expect(e.turnLimitFor(round: 5, eliminations: 2), 2500);
    });

    test('the engine shortens the limit when a new round starts', () {
      final g = G(
        scenario(
          players: 2,
          hands: {
            'p1': ['G2'],
            'p2': ['G3'],
          },
          deck: [..._filler, ..._filler],
        ),
      );
      g.tick(3000); // p1 times out → p2 (round 0)
      expect(g.state.turn.limitMs, 3000);
      g.tick(6000); // p2 times out → p1 (round 1)
      expect(g.state.round, 1);
      expect(g.state.turn.limitMs, 2750);
      expect(g.allOf<TurnLimitChanged>().single.limitMs, 2750);
      expect(g.state.nextDeadline, 7000);
    });
  });

  group('deck', () {
    test('empty deck reshuffles the discard pile; target stays out', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['R2'],
          },
          deck: const [],
          discard: ['G5', 'G6'],
          target: 'R1',
        ),
      ).play('p1', 'R2', 1500);
      expect(g.lastOf<DeckReshuffled>().single.size, 3);
      expect(g.p('p1').hand, hasLength(1));
      expect(g.state.deck, hasLength(2));
      expect(g.state.target.code, 'R2');
    });

    test('with no cards anywhere the draw is simply smaller', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['G2'],
          },
        ),
      ).play('p1', 'G2', 500);
      // invalid → penalty draw 2; only the old target R1 is not drawable
      expect(g.hand('p1'), ['G2']);
      expect(g.lastOf<CardsDrawn>(), isEmpty);
    });
  });

  group('game over', () {
    test('the last living player wins; later commands are rejected', () {
      final g = G(
        scenario(
          players: 2,
          lives: {'p2': 1},
          turnPlayer: 'p2',
          hands: {
            'p2': ['G2'],
          },
          deck: _filler,
        ),
      );
      g.tick(3000).tick(4000);
      expect(g.p('p2').isGhost, isTrue);
      expect(g.lastOf<PlayerBecameGhost>().single.playerId, 'p2');
      expect(g.state.isOver, isTrue);
      expect(g.state.winnerId, 'p1');
      expect(g.state.nextDeadline, isNull);
      g.tick(5000);
      expect(g.rejection, RejectReason.gameOver);
    });

    test('the player on turn becoming a ghost passes the turn on', () {
      // p1 timed out earlier and is on turn again when the loss commits.
      final s = scenario(lives: {'p1': 1}, deck: _filler);
      final g = G(s).tick(3000); // p1 → p2, loss due 4000
      g
        ..cmd(const DebugSetTurnLimit(limitMs: 400, serverTs: 3000))
        ..tick(3400) // p2 → p3
        ..tick(3800); // p3 → p1
      expect(g.state.turn.playerId, 'p1');
      g.tick(4000);
      expect(g.p('p1').isGhost, isTrue);
      expect(g.state.turn.playerId, 'p2');
      expect(g.lastOf<TurnStarted>().single.reason, TurnStartReason.ghostSkip);
    });
  });

  group('debug commands', () {
    test('give card takes it from the deck, or mints a new one', () {
      final g = G(scenario(deck: ['NOPE', 'B2']))
        ..cmd(const DebugGiveCard(playerId: 'p2', code: 'NOPE', serverTs: 0))
        ..cmd(const DebugGiveCard(playerId: 'p2', code: 'SHIELD', serverTs: 0));
      expect(g.hand('p2'), ['NOPE', 'SHIELD']);
      expect(g.state.deck.map((c) => c.code), ['B2']);
      final ids = g.state.allCards.map((c) => c.id);
      expect(ids.toSet(), hasLength(ids.length));
    });

    test('set bomb / turn limit / lives / target', () {
      final g = G(scenario(deck: _filler))
        ..cmd(const DebugSetBomb(fuse: 1, serverTs: 0))
        ..cmd(const DebugSetTurnLimit(limitMs: 1200, serverTs: 0))
        ..cmd(const DebugSetTarget(code: 'Y9', serverTs: 0))
        ..cmd(const DebugSetLives(playerId: 'p3', lives: 0, serverTs: 0));
      expect(g.state.bomb!.fuse, 1);
      expect(g.state.turn.limitMs, 1200);
      expect(g.state.target.code, 'Y9');
      expect(g.p('p3').isGhost, isTrue);
      expect(g.state.eliminations, 1);
    });
  });
}
