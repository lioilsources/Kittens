import 'package:fuse_core/fuse_core.dart';

import '../transport/loopback_transport.dart';
import 'client_session.dart';
import 'host_session.dart';
import 'seat.dart';

final class NewGameConfig {
  const NewGameConfig({
    required this.seats,
    required this.seed,
    this.rules = const RulesConfig(),
    this.speed = 1.0,
  });

  final List<SeatConfig> seats;
  final int seed;
  final RulesConfig rules;
  final double speed;

  GameSetup toSetup() => GameSetup(
    players: [for (final s in seats) PlayerSeat(s.id, s.name)],
    seed: seed,
    rules: rules,
  );

  NewGameConfig withSeed(int seed) =>
      NewGameConfig(seats: seats, seed: seed, rules: rules, speed: speed);
}

/// A local game on one device (plan §6.2): the host plus one loopback client
/// per seat. You can act as any seat; bots play the rest.
final class PuppetSession {
  PuppetSession._({
    required this.network,
    required this.host,
    required this.clients,
    required this.viewAs,
    required this.autoFollow,
    required this.title,
    required this.description,
  });

  factory PuppetSession.create({
    required RecordedGame game,
    required List<SeatConfig> seats,
    double speed = 1.0,
    String? viewAs,
    bool autoFollow = false,
    bool startPaused = true,
    String? title,
    String? description,
  }) {
    final network = LoopbackNetwork();
    final host = HostSession(
      game: game,
      seats: seats,
      transport: network.host,
      speed: speed,
      startPaused: startPaused,
      botSeed: game.setup.seed,
    );
    final clients = {
      for (final s in seats)
        s.id: ClientSession(
          network.connect(s.id),
          nowMs: () => host.clock.nowMs,
        )..start(),
    };
    host.start();
    final firstHuman = seats.where((s) => s.mode == SeatMode.human);
    return PuppetSession._(
      network: network,
      host: host,
      clients: clients,
      viewAs:
          viewAs ?? (firstHuman.isEmpty ? seats.first : firstHuman.first).id,
      autoFollow: autoFollow,
      title: title,
      description: description,
    );
  }

  final LoopbackNetwork network;
  final HostSession host;
  final Map<String, ClientSession> clients;
  final String viewAs;
  final bool autoFollow;
  final String? title;
  final String? description;

  Future<void> dispose() async {
    // The host goes first: its timer is cancelled synchronously, so nothing
    // can fire while the streams below are closing.
    final hostDone = host.dispose();
    final clientsDone = [for (final c in clients.values) c.dispose()];
    await hostDone;
    await Future.wait(clientsDone);
    await network.close();
  }
}
