/// Kittens — pure Dart game core: model, rules, engine, bots, replay, simulation.
library;

export 'src/bots/basic_bot.dart';
export 'src/bots/bot.dart';
export 'src/clock/game_clock.dart';
export 'src/commands.dart';
export 'src/engine/game_engine.dart' show EngineStep, GameEngine, RejectReason;
export 'src/events.dart';
export 'src/host/host_loop.dart';
export 'src/model/card.dart';
export 'src/model/game_state.dart';
export 'src/model/rules_config.dart';
export 'src/model/setup.dart';
export 'src/replay/replay.dart';
export 'src/rules/bomb_fuse.dart';
export 'src/rules/match_rule.dart';
export 'src/rules/reactions.dart';
export 'src/rules/turn_reward.dart';
export 'src/sim/sim_stats.dart';
export 'src/sim/simulation.dart';
export 'src/util/rng.dart';
export 'src/view/player_view.dart';
