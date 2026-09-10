import 'package:fuse_core/fuse_core.dart';

/// Client → host: a command from seat [playerId].
final class ClientEnvelope {
  const ClientEnvelope(this.playerId, this.command);

  final String playerId;
  final Command command;
}

/// Host → one client: what that seat may see now and the events since the
/// previous message.
final class HostEnvelope {
  const HostEnvelope({
    required this.view,
    required this.events,
    required this.version,
  });

  final PlayerView view;
  final List<GameEvent> events;
  final int version;
}

/// Host side of the link. Loopback now, MultipeerConnectivity in phase 3.
abstract interface class HostTransport {
  Stream<ClientEnvelope> get incoming;

  void send(String playerId, HostEnvelope message);

  Future<void> close();
}

abstract interface class ClientTransport {
  String get playerId;

  Stream<HostEnvelope> get incoming;

  void send(Command command);

  Future<void> close();
}
