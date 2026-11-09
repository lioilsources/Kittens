import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuse_core/fuse_core.dart';

import '../session/client_session.dart';
import '../session/host_session.dart';
import '../session/puppet_session.dart';
import '../session/scenario.dart';
import '../session/seat.dart';

/// The running local game, or null on the setup screen.
final sessionProvider = NotifierProvider<SessionNotifier, PuppetSession?>(
  SessionNotifier.new,
);

class SessionNotifier extends Notifier<PuppetSession?> {
  PuppetSession? _current;
  NewGameConfig? _lastConfig;
  Scenario? _lastScenario;

  @override
  PuppetSession? build() {
    ref.onDispose(() => _current?.dispose());
    return null;
  }

  void startNew(NewGameConfig config, {bool startPaused = true}) {
    _lastConfig = config;
    _lastScenario = null;
    _replace(
      PuppetSession.create(
        game: RecordedGame(config.toSetup()),
        seats: config.seats,
        speed: config.speed,
        startPaused: startPaused,
      ),
    );
  }

  void startScenario(Scenario scenario, {bool startPaused = true}) {
    _lastScenario = scenario;
    _lastConfig = null;
    _replace(
      PuppetSession.create(
        game: scenario.buildGame(),
        seats: scenario.seats,
        speed: scenario.speed,
        viewAs: scenario.viewAs,
        autoFollow: scenario.autoFollow,
        title: scenario.name,
        description: scenario.description,
        startPaused: startPaused,
      ),
    );
  }

  /// Continues a game from an exported replay: you take the first seat.
  void loadReplay(Replay replay, {String title = 'Replay'}) {
    _lastConfig = null;
    _lastScenario = null;
    final players = replay.setup.players;
    _replace(
      PuppetSession.create(
        game: replay.run(),
        seats: [
          for (var i = 0; i < players.length; i++)
            SeatConfig(
              id: players[i].id,
              name: players[i].name,
              mode: i == 0 ? SeatMode.human : SeatMode.bot,
            ),
        ],
        title: title,
      ),
    );
  }

  bool get canPlayAgain => _lastConfig != null || _lastScenario != null;

  void playAgain() {
    final config = _lastConfig;
    final scenario = _lastScenario;
    if (config != null) {
      startNew(config.withSeed(config.seed + 1));
    } else if (scenario != null) {
      startScenario(scenario);
    }
  }

  void quit() => _replace(null);

  void _replace(PuppetSession? next) {
    final old = _current;
    _current = next;
    state = next;
    old?.dispose();
  }
}

/// Host-side snapshot for the puppet bar and the debug panel.
final hostProvider = NotifierProvider<HostNotifier, HostUpdate?>(
  HostNotifier.new,
);

class HostNotifier extends Notifier<HostUpdate?> {
  @override
  HostUpdate? build() {
    final session = ref.watch(sessionProvider);
    if (session == null) return null;
    final sub = session.host.updates.listen((u) => state = u);
    ref.onDispose(sub.cancel);
    return session.host.latest;
  }
}

/// What one seat sees, delivered through its client session.
final viewProvider =
    NotifierProvider.family<ViewNotifier, ClientSnapshot?, String>(
      ViewNotifier.new,
    );

class ViewNotifier extends Notifier<ClientSnapshot?> {
  ViewNotifier(this.playerId);

  final String playerId;

  @override
  ClientSnapshot? build() {
    final client = ref.watch(sessionProvider)?.clients[playerId];
    if (client == null) return null;
    final sub = client.updates.listen((s) => state = s);
    ref.onDispose(sub.cancel);
    return client.latest;
  }
}

final class PuppetState {
  const PuppetState({required this.viewAs, required this.autoFollow});

  /// Whose hand you see and for whom you throw.
  final String viewAs;

  /// Switch the view to the human player on turn.
  final bool autoFollow;

  PuppetState copyWith({String? viewAs, bool? autoFollow}) => PuppetState(
    viewAs: viewAs ?? this.viewAs,
    autoFollow: autoFollow ?? this.autoFollow,
  );
}

final puppetProvider = NotifierProvider<PuppetNotifier, PuppetState>(
  PuppetNotifier.new,
);

class PuppetNotifier extends Notifier<PuppetState> {
  @override
  PuppetState build() {
    final session = ref.watch(sessionProvider);
    ref.listen(hostProvider, (previous, next) {
      if (next == null || !state.autoFollow) return;
      if (previous?.state.turn.seq == next.state.turn.seq) return;
      final onTurn = next.state.turn.playerId;
      if (next.seats[onTurn]?.mode == SeatMode.human &&
          onTurn != state.viewAs) {
        state = state.copyWith(viewAs: onTurn);
      }
    });
    return PuppetState(
      viewAs: session?.viewAs ?? '',
      autoFollow: session?.autoFollow ?? false,
    );
  }

  void viewAs(String playerId) => state = state.copyWith(viewAs: playerId);

  void setAutoFollow(bool value) => state = state.copyWith(autoFollow: value);
}
