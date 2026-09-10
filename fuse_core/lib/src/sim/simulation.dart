import '../bots/bot.dart';
import '../commands.dart';
import '../events.dart';
import '../model/game_state.dart';
import '../model/setup.dart';
import '../replay/replay.dart';
import '../view/player_view.dart';

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

/// Discrete-event headless host: bots play against each other in game time
/// with no real clock. The same loop will drive puppet mode later.
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
    final game = RecordedGame(setup);
    final muted = <String>{};
    var rejected = 0;
    var steps = 0;

    while (!game.state.isOver && steps < maxSteps) {
      steps++;
      final state = game.state;
      final deadline = state.nextDeadline!;

      BotIntent? best;
      String? bestId;
      for (final seat in state.players) {
        final bot = bots[seat.id];
        if (bot == null || muted.contains(seat.id)) continue;
        final intent = bot.plan(PlayerView.of(state, seat.id));
        if (intent == null) continue;
        final at = intent.at < state.lastTs ? state.lastTs : intent.at;
        if (best == null || at < best.at) {
          best = BotIntent(at, intent.command);
          bestId = seat.id;
        }
      }

      final Command command;
      if (best == null || deadline < best.at) {
        command = TimerExpired(serverTs: deadline);
      } else {
        command = best.command.stamped(best.at);
      }
      final step = game.apply(command);
      onStep?.call(step.state, command, step.events);

      final wasRejected = step.events.any((e) => e is CommandRejected);
      if (wasRejected && bestId != null && command is! TimerExpired) {
        rejected++;
        muted.add(bestId);
      } else {
        muted.clear();
      }
    }
    return SimulationResult(
      game: game,
      rejectedBotCommands: rejected,
      steps: steps,
    );
  }
}
