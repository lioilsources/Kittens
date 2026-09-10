import '../commands.dart';
import '../view/player_view.dart';

/// A command a bot wants to issue at game time [at].
final class BotIntent {
  const BotIntent(this.at, this.command);

  final int at;
  final Command command;

  @override
  String toString() => 'BotIntent(@$at $command)';
}

/// A bot is a pure function of what it sees: `(view) → intent?`. The runner
/// asks again after every state change, so intents must be stable for an
/// unchanged situation (bots derive "randomness" from hashes, not state).
abstract interface class Bot {
  BotIntent? plan(PlayerView view);
}

/// How long a bot takes to react; `u` is a deterministic value in [0, 1).
sealed class ReactionModel {
  const ReactionModel();

  int delayFor(double u);

  String get label;

  /// `500`, `1500` or `300-1500`.
  static ReactionModel parse(String s) {
    final range = RegExp(r'^(\d+)-(\d+)$').firstMatch(s);
    if (range != null) {
      return UniformReaction(int.parse(range[1]!), int.parse(range[2]!));
    }
    return FixedReaction(int.parse(s));
  }
}

final class FixedReaction extends ReactionModel {
  const FixedReaction(this.ms);
  final int ms;

  @override
  int delayFor(double u) => ms;

  @override
  String get label => '${ms}ms';
}

final class UniformReaction extends ReactionModel {
  const UniformReaction(this.minMs, this.maxMs);
  final int minMs;
  final int maxMs;

  @override
  int delayFor(double u) => minMs + ((maxMs - minMs) * u).round();

  @override
  String get label => '$minMs-${maxMs}ms';
}

/// PLAN §6.2 bot "IQ".
enum BotIq {
  /// Throws the first valid card; with no valid card throws anyway.
  firstValid,

  /// Saves Zneškodni/Odpal for fuse 1, waits out hopeless turns, reacts well.
  smart,

  /// Like [firstValid] but makes a random throw in `mistakeRate` of turns.
  sloppy;

  static BotIq parse(String s) => switch (s) {
    'first' || 'firstValid' => firstValid,
    'smart' => smart,
    'sloppy' => sloppy,
    _ => throw FormatException('Unknown bot IQ: $s'),
  };
}

final class BotProfile {
  const BotProfile({
    this.iq = BotIq.smart,
    this.reaction = const FixedReaction(800),
    this.mistakeRate = 0.2,
  });

  final BotIq iq;
  final ReactionModel reaction;
  final double mistakeRate;

  String get label => '${iq.name}/${reaction.label}';
}
