import 'dart:async';

import 'package:fuse_core/fuse_core.dart';

import 'transport.dart';

/// In-process "network" for puppet mode: host and every client live in one
/// app. [latency] + [jitter] emulate a real link (plan §6.3) while keeping
/// message order per channel.
final class LoopbackNetwork {
  LoopbackNetwork({
    this.latency = Duration.zero,
    this.jitter = Duration.zero,
    int seed = 1,
  }) : _rng = Rng.seeded(seed);

  Duration latency;
  Duration jitter;

  final Rng _rng;
  final _clock = Stopwatch()..start();
  final _toHost = StreamController<ClientEnvelope>();
  final _toClients = <String, StreamController<HostEnvelope>>{};
  final _lastDue = <String, int>{};
  final _timers = <Timer>{};
  bool _closed = false;

  late final HostTransport host = _LoopbackHost(this);

  ClientTransport connect(String playerId) =>
      _LoopbackClient(this, playerId, _clientController(playerId).stream);

  StreamController<HostEnvelope> _clientController(String playerId) =>
      _toClients.putIfAbsent(playerId, StreamController<HostEnvelope>.new);

  void _deliver(String channel, void Function() deliver) {
    if (_closed) return;
    final now = _clock.elapsedMicroseconds;
    var delay = latency.inMicroseconds;
    if (jitter > Duration.zero) {
      delay += (_rng.nextDouble() * jitter.inMicroseconds).round();
    }
    final last = _lastDue[channel] ?? 0;
    if (delay <= 0 && last <= now) {
      scheduleMicrotask(() {
        if (!_closed) deliver();
      });
      return;
    }
    final due = now + delay < last ? last : now + delay;
    _lastDue[channel] = due;
    late final Timer timer;
    timer = Timer(Duration(microseconds: due - now), () {
      _timers.remove(timer);
      if (!_closed) deliver();
    });
    _timers.add(timer);
  }

  Future<void> close() async {
    if (_closed) return;
    _closed = true;
    for (final t in _timers) {
      t.cancel();
    }
    _timers.clear();
    await _toHost.close();
    for (final c in _toClients.values) {
      await c.close();
    }
  }
}

final class _LoopbackHost implements HostTransport {
  _LoopbackHost(this._net);

  final LoopbackNetwork _net;

  @override
  Stream<ClientEnvelope> get incoming => _net._toHost.stream;

  @override
  void send(String playerId, HostEnvelope message) {
    final controller = _net._clientController(playerId);
    _net._deliver('to:$playerId', () => controller.add(message));
  }

  @override
  Future<void> close() => _net.close();
}

final class _LoopbackClient implements ClientTransport {
  _LoopbackClient(this._net, this.playerId, this.incoming);

  final LoopbackNetwork _net;

  @override
  final String playerId;

  @override
  final Stream<HostEnvelope> incoming;

  @override
  void send(Command command) => _net._deliver(
    'from:$playerId',
    () => _net._toHost.add(ClientEnvelope(playerId, command)),
  );

  @override
  Future<void> close() async {}
}
