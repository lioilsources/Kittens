import '../bots/bot.dart';
import '../commands.dart';
import '../engine/game_engine.dart';
import '../events.dart';
import '../model/game_state.dart';
import '../replay/replay.dart';
import '../view/player_view.dart';

/// Something the host will do on its own at game time [at]: either a
/// `TimerExpired` for the next deadline or a bot's command.
final class HostAction {
  const HostAction(this.at, this.command, {this.botId});

  final int at;

  /// Already stamped with `serverTs = at`.
  final Command command;
  final String? botId;
}

final class HostStep {
  const HostStep(this.command, this.step, {this.botId});

  final Command command;
  final EngineStep step;
  final String? botId;

  bool get rejected => step.events.any((e) => e is CommandRejected);
}

/// Host-side scheduling shared by the headless [Simulation] and live
/// sessions: deadlines and bot intents are applied in game-time order, and
/// human commands slot in at the time they arrive.
final class HostLoop {
  HostLoop(this.game, {Map<String, Bot>? bots}) : _bots = {...?bots};

  final RecordedGame game;
  final Map<String, Bot> _bots;

  /// Bots whose last command was rejected sit out until the state changes,
  /// so a confused bot cannot spin forever at one timestamp.
  final Set<String> _muted = {};
  int rejectedBotCommands = 0;

  GameState get state => game.state;

  Map<String, Bot> get bots => Map.unmodifiable(_bots);

  /// Seat switches between human (null) and a bot.
  void setBot(String playerId, Bot? bot) {
    if (bot == null) {
      _bots.remove(playerId);
    } else {
      _bots[playerId] = bot;
    }
    _muted.clear();
  }

  /// The next action the host would take if no human acts; null when over.
  HostAction? peek() {
    final s = state;
    if (s.isOver) return null;
    final deadline = s.nextDeadline!;
    HostAction? best;
    for (final seat in s.players) {
      final bot = _bots[seat.id];
      if (bot == null || _muted.contains(seat.id)) continue;
      final intent = bot.plan(PlayerView.of(s, seat.id));
      if (intent == null) continue;
      final at = intent.at < s.lastTs ? s.lastTs : intent.at;
      if (best == null || at < best.at) {
        best = HostAction(at, intent.command.stamped(at), botId: seat.id);
      }
    }
    // A bot acting exactly at the deadline is still on time.
    if (best == null || deadline < best.at) {
      return HostAction(deadline, TimerExpired(serverTs: deadline));
    }
    return best;
  }

  /// Applies the next scheduled action regardless of the current time
  /// (headless simulation, debug "step").
  HostStep? stepNext() {
    final a = peek();
    return a == null ? null : _apply(a.command, botId: a.botId);
  }

  /// Applies every scheduled action due at or before [now].
  List<HostStep> advanceTo(int now) {
    final out = <HostStep>[];
    for (var guard = 0; guard < 10000; guard++) {
      final a = peek();
      if (a == null || a.at > now) break;
      out.add(_apply(a.command, botId: a.botId));
    }
    return out;
  }

  /// A command from a client (or the debug panel) arriving at [now].
  /// Everything scheduled strictly before [now] happens first; the command is
  /// then stamped with the authoritative time.
  List<HostStep> submit(Command command, int now) {
    final out = advanceTo(now - 1);
    final ts = now < state.lastTs ? state.lastTs : now;
    out.add(_apply(command.stamped(ts)));
    return out;
  }

  HostStep _apply(Command command, {String? botId}) {
    final result = HostStep(command, game.apply(command), botId: botId);
    if (result.rejected && botId != null) {
      rejectedBotCommands++;
      _muted.add(botId);
    } else {
      _muted.clear();
    }
    return result;
  }
}
