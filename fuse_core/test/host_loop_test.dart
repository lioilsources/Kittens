import 'package:fuse_core/fuse_core.dart';
import 'package:test/test.dart';

const _seats = [PlayerSeat('p1', 'P1'), PlayerSeat('p2', 'P2')];

HostLoop _loop({Map<String, Bot>? bots}) => HostLoop(
  RecordedGame(const GameSetup(players: _seats, seed: 11)),
  bots: bots,
);

/// Gives p1 a card that surely matches and returns its id.
int _armP1(HostLoop loop) {
  loop
    ..submit(const DebugSetTarget(code: 'R1', serverTs: 0), 0)
    ..submit(const DebugGiveCard(playerId: 'p1', code: 'R5', serverTs: 0), 0);
  return loop.state.player('p1').hand.lastWhere((c) => c.code == 'R5').id;
}

void main() {
  test('advanceTo applies what is due by now, nothing later', () {
    final loop = _loop();
    expect(loop.peek()!.command, isA<TimerExpired>());
    expect(loop.peek()!.at, 3000);
    expect(loop.advanceTo(2999), isEmpty);
    final steps = loop.advanceTo(3000);
    expect(steps, hasLength(1));
    expect(loop.state.turn.playerId, 'p2');
  });

  test('a human throw exactly at the deadline is on time', () {
    final loop = _loop();
    final cardId = _armP1(loop);
    final steps = loop.submit(
      PlayCard(playerId: 'p1', cardId: cardId, serverTs: 0),
      3000,
    );
    expect(steps, hasLength(1), reason: 'no TimerExpired before it');
    expect(steps.single.step.events.whereType<CardThrown>(), hasLength(1));
  });

  test('a human throw after the deadline comes too late', () {
    final loop = _loop();
    final cardId = _armP1(loop);
    final steps = loop.submit(
      PlayCard(playerId: 'p1', cardId: cardId, serverTs: 0),
      3001,
    );
    expect(steps.first.command, isA<TimerExpired>());
    expect(steps.last.rejected, isTrue);
    expect(loop.state.lastTs, 3001);
  });

  test('bots act through the loop; setBot(null) hands the seat to a human', () {
    final loop = _loop(
      bots: {
        'p1': const BasicBot(profile: BotProfile(reaction: FixedReaction(400))),
        'p2': const BasicBot(profile: BotProfile(reaction: FixedReaction(400))),
      },
    );
    final steps = loop.advanceTo(5000);
    expect(steps.where((s) => s.botId != null), isNotEmpty);

    loop.setBot('p1', null);
    for (var i = 0; i < 40 && !loop.state.isOver; i++) {
      expect(loop.stepNext()!.botId, isNot('p1'));
    }
  });
}
