import 'dart:async';

import 'package:fuse_core/fuse_core.dart';

import '../transport/transport.dart';

final class ClientSnapshot {
  const ClientSnapshot({
    required this.view,
    required this.events,
    required this.version,
  });

  final PlayerView view;

  /// Events since the previous snapshot — drive animations and haptics.
  final List<GameEvent> events;
  final int version;
}

/// One seat's side of the game: receives its view and sends commands. It
/// never changes game state; the host decides (plan §4).
final class ClientSession {
  ClientSession(this.transport, {required this.nowMs});

  final ClientTransport transport;

  /// Estimate of host game time. Loopback reads the host clock directly;
  /// the network transport will add a measured offset.
  final int Function() nowMs;

  final _updates = StreamController<ClientSnapshot>.broadcast();
  StreamSubscription<HostEnvelope>? _incoming;
  ClientSnapshot? _latest;

  String get playerId => transport.playerId;
  ClientSnapshot? get latest => _latest;
  Stream<ClientSnapshot> get updates => _updates.stream;

  void start() {
    _incoming = transport.incoming.listen((m) {
      final snapshot = ClientSnapshot(
        view: m.view,
        events: m.events,
        version: m.version,
      );
      _latest = snapshot;
      if (!_updates.isClosed) _updates.add(snapshot);
    });
  }

  void throwCard(Card card, {String? targetPlayerId}) {
    final t = nowMs();
    transport.send(
      PlayCard(
        playerId: playerId,
        cardId: card.id,
        targetPlayerId: targetPlayerId,
        serverTs: t,
        clientTs: t,
      ),
    );
  }

  void react(Card card, {String? targetPlayerId}) {
    final t = nowMs();
    transport.send(
      PlayReaction(
        playerId: playerId,
        cardId: card.id,
        targetPlayerId: targetPlayerId,
        serverTs: t,
        clientTs: t,
      ),
    );
  }

  void ghostNope() {
    final t = nowMs();
    transport.send(GhostNope(playerId: playerId, serverTs: t, clientTs: t));
  }

  Future<void> dispose() async {
    await _incoming?.cancel();
    await _updates.close();
  }
}
