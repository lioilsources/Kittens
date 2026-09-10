import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fuse/session/client_session.dart';
import 'package:fuse/session/host_session.dart';
import 'package:fuse/session/seat.dart';
import 'package:fuse/transport/loopback_transport.dart';
import 'package:fuse_core/fuse_core.dart';

const _seats = [
  SeatConfig(id: 'p1', name: 'Ty', mode: SeatMode.human),
  SeatConfig(id: 'p2', name: 'Bot', reaction: ReactionPreset.fast),
  SeatConfig(id: 'p3', name: 'Pauza', mode: SeatMode.paused),
];

final class _Rig {
  _Rig(FakeAsync async, {List<SeatConfig> seats = _seats, double speed = 1}) {
    final game = RecordedGame(
      GameSetup(
        players: [for (final s in seats) PlayerSeat(s.id, s.name)],
        seed: 4,
      ),
    );
    host = HostSession(
      game: game,
      seats: seats,
      transport: network.host,
      speed: speed,
      realMicros: () => async.elapsed.inMicroseconds,
    );
    for (final s in seats) {
      clients[s.id] = ClientSession(
        network.connect(s.id),
        nowMs: () => host.clock.nowMs,
      )..start();
    }
    host.start();
    async.flushMicrotasks();
  }

  final network = LoopbackNetwork();
  late final HostSession host;
  final clients = <String, ClientSession>{};

  Future<void> dispose() async {
    for (final c in clients.values) {
      await c.dispose();
    }
    await host.dispose();
    await network.close();
  }
}

void main() {
  test('starts paused; clients get their first view', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      expect(rig.host.isPaused, isTrue);
      expect(rig.clients['p1']!.latest!.view.myId, 'p1');
      async.elapse(const Duration(seconds: 10));
      expect(rig.host.state.lastTs, 0, reason: 'nothing happens while paused');
      rig.dispose();
      async.flushMicrotasks();
    });
  });

  test('the host fires the timeout; speed stretches real time', () {
    fakeAsync((async) {
      final rig = _Rig(async, speed: 0.5)..host.resume();
      async.elapse(const Duration(milliseconds: 5990));
      expect(rig.host.game.events.whereType<TurnTimedOut>(), isEmpty);
      async.elapse(const Duration(milliseconds: 20));
      expect(rig.host.game.events.whereType<TurnTimedOut>(), hasLength(1));
      rig.dispose();
      async.flushMicrotasks();
    });
  });

  test('a human throw is stamped with host time and reaches every client', () {
    fakeAsync((async) {
      final rig = _Rig(async)
        ..host.debug(const DebugSetTarget(code: 'R1', serverTs: 0))
        ..host.debug(
          const DebugGiveCard(playerId: 'p1', code: 'R5', serverTs: 0),
        )
        ..host.resume();
      async
        ..flushMicrotasks()
        ..elapse(const Duration(milliseconds: 700));
      final client = rig.clients['p1']!;
      final card = client.latest!.view.me.hand.lastWhere((c) => c.code == 'R5');
      client.throwCard(card);
      async.flushMicrotasks();

      final thrown = rig.host.game.events.whereType<CardThrown>().single;
      expect(thrown.playerId, 'p1');
      expect(thrown.throwMs, 700);
      expect(thrown.draw, 0);
      expect(rig.clients['p3']!.latest!.view.target!.code, 'R5');
      rig.dispose();
      async.flushMicrotasks();
    });
  });

  test('clients cannot act for another seat or send debug commands', () {
    fakeAsync((async) {
      final rig = _Rig(async)..host.resume();
      final before = rig.host.game.commands.length;
      rig.network
          .connect('p1')
          .send(const DebugSetLives(playerId: 'p2', lives: 0, serverTs: 0));
      final p2Card = rig.host.state.player('p2').hand.first;
      rig.network
          .connect('p1')
          .send(PlayCard(playerId: 'p2', cardId: p2Card.id, serverTs: 0));
      async.flushMicrotasks();
      expect(rig.host.game.commands.length, before);
      rig.dispose();
      async.flushMicrotasks();
    });
  });

  test('step jumps to the next scheduled action while paused', () {
    fakeAsync((async) {
      final rig = _Rig(async);
      rig.host.step();
      expect(rig.host.isPaused, isTrue);
      expect(rig.host.clock.nowMs, 3000);
      expect(rig.host.game.events.whereType<TurnTimedOut>(), hasLength(1));
      rig.dispose();
      async.flushMicrotasks();
    });
  });

  test('a long run with bots matches its own replay', () {
    fakeAsync((async) {
      final rig = _Rig(
        async,
        seats: const [
          SeatConfig(id: 'a', name: 'A', reaction: ReactionPreset.fast),
          SeatConfig(id: 'b', name: 'B', iq: BotIq.sloppy),
          SeatConfig(id: 'c', name: 'C', iq: BotIq.firstValid),
        ],
      )..host.resume();
      async.elapse(const Duration(minutes: 5));
      expect(rig.host.state.isOver, isTrue);
      final replayed = rig.host.replay.run();
      expect(replayed.state.toJson(), rig.host.state.toJson());
      rig.dispose();
      async.flushMicrotasks();
    });
  });
}
