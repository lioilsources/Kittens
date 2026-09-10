import 'package:fuse_core/fuse_core.dart';
import 'package:test/test.dart';

import 'support/scenario.dart';

const _filler = ['B7', 'B8', 'B9', 'Y7', 'Y8', 'Y9', 'G7', 'G8', 'G9', 'B6'];

void main() {
  group('Ne!', () {
    test('on Odpal: turn returns to the detonator, fuse restored', () {
      final g =
          G(
              scenario(
                fuse: 2,
                hands: {
                  'p1': ['DETONATE'],
                  'p3': ['NOPE'],
                },
                deck: _filler,
              ),
            )
            ..play('p1', 'DETONATE', 500, target: 'p3')
            ..react('p3', 'NOPE', 900);
      final noped = g.lastOf<ActionNoped>().single;
      expect((noped.byPlayerId, noped.actionKind), ('p3', CardKind.detonate));
      expect(g.state.turn.playerId, 'p1');
      expect(g.state.turn.startedAt, 900);
      expect(g.lastOf<TurnStarted>().single.reason, TurnStartReason.nopeRevert);
      expect(g.state.bomb!.fuse, 2);
      expect(g.hand('p3'), isEmpty);
    });

    test('two Ne!: the first wins, the second fizzles and is lost', () {
      final g =
          G(
              scenario(
                fuse: 2,
                hands: {
                  'p1': ['DETONATE'],
                  'p2': ['NOPE'],
                  'p3': ['NOPE'],
                },
                deck: _filler,
              ),
            )
            ..play('p1', 'DETONATE', 500, target: 'p3')
            ..react('p3', 'NOPE', 900)
            ..react('p2', 'NOPE', 950);
      expect(g.lastOf<NopeFizzled>().single.playerId, 'p2');
      expect(g.hand('p2'), isEmpty);
      expect(g.state.turn.playerId, 'p1', reason: 'second Ne! changed nothing');
      expect(g.state.bomb!.fuse, 2);
    });

    test('with nothing to cancel it is rejected and the card stays', () {
      final g = G(
        scenario(
          hands: {
            'p2': ['NOPE'],
          },
        ),
      ).react('p2', 'NOPE', 500);
      expect(g.rejection, RejectReason.nothingToNope);
      expect(g.hand('p2'), ['NOPE']);
    });

    test('window closes when the affected turn ends', () {
      final g =
          G(
              scenario(
                hands: {
                  'p1': ['TWIST'],
                  'p2': ['G2'],
                  'p3': ['NOPE'],
                },
                deck: _filler,
                target: 'R1',
              ),
            )
            ..play('p1', 'TWIST', 500)
            ..play('p2', 'G2', 800)
            ..react('p3', 'NOPE', 900);
      expect(g.rejection, RejectReason.nothingToNope);
      expect(g.state.matchMode, MatchMode.twist);
    });

    test('window closes after nopeWindowMs', () {
      final s = scenario(
        hands: {
          'p1': ['TWIST'],
          'p3': ['NOPE'],
        },
        deck: _filler,
      );
      final late = G(s)
        ..play('p1', 'TWIST', 500)
        ..react('p3', 'NOPE', 2501);
      expect(late.rejection, RejectReason.nothingToNope);

      final onTime = G(s)
        ..play('p1', 'TWIST', 500)
        ..react('p3', 'NOPE', 2500);
      expect(onTime.lastOf<ActionNoped>().single.actionKind, CardKind.twist);
      expect(onTime.state.matchMode, MatchMode.normal);
    });

    test('on Zneškodni: the bomb comes back with its fuse', () {
      final g =
          G(
              scenario(
                fuse: 1,
                hands: {
                  'p1': ['DEFUSE'],
                  'p2': ['NOPE'],
                },
                deck: _filler,
              ),
            )
            ..play('p1', 'DEFUSE', 500)
            ..react('p2', 'NOPE', 700);
      expect(g.lastOf<ActionNoped>(), hasLength(1));
      expect(g.state.bomb!.fuse, 1);
      expect(g.state.deck.where((c) => c.kind == CardKind.bomb), isEmpty);
      expect(
        g.state.allCards.where((c) => c.kind == CardKind.bomb),
        hasLength(1),
      );
    });

    test('on Slepá: target visible again', () {
      final g =
          G(
              scenario(
                hands: {
                  'p1': ['BLIND'],
                  'p2': ['NOPE'],
                },
                deck: _filler,
              ),
            )
            ..play('p1', 'BLIND', 500)
            ..react('p2', 'NOPE', 700);
      expect(g.state.blindTurnsLeft, 0);
      expect(PlayerView.of(g.state, 'p2').target, isNotNull);
    });
  });

  group('Kradež', () {
    GameState base({int? fuse}) => scenario(
      fuse: fuse,
      hands: {
        'p1': ['G2', 'NOPE'],
        'p3': ['STEAL', 'R2'],
      },
      deck: ['B5', 'B6', ..._filler],
      target: 'R1',
    );

    test('after > 2.0 s: victim draws 2, stealer gets a fresh turn', () {
      final g = G(base()).react('p3', 'STEAL', 2001, target: 'p1');
      final stolen = g.lastOf<TurnStolen>().single;
      expect(
        (stolen.byPlayerId, stolen.fromPlayerId, stolen.hesitationMs),
        ('p3', 'p1', 2001),
      );
      expect(g.hand('p1'), ['G2', 'NOPE', 'B5', 'B6']);
      expect(g.state.turn.playerId, 'p3');
      expect(g.state.turn.startedAt, 2001);
      expect(g.lastOf<TurnStarted>().single.reason, TurnStartReason.steal);
      expect(g.state.pendingLosses, isEmpty);
      expect(g.hand('p3'), ['R2']);
    });

    test('at exactly 2.0 s it is too early', () {
      final g = G(base()).react('p3', 'STEAL', 2000, target: 'p1');
      expect(g.rejection, RejectReason.tooEarly);
      expect(g.hand('p3'), contains('STEAL'));
    });

    test('only the player on turn can be robbed, never yourself', () {
      expect(
        G(base()).react('p3', 'STEAL', 2500, target: 'p2').rejection,
        RejectReason.invalidTarget,
      );
      final own = G(
        scenario(
          hands: {
            'p1': ['STEAL'],
          },
        ),
      ).react('p1', 'STEAL', 2500);
      expect(own.rejection, RejectReason.ownTurn);
    });

    test('no fuse tick: the stealer inherits the bomb', () {
      final g = G(base(fuse: 1))..react('p3', 'STEAL', 2100, target: 'p1');
      expect(g.state.bomb!.fuse, 1);
      expect(g.lastOf<TurnStolen>().single.fuse, 1);
      g.play('p3', 'R2', 2200);
      expect(g.lastOf<BombExploded>().single.playerId, 'p3');
    });

    test('Ne! on Kradež: turn and drawn cards go back', () {
      final g = G(base())
        ..react('p3', 'STEAL', 2100, target: 'p1')
        ..react('p1', 'NOPE', 2300);
      expect(g.lastOf<ActionNoped>().single.actionKind, CardKind.steal);
      expect(g.hand('p1'), ['G2']);
      expect(g.state.deck.take(3).map((c) => c.code), ['B5', 'B6', 'B7']);
      expect(g.state.turn.playerId, 'p1');
      expect(g.state.turn.startedAt, 2300);
    });
  });

  group('Štít', () {
    GameState base({int? fuse, List<String> p1 = const ['G2', 'SHIELD']}) =>
        scenario(
          fuse: fuse,
          hands: {
            'p1': p1,
            'p2': ['NOPE'],
          },
          deck: _filler,
          target: 'R1',
        );

    test('within 1.0 s of the life loss it saves the life', () {
      final g = G(base())
        ..play('p1', 'G2', 500)
        ..react('p1', 'SHIELD', 1400);
      final used = g.lastOf<ShieldUsed>().single;
      expect((used.saved, used.remaining), (1, 0));
      expect(g.state.pendingLosses, isEmpty);
      g.tick(1500);
      expect(g.lastOf<LifeLost>(), isEmpty);
      expect(g.p('p1').lives, 3);
    });

    test('exactly at the end of the window still counts', () {
      final g = G(base())
        ..play('p1', 'G2', 500)
        ..react('p1', 'SHIELD', 1500);
      expect(g.lastOf<ShieldUsed>(), hasLength(1));
    });

    test('after the window it is rejected and the life is gone', () {
      final g = G(base())
        ..play('p1', 'G2', 500)
        ..react('p1', 'SHIELD', 1501);
      expect(g.rejection, RejectReason.noPendingLoss);
      expect(g.p('p1').lives, 2);
      expect(g.hand('p1'), contains('SHIELD'));
    });

    test('saves one of the two bomb lives', () {
      final g = G(base(fuse: 1, p1: ['R2', 'SHIELD']))
        ..play('p1', 'R2', 500)
        ..react('p1', 'SHIELD', 900)
        ..tick(1500);
      expect(g.p('p1').lives, 2);
    });

    test('Ne! on Štít restores the pending loss', () {
      final g = G(base())
        ..play('p1', 'G2', 500)
        ..react('p1', 'SHIELD', 800)
        ..react('p2', 'NOPE', 900);
      expect(g.lastOf<ActionNoped>().single.actionKind, CardKind.shield);
      expect(g.state.pendingLosses.single.amount, 1);
      g.tick(1500);
      expect(g.p('p1').lives, 2);
    });
  });

  group('duch', () {
    test('may Ne! once per round without a card', () {
      final g =
          G(
              scenario(
                lives: {'p3': 0},
                hands: {
                  'p1': ['G2', 'SHIELD', 'SHIELD'],
                },
                deck: _filler,
                target: 'R1',
              ),
            )
            ..play('p1', 'G2', 500)
            ..react('p1', 'SHIELD', 600)
            ..ghostNope('p3', 700);
      expect(g.lastOf<ActionNoped>().single.ghost, isTrue);
      expect(g.state.pendingLosses, hasLength(1));

      g
        ..react('p1', 'SHIELD', 800)
        ..ghostNope('p3', 900);
      expect(g.rejection, RejectReason.ghostNopeUsed);
      g.tick(1500);
      expect(g.p('p1').lives, 3);
    });

    test('cannot use other reactions; the living cannot ghost-Ne!', () {
      final s = scenario(
        lives: {'p3': 0},
        hands: {
          'p3': ['STEAL', 'SHIELD'],
        },
      );
      expect(
        G(s).react('p3', 'STEAL', 2500, target: 'p1').rejection,
        RejectReason.ghost,
      );
      expect(G(s).ghostNope('p2', 2500).rejection, RejectReason.notGhost);
    });

    test('when rules require a card, a ghost uses a real Ne! card', () {
      final s = scenario(
        rules: const RulesConfig(ghostNopeNeedsCard: true),
        lives: {'p3': 0},
        hands: {
          'p1': ['TWIST'],
          'p3': ['NOPE'],
        },
        deck: _filler,
      );
      expect(
        (G(s)..play('p1', 'TWIST', 500)).ghostNope('p3', 600).rejection,
        RejectReason.ghostNeedsCard,
      );
      final g = G(s)
        ..play('p1', 'TWIST', 500)
        ..react('p3', 'NOPE', 600);
      expect(g.lastOf<ActionNoped>().single.ghost, isTrue);
    });
  });
}
