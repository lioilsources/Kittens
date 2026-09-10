/// Source of game time in milliseconds. The engine never reads a clock — the
/// host reads one and stamps `serverTs` onto commands. Injecting the clock
/// lets tests and the sim run without real time, and lets the debug panel
/// slow the game down or pause it.
abstract interface class GameClock {
  int get nowMs;
}

/// Fully manual clock for tests and headless simulation.
final class ManualClock implements GameClock {
  ManualClock([this._now = 0]);

  int _now;

  @override
  int get nowMs => _now;

  void advance(int ms) {
    if (ms < 0) throw ArgumentError.value(ms, 'ms', 'cannot go back in time');
    _now += ms;
  }

  void setTo(int ms) {
    if (ms < _now) throw ArgumentError.value(ms, 'ms', 'cannot go back');
    _now = ms;
  }
}

/// Real-time clock with adjustable speed (0.1×–2× in the debug panel) and
/// pause. Game time is continuous across speed changes and pauses.
final class ScaledClock implements GameClock {
  /// [startMs] lets a loaded replay continue at its own game time.
  ScaledClock({
    int Function()? realMicros,
    double speed = 1.0,
    int startMs = 0,
    bool paused = false,
  }) : _realMicros = realMicros ?? _stopwatchMicros(),
       _speed = _checkSpeed(speed) {
    _paused = paused;
    _anchorGameMicros = startMs * 1000;
    _anchorReal = _realMicros();
  }

  static double _checkSpeed(double value) {
    if (value <= 0) throw ArgumentError.value(value, 'speed', 'must be > 0');
    return value;
  }

  static int Function() _stopwatchMicros() {
    final sw = Stopwatch()..start();
    return () => sw.elapsedMicroseconds;
  }

  final int Function() _realMicros;
  double _speed;
  bool _paused = false;

  /// Game time (µs) accumulated before [_anchorReal].
  int _anchorGameMicros = 0;
  int _anchorReal = 0;

  double get speed => _speed;
  bool get isPaused => _paused;

  @override
  int get nowMs => _gameMicros() ~/ 1000;

  int _gameMicros() {
    if (_paused) return _anchorGameMicros;
    final elapsed = _realMicros() - _anchorReal;
    return _anchorGameMicros + (elapsed * _speed).round();
  }

  void _rebase() {
    _anchorGameMicros = _gameMicros();
    _anchorReal = _realMicros();
  }

  set speed(double value) {
    if (value <= 0) throw ArgumentError.value(value, 'speed', 'must be > 0');
    _rebase();
    _speed = value;
  }

  void pause() {
    if (_paused) return;
    _rebase();
    _paused = true;
  }

  void resume() {
    if (!_paused) return;
    _anchorReal = _realMicros();
    _paused = false;
  }

  /// While paused, moves game time forward by [ms] (debug "step").
  void stepPaused(int ms) {
    if (!_paused) throw StateError('stepPaused requires a paused clock');
    _anchorGameMicros += ms * 1000;
  }
}
