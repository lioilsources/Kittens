import 'dart:async';

import 'package:fuse_core/fuse_core.dart';

import '../transport/transport.dart';
import 'seat.dart';

/// Snapshot for host-side tooling (puppet bar, debug panel).
final class HostUpdate {
  const HostUpdate({
    required this.state,
    required this.events,
    required this.version,
    required this.paused,
    required this.speed,
    required this.seats,
  });

  final GameState state;

  /// Events since the previous update (empty for control changes).
  final List<GameEvent> events;
  final int version;
  final bool paused;
  final double speed;
  final Map<String, SeatConfig> seats;
}

/// The authoritative host (plan §4): owns the engine via [HostLoop], the game
/// clock and the timers. Clients only send commands and receive views; the
/// host stamps `serverTs` and fires `TimerExpired` itself.
final class HostSession {
  HostSession({
    required RecordedGame game,
    required List<SeatConfig> seats,
    required this.transport,
    double speed = 1.0,
    this.startPaused = true,
    this.botSeed = 0,
    int Function()? realMicros,
  }) : clock = ScaledClock(
         realMicros: realMicros,
         speed: speed,
         startMs: game.state.lastTs,
         paused: true,
       ),
       _seats = {for (final s in seats) s.id: s} {
    loop = HostLoop(game);
    for (final s in seats) {
      loop.setBot(s.id, _botFor(s));
    }
    _emit(const []);
  }

  final ScaledClock clock;
  final HostTransport transport;
  final bool startPaused;
  late final HostLoop loop;

  final int botSeed;
  final Map<String, SeatConfig> _seats;
  final _updates = StreamController<HostUpdate>.broadcast();
  StreamSubscription<ClientEnvelope>? _incoming;
  Timer? _timer;
  int _version = 0;
  late HostUpdate _latest;
  bool _disposed = false;

  RecordedGame get game => loop.game;
  GameState get state => loop.state;
  HostUpdate get latest => _latest;
  Stream<HostUpdate> get updates => _updates.stream;
  Map<String, SeatConfig> get seats => Map.unmodifiable(_seats);
  bool get isPaused => clock.isPaused;
  Replay get replay => loop.game.replay;

  void start() {
    _incoming = transport.incoming.listen(_onClient);
    _publish(const []);
    if (!startPaused) resume();
  }

  Bot? _botFor(SeatConfig s) {
    if (s.mode != SeatMode.bot) return null;
    final index = state.players.indexWhere((p) => p.id == s.id);
    return BasicBot(profile: s.botProfile, seed: botSeed * 31 + index);
  }

  void _onClient(ClientEnvelope envelope) {
    if (_disposed) return;
    final command = envelope.command;
    final owner = switch (command) {
      PlayCard(:final playerId) ||
      PlayReaction(:final playerId) ||
      GhostNope(:final playerId) => playerId,
      _ => null, // clients never send timer or debug commands
    };
    if (owner != envelope.playerId) return;
    _apply(loop.submit(command, clock.nowMs));
  }

  void _apply(List<HostStep> steps) {
    if (steps.isNotEmpty) {
      _publish([for (final s in steps) ...s.step.events]);
    }
    _schedule();
  }

  /// One real-time timer to whatever the host must do next: a deadline or a
  /// bot's intent. Game time runs at `clock.speed`.
  void _schedule() {
    _timer?.cancel();
    _timer = null;
    if (_disposed || clock.isPaused) return;
    final next = loop.peek();
    if (next == null) return;
    final gameDelay = next.at - clock.nowMs;
    final realMs = gameDelay <= 0 ? 0 : (gameDelay / clock.speed).ceil();
    _timer = Timer(Duration(milliseconds: realMs), () {
      _timer = null;
      if (!_disposed) _apply(loop.advanceTo(clock.nowMs));
    });
  }

  void _publish(List<GameEvent> events) {
    _version++;
    final s = loop.state;
    for (final p in s.players) {
      transport.send(
        p.id,
        HostEnvelope(
          view: PlayerView.of(s, p.id),
          events: events,
          version: _version,
        ),
      );
    }
    _emit(events);
  }

  void _emit(List<GameEvent> events) {
    _latest = HostUpdate(
      state: loop.state,
      events: events,
      version: _version,
      paused: clock.isPaused,
      speed: clock.speed,
      seats: seats,
    );
    if (!_updates.isClosed) _updates.add(_latest);
  }

  // ------------------------------------------------------ debug controls

  void pause() {
    if (clock.isPaused) return;
    clock.pause();
    _schedule();
    _emit(const []);
  }

  void resume() {
    if (!clock.isPaused) return;
    clock.resume();
    _schedule();
    _emit(const []);
  }

  void setSpeed(double speed) {
    clock.speed = speed;
    _schedule();
    _emit(const []);
  }

  /// Pauses and jumps game time to the next thing the host would do.
  void step() {
    if (!clock.isPaused) clock.pause();
    final next = loop.peek();
    if (next != null && next.at > clock.nowMs) {
      clock.stepPaused(next.at - clock.nowMs);
    }
    final steps = loop.advanceTo(clock.nowMs);
    if (steps.isEmpty) _emit(const []);
    _apply(steps);
  }

  /// Debug-panel command, logged in the replay like any other.
  void debug(DebugCommand command) => _apply(loop.submit(command, clock.nowMs));

  void setSeat(SeatConfig seat) {
    _seats[seat.id] = seat;
    loop.setBot(seat.id, _botFor(seat));
    _schedule();
    _emit(const []);
  }

  Future<void> dispose() async {
    if (_disposed) return;
    _disposed = true;
    _timer?.cancel();
    await _incoming?.cancel();
    await _updates.close();
  }
}
