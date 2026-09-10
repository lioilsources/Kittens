import '../events.dart';
import '../model/card.dart';
import '../model/game_state.dart';
import 'simulation.dart';

/// Numbers extracted from one finished (or aborted) game.
final class GameStats {
  GameStats._();

  factory GameStats.from(SimulationResult r) {
    final s = GameStats._()
      ..finished = r.finished
      ..rejected = r.rejectedBotCommands
      ..players = r.state.players.length
      ..winnerId = r.state.winnerId;
    final events = r.game.events;
    final stealers = <String>{};
    final lastHand = <String, int>{
      for (final p in r.game.setup.players) p.id: r.state.rules.handSize,
    };
    for (final e in events) {
      switch (e) {
        case TurnStarted():
          s.turns++;
          s.handSizeSum += lastHand[e.playerId] ?? 0;
        case CardThrown():
          if (e.draw == r.state.rules.drawFast) {
            s.fastThrows++;
          } else {
            s.normalThrows++;
          }
          s.throwMsSum += e.throwMs;
          if (e.card.kind == CardKind.defuse) s.defused++;
          if (e.card.kind == CardKind.detonate) s.redirected++;
          lastHand[e.playerId] = (lastHand[e.playerId] ?? 0) - 1;
        case CardsDrawn():
          lastHand[e.playerId] = (lastHand[e.playerId] ?? 0) + e.cards.length;
        case InvalidThrow():
          s.invalidThrows++;
        case TurnTimedOut():
          s.timeouts++;
          if (e.handSize == 0) s.emptyHandTimeouts++;
        case LifeLost():
          s.livesLost[e.cause] = (s.livesLost[e.cause] ?? 0) + e.amount;
        case TurnStolen():
          s.steals++;
          stealers.add(e.byPlayerId);
          if (e.fuse == 1) s.stealsIntoFuse1++;
          if (e.byPlayerId == r.state.winnerId) s.stealsByWinner++;
        case ActionNoped():
          s.nopes++;
          if (e.ghost) s.ghostNopes++;
        case NopeFizzled():
          s.fizzles++;
        case ShieldUsed():
          s.shieldSaved += e.saved;
        case BombSurfaced():
          if (e.drawnBy != null) s.bombsSurfaced++;
        case BombExploded():
          s.bombsExploded++;
        case DeckReshuffled():
          s.reshuffles++;
        case GameOver():
          s.durationMs = e.ts - r.game.setup.startTs;
        default:
          break;
      }
      if (e is CardThrown || e is CardsDrawn) {
        for (final v in lastHand.values) {
          if (v > s.maxHandSize) s.maxHandSize = v;
        }
      }
    }
    s.winnerStole = s.winnerId != null && stealers.contains(s.winnerId);
    return s;
  }

  late bool finished;
  late int rejected;
  late int players;
  String? winnerId;
  int turns = 0;
  int durationMs = 0;
  int fastThrows = 0;
  int normalThrows = 0;
  int throwMsSum = 0;
  int invalidThrows = 0;
  int timeouts = 0;
  int emptyHandTimeouts = 0;
  final Map<LifeLossCause, int> livesLost = {};
  int steals = 0;
  int stealsIntoFuse1 = 0;
  int stealsByWinner = 0;
  bool winnerStole = false;
  int nopes = 0;
  int ghostNopes = 0;
  int fizzles = 0;
  int shieldSaved = 0;
  int bombsSurfaced = 0;
  int bombsExploded = 0;
  int defused = 0;
  int redirected = 0;
  int reshuffles = 0;
  int handSizeSum = 0;
  int maxHandSize = 0;
}

/// Aggregate over many games — the balancing report (PLAN §6.1).
final class AggregateStats {
  final List<GameStats> games = [];
  final Map<String, int> winsBySeat = {};

  void add(GameStats g) {
    games.add(g);
    if (g.winnerId != null) {
      winsBySeat[g.winnerId!] = (winsBySeat[g.winnerId!] ?? 0) + 1;
    }
  }

  int get count => games.length;
  double _avg(num Function(GameStats g) f) =>
      count == 0 ? 0 : games.fold<num>(0, (a, g) => a + f(g)) / count;
  int _sum(num Function(GameStats g) f) =>
      games.fold<num>(0, (a, g) => a + f(g)).toInt();

  Map<String, Object?> toJson() {
    final turns = _sum((g) => g.turns);
    final throws = _sum((g) => g.fastThrows + g.normalThrows);
    final lives = {
      for (final c in LifeLossCause.values)
        c.name: _sum((g) => g.livesLost[c] ?? 0),
    };
    final totalLives = lives.values.fold(0, (a, b) => a + b);
    final steals = _sum((g) => g.steals);
    final gamesWithSteal = games.where((g) => g.steals > 0).length;
    final wonGames = games.where((g) => g.winnerId != null).toList();
    return {
      'games': count,
      'unfinished': games.where((g) => !g.finished).length,
      'avgTurns': _avg((g) => g.turns),
      'avgDurationSec': _avg((g) => g.durationMs) / 1000,
      'avgThrowMs': throws == 0 ? 0 : _sum((g) => g.throwMsSum) / throws,
      'fastThrowShare': throws == 0 ? 0 : _sum((g) => g.fastThrows) / throws,
      'avgHandSizeAtTurnStart': turns == 0
          ? 0
          : _sum((g) => g.handSizeSum) / turns,
      'maxHandSize': games.fold<int>(
        0,
        (a, g) => g.maxHandSize > a ? g.maxHandSize : a,
      ),
      'livesLost': lives,
      'livesLostShare': {
        for (final e in lives.entries)
          e.key: totalLives == 0 ? 0 : e.value / totalLives,
      },
      'invalidThrowsPerGame': _avg((g) => g.invalidThrows),
      'timeoutsPerGame': _avg((g) => g.timeouts),
      'emptyHandTimeoutsPerGame': _avg((g) => g.emptyHandTimeouts),
      'steal': {
        'perGame': _avg((g) => g.steals),
        'stolenTurnShare': turns == 0 ? 0 : steals / turns,
        'gamesWithSteal': count == 0 ? 0 : gamesWithSteal / count,
        'winnerStoleShare': wonGames.isEmpty
            ? 0
            : wonGames.where((g) => g.winnerStole).length / wonGames.length,
        'stealsByWinnerShare': steals == 0
            ? 0
            : _sum((g) => g.stealsByWinner) / steals,
        'intoFuse1': _sum((g) => g.stealsIntoFuse1),
      },
      'nopesPerGame': _avg((g) => g.nopes),
      'ghostNopesPerGame': _avg((g) => g.ghostNopes),
      'fizzlesPerGame': _avg((g) => g.fizzles),
      'livesSavedByShieldPerGame': _avg((g) => g.shieldSaved),
      'bomb': {
        'surfacedPerGame': _avg((g) => g.bombsSurfaced),
        'explodedPerGame': _avg((g) => g.bombsExploded),
        'defusedPerGame': _avg((g) => g.defused),
        'redirectedPerGame': _avg((g) => g.redirected),
      },
      'reshufflesPerGame': _avg((g) => g.reshuffles),
      'rejectedBotCommands': _sum((g) => g.rejected),
      'winsBySeat': winsBySeat,
    };
  }
}
