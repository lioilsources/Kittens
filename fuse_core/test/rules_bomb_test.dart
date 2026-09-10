import 'package:fuse_core/fuse_core.dart';
import 'package:test/test.dart';

import 'support/scenario.dart';

const _filler = ['B7', 'B8', 'B9', 'Y7', 'Y8', 'Y9', 'G7', 'G8', 'G9', 'B6'];

void main() {
  group('bomb', () {
    test('a drawn bomb surfaces with fuse 3 and uses up that draw', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['R2'],
          },
          deck: ['BOMB', 'G5'],
          target: 'R1',
        ),
      ).play('p1', 'R2', 1500);
      final surfaced = g.lastOf<BombSurfaced>().single;
      expect(surfaced.drawnBy, 'p1');
      expect(surfaced.fuse, 3);
      expect(g.state.bomb!.fuse, 3);
      expect(g.hand('p1'), isEmpty);
      expect(g.state.deck.map((c) => c.code), ['G5']);
    });

    test(
      'explodes on the player whose completed turn brings the fuse to 0',
      () {
        final g = G(
          scenario(
            hands: {
              'p1': ['R2', 'R5'],
              'p2': ['R3'],
              'p3': ['R4'],
            },
            deck: ['BOMB', ..._filler],
            target: 'R1',
          ),
        );
        g.play('p1', 'R2', 1500); // normal throw → draws the bomb, fuse 3
        g.play('p2', 'R3', 2000);
        expect(g.state.bomb!.fuse, 2);
        g.play('p3', 'R4', 2500);
        expect(g.state.bomb!.fuse, 1);
        g.play('p1', 'R5', 3000);
        expect(g.lastOf<BombExploded>().single.playerId, 'p1');
        expect(g.state.bomb, isNull);
        expect(
          g.state.deck.any((c) => c.kind == CardKind.bomb),
          isTrue,
          reason: 'shuffled back into the deck',
        );
        final loss = g.state.pendingLosses.single;
        expect(
          (loss.playerId, loss.amount, loss.cause),
          ('p1', 2, LifeLossCause.bomb),
        );
        g.tick(4000);
        expect(g.p('p1').lives, 1);
      },
    );

    test('Zneškodni on your turn returns the bomb to the deck, no damage', () {
      final g = G(
        scenario(
          fuse: 1,
          hands: {
            'p1': ['DEFUSE'],
          },
          deck: _filler,
        ),
      ).play('p1', 'DEFUSE', 500);
      expect(g.lastOf<BombDefused>(), hasLength(1));
      expect(g.lastOf<BombExploded>(), isEmpty);
      expect(g.state.bomb, isNull);
      expect(g.state.deck.where((c) => c.kind == CardKind.bomb), hasLength(1));
      expect(g.state.pendingLosses, isEmpty);
      expect(g.state.turn.playerId, 'p2');
    });

    test('Odpal: fuse 1, turn jumps to the target without a tick', () {
      final g = G(
        scenario(
          fuse: 3,
          hands: {
            'p1': ['DETONATE'],
            'p3': ['R2'],
          },
          deck: _filler,
        ),
      ).play('p1', 'DETONATE', 500, target: 'p3');
      expect(g.lastOf<BombRedirected>().single.targetPlayerId, 'p3');
      expect(g.lastOf<FuseTicked>(), isEmpty);
      expect(g.state.bomb!.fuse, 1);
      expect(g.state.turn.playerId, 'p3');
      expect(g.lastOf<TurnStarted>().single.reason, TurnStartReason.detonate);

      g.play('p3', 'R2', 800);
      expect(g.lastOf<BombExploded>().single.playerId, 'p3');
    });

    test('Odpal needs a living target other than yourself', () {
      final s = scenario(
        fuse: 2,
        lives: {'p2': 0},
        hands: {
          'p1': ['DETONATE'],
        },
      );
      for (final target in [null, 'p1', 'p2', 'nobody']) {
        final g = G(s).play('p1', 'DETONATE', 500, target: target);
        expect(g.rejection, RejectReason.invalidTarget, reason: '$target');
        expect(g.hand('p1'), ['DETONATE']);
      }
    });

    test('Odpal without a bomb is an invalid throw', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['DETONATE'],
          },
          deck: _filler,
        ),
      ).play('p1', 'DETONATE', 500, target: 'p2');
      expect(g.lastOf<InvalidThrow>(), hasLength(1));
    });

    test(
      'a second bomb drawn while one is active goes to the discard pile',
      () {
        final g = G(
          scenario(
            fuse: 3,
            hands: {
              'p1': ['R2'],
            },
            deck: ['BOMB', 'G5'],
            target: 'R1',
          ),
        ).play('p1', 'R2', 1500);
        expect(g.state.bomb!.fuse, 2, reason: 'the active bomb ticked');
        expect(g.hand('p1'), ['G5']);
        expect(g.state.discard.map((c) => c.code), contains('BOMB'));
        expect(g.lastOf<BombSurfaced>(), isEmpty);
      },
    );

    test('timeout at fuse 1: timeout and bomb both hit', () {
      final g = G(
        scenario(
          fuse: 1,
          hands: {
            'p1': ['G2'],
          },
          deck: _filler,
        ),
      ).tick(3000);
      expect(g.state.pendingLosses.map((l) => (l.cause, l.amount)), [
        (LifeLossCause.timeout, 1),
        (LifeLossCause.bomb, 2),
      ]);
      g.tick(4000);
      expect(g.p('p1').isGhost, isTrue);
      expect(g.state.isOver, isFalse);
    });
  });

  group('Slepá', () {
    test('target is hidden in player views for 2 turns', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['BLIND'],
            'p2': ['R2'],
            'p3': ['R3'],
          },
          deck: _filler,
          target: 'R1',
        ),
      );
      g.play('p1', 'BLIND', 500);
      expect(g.state.blindTurnsLeft, 2);
      expect(PlayerView.of(g.state, 'p2').target, isNull);
      expect(g.state.lastAction!.kind, CardKind.blind);

      g.play('p2', 'R2', 1000); // still judged against the real target
      expect(g.lastOf<CardThrown>(), hasLength(1));
      expect(g.state.blindTurnsLeft, 1);
      expect(PlayerView.of(g.state, 'p3').target, isNull);

      g.play('p3', 'R3', 1500);
      expect(g.state.blindTurnsLeft, 0);
      expect(PlayerView.of(g.state, 'p1').target!.code, 'R3');
    });
  });

  group('Otoč', () {
    test('matching becomes ±1 and a second Otoč toggles back', () {
      final g = G(
        scenario(
          hands: {
            'p1': ['TWIST'],
            'p2': ['G2', 'R1'],
            'p3': ['TWIST'],
          },
          deck: _filler,
          target: 'R1',
        ),
      );
      g.play('p1', 'TWIST', 500);
      expect(g.state.matchMode, MatchMode.twist);
      g.play('p2', 'G2', 1000); // ±1, colour ignored
      expect(g.lastOf<CardThrown>(), hasLength(1));
      g.play('p3', 'TWIST', 1500);
      expect(g.state.matchMode, MatchMode.normal);
    });
  });
}
