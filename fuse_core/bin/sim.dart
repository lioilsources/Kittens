// CLI balancing tool (PLAN §6.1):
//   dart run fuse_core:sim --players 4 --games 500 --seed 1
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:fuse_core/fuse_core.dart';

void main(List<String> argv) {
  final parser = ArgParser()
    ..addOption('players', abbr: 'p', defaultsTo: '4', help: '2–5')
    ..addOption('games', abbr: 'g', defaultsTo: '200')
    ..addOption('seed', abbr: 's', defaultsTo: '1')
    ..addOption(
      'iq',
      defaultsTo: 'mix',
      help: 'smart | first | sloppy | mix, or a comma list cycled per seat',
    )
    ..addOption(
      'reaction',
      defaultsTo: 'mix',
      help: 'ms (800), range (300-1500), mix, or a comma list per seat',
    )
    ..addOption('mistakes', defaultsTo: '0.2', help: 'sloppy bot mistake rate')
    ..addOption('turn-limit', help: 'ms, default 3000')
    ..addOption('limit-step', help: 'ms, default 250')
    ..addOption('limit-min', help: 'ms, default 1500')
    ..addOption('decay', allowed: ['round', 'elimination'])
    ..addOption('fast-ms', help: 'fast throw threshold, default 1000')
    ..addOption('steal-ms', help: 'steal threshold, default 2000')
    ..addOption('shield-ms', help: 'shield window, default 1000')
    ..addOption('lives', help: 'default 3')
    ..addOption('hand', help: 'default 5')
    ..addOption('replay-out', help: 'write the replay of game #1 to a file')
    ..addFlag('log', negatable: false, help: 'print the event log of game #1')
    ..addFlag('json', negatable: false, help: 'machine-readable output')
    ..addFlag('help', abbr: 'h', negatable: false);

  final ArgResults args;
  try {
    args = parser.parse(argv);
  } on FormatException catch (e) {
    stderr.writeln('${e.message}\n\n${parser.usage}');
    exit(64);
  }
  if (args.flag('help')) {
    stdout.writeln(
      'Usage: dart run fuse_core:sim [options]\n\n${parser.usage}',
    );
    return;
  }

  int intOpt(String name) => int.parse(args.option(name)!);
  int? maybeInt(String name) =>
      args.option(name) == null ? null : int.parse(args.option(name)!);

  final players = intOpt('players');
  final games = intOpt('games');
  final seed = intOpt('seed');
  final mistakes = double.parse(args.option('mistakes')!);

  var rules = const RulesConfig().copyWith(
    turnLimitMs: maybeInt('turn-limit'),
    turnLimitStepMs: maybeInt('limit-step'),
    turnLimitMinMs: maybeInt('limit-min'),
    fastThrowMs: maybeInt('fast-ms'),
    stealThresholdMs: maybeInt('steal-ms'),
    shieldWindowMs: maybeInt('shield-ms'),
    startLives: maybeInt('lives'),
    handSize: maybeInt('hand'),
  );
  if (args.option('decay') != null) {
    rules = rules.copyWith(
      limitDecay: args.option('decay') == 'round'
          ? LimitDecay.perRound
          : LimitDecay.perElimination,
    );
  }

  final iqs = args.option('iq') == 'mix'
      ? [BotIq.smart, BotIq.firstValid, BotIq.sloppy]
      : [for (final s in args.option('iq')!.split(',')) BotIq.parse(s.trim())];
  final reactions = args.option('reaction') == 'mix'
      ? const <ReactionModel>[
          FixedReaction(500),
          FixedReaction(1500),
          UniformReaction(300, 1500),
        ]
      : [
          for (final s in args.option('reaction')!.split(','))
            ReactionModel.parse(s.trim()),
        ];
  final profiles = [
    for (var i = 0; i < players; i++)
      BotProfile(
        iq: iqs[i % iqs.length],
        reaction: reactions[i % reactions.length],
        mistakeRate: mistakes,
      ),
  ];
  final seats = [
    for (var i = 0; i < players; i++) PlayerSeat('p${i + 1}', 'Bot ${i + 1}'),
  ];

  final agg = AggregateStats();
  final sw = Stopwatch()..start();
  for (var g = 0; g < games; g++) {
    final setup = GameSetup(players: seats, seed: seed + g, rules: rules);
    final sim = Simulation(
      setup: setup,
      bots: {
        for (var i = 0; i < players; i++)
          seats[i].id: BasicBot(
            profile: profiles[i],
            seed: (hashUnit(seed, g, i) * 0x7fffffff).floor(),
          ),
      },
    );
    final result = sim.run();
    agg.add(GameStats.from(result));

    if (g == 0) {
      if (args.flag('log')) {
        for (final e in result.game.events) {
          stdout.writeln(e);
        }
        stdout.writeln();
      }
      final out = args.option('replay-out');
      if (out != null) {
        File(out).writeAsStringSync(result.game.replay.encode(pretty: true));
      }
    }
  }
  sw.stop();

  final report = agg.toJson();
  if (args.flag('json')) {
    stdout.writeln(
      const JsonEncoder.withIndent('  ').convert({
        'players': players,
        'seed': seed,
        'bots': [
          for (var i = 0; i < players; i++)
            '${seats[i].id}=${profiles[i].label}',
        ],
        'rules': rules.toJson(),
        'report': report,
      }),
    );
    return;
  }
  _printReport(report, seats, profiles, rules, sw.elapsedMilliseconds);
}

void _printReport(
  Map<String, Object?> r,
  List<PlayerSeat> seats,
  List<BotProfile> profiles,
  RulesConfig rules,
  int elapsedMs,
) {
  String pct(Object? v) => '${((v as num) * 100).toStringAsFixed(1)} %';
  String f1(Object? v) => (v as num).toStringAsFixed(1);
  String f2(Object? v) => (v as num).toStringAsFixed(2);
  final steal = r['steal'] as Map<String, Object?>;
  final bomb = r['bomb'] as Map<String, Object?>;
  final lives = r['livesLost'] as Map<String, Object?>;
  final share = r['livesLostShare'] as Map<String, Object?>;
  final wins = r['winsBySeat'] as Map<String, int>;
  final games = r['games'] as int;
  final decay = rules.limitDecay == LimitDecay.perRound ? 'kolo' : 'eliminaci';

  final out = StringBuffer()
    ..writeln(
      'Kittens sim — $games her, ${seats.length} hráči '
      '(${(elapsedMs / 1000).toStringAsFixed(1)} s)',
    )
    ..writeln(
      'Boti: ${[for (var i = 0; i < seats.length; i++) '${seats[i].id} ${profiles[i].label}'].join(' | ')}',
    )
    ..writeln(
      'Pravidla: limit ${rules.turnLimitMs}→${rules.turnLimitMinMs} ms '
      '(−${rules.turnLimitStepMs}/$decay), rychlý hod ≤${rules.fastThrowMs} ms, '
      'Kradež >${rules.stealThresholdMs} ms, Štít ${rules.shieldWindowMs} ms',
    )
    ..writeln()
    ..writeln(
      'Délka partie        ${f1(r['avgTurns'])} tahů, ${f1(r['avgDurationSec'])} s herního času'
      '${(r['unfinished'] as int) > 0 ? '  (NEDOHRÁNO: ${r['unfinished']})' : ''}',
    )
    ..writeln(
      'Hody                průměr ${(r['avgThrowMs'] as num).round()} ms, rychlé ${pct(r['fastThrowShare'])}',
    )
    ..writeln(
      'Ruka při startu tahu ${f1(r['avgHandSizeAtTurnStart'])} karet (max ${r['maxHandSize']})',
    )
    ..writeln(
      'Ztráty životů       timeout ${pct(share['timeout'])} | neplatná ${pct(share['invalidCard'])} | '
      'bomba ${pct(share['bomb'])}   (celkem ${lives.values.fold<num>(0, (a, b) => a + (b as num))})',
    )
    ..writeln(
      '                    timeouty/hru ${f2(r['timeoutsPerGame'])} '
      '(s prázdnou rukou ${f2(r['emptyHandTimeoutsPerGame'])}), neplatné/hru ${f2(r['invalidThrowsPerGame'])}',
    )
    ..writeln(
      'Kradež              ${f2(steal['perGame'])}/hru, ${pct(steal['stolenTurnShare'])} tahů, '
      've ${pct(steal['gamesWithSteal'])} her',
    )
    ..writeln(
      '                    vítěz kradl v ${pct(steal['winnerStoleShare'])} her; vítězovy krádeže = '
      '${pct(steal['stealsByWinnerShare'])} všech (základ ${pct(1 / seats.length)}); do fuse 1: ${steal['intoFuse1']}',
    )
    ..writeln(
      'Ne!                 ${f2(r['nopesPerGame'])}/hru (duch ${f2(r['ghostNopesPerGame'])}), '
      'propadlé ${f2(r['fizzlesPerGame'])}/hru',
    )
    ..writeln(
      'Štít                zachránil ${f2(r['livesSavedByShieldPerGame'])} životů/hru',
    )
    ..writeln(
      'Bomba               vynořila ${f2(bomb['surfacedPerGame'])}/hru, vybuchla ${f2(bomb['explodedPerGame'])}, '
      'zneškodněna ${f2(bomb['defusedPerGame'])}, odpálena ${f2(bomb['redirectedPerGame'])}',
    )
    ..writeln('Míchání decku       ${f2(r['reshufflesPerGame'])}/hru')
    ..writeln(
      'Výhry podle místa   ${[for (final s in seats) '${s.id} ${pct(games == 0 ? 0 : (wins[s.id] ?? 0) / games)}'].join(' | ')}',
    )
    ..writeln('Odmítnuté příkazy botů: ${r['rejectedBotCommands']}');
  stdout.write(out);
}
