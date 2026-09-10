import '../bots/bot.dart';
import '../commands.dart';
import '../events.dart';
import '../host/host_loop.dart';
import '../model/game_state.dart';
import '../model/setup.dart';
import '../replay/replay.dart';

final class SimulationResult {
  const SimulationResult({
    required this.game,
    required this.rejectedBotCommands,
    required this.steps,
  });

  final RecordedGame game;
  final int rejectedBotCommands;
  final int steps;

  GameState get state => game.state;
  bool get finished => game.state.isOver;
}

/// Headless host: bots play against each other in discrete game time, no
/// real clock. Live sessions use the same [HostLoop] driven by a real clock.
final class Simulation {
  Simulation({
    required this.setup,
    required this.bots,
    this.maxSteps = 50000,
    this.onStep,
  });

  final GameSetup setup;
  final Map<String, Bot> bots;
  final int maxSteps;
  final void Function(GameState state, Command command, List<GameEvent> events)?
  onStep;

  SimulationResult run() {
    final loop = HostLoop(RecordedGame(setup), bots: bots);
    var steps = 0;
    while (!loop.state.isOver && steps < maxSteps) {
      steps++;
      final s = loop.stepNext()!;
      onStep?.call(s.step.state, s.command, s.step.events);
    }
    return SimulationResult(
      game: loop.game,
      rejectedBotCommands: loop.rejectedBotCommands,
      steps: steps,
    );
  }
}
