import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fuse_core/fuse_core.dart';

import 'seat.dart';

/// A prepared situation (plan §6.2): seats, seed and debug commands applied
/// at game start. Bundled as `assets/scenarios/*.json`.
final class Scenario {
  const Scenario({
    required this.name,
    required this.description,
    required this.seats,
    required this.setup,
    this.prelude = const [],
    this.viewAs,
    this.speed = 1.0,
    this.autoFollow = false,
  });

  factory Scenario.fromJson(Map<String, Object?> j) {
    final seats = [
      for (final s in j['seats'] as List<Object?>)
        SeatConfig.fromJson(s as Map<String, Object?>),
    ];
    return Scenario(
      name: j['name'] as String,
      description: j['description'] as String? ?? '',
      seats: seats,
      setup: GameSetup(
        players: [for (final s in seats) PlayerSeat(s.id, s.name)],
        seed: (j['seed'] as num?)?.toInt() ?? 1,
        rules: RulesConfig.fromJson(
          j['rules'] as Map<String, Object?>? ?? const {},
        ),
      ),
      prelude: [
        for (final c in j['commands'] as List<Object?>? ?? const [])
          Command.fromJson(c as Map<String, Object?>),
      ],
      viewAs: j['viewAs'] as String?,
      speed: (j['speed'] as num?)?.toDouble() ?? 1.0,
      autoFollow: j['autoFollow'] as bool? ?? false,
    );
  }

  final String name;
  final String description;
  final List<SeatConfig> seats;
  final GameSetup setup;
  final List<Command> prelude;
  final String? viewAs;
  final double speed;
  final bool autoFollow;

  RecordedGame buildGame() {
    final game = RecordedGame(setup);
    for (final c in prelude) {
      game.apply(c.stamped(setup.startTs));
    }
    return game;
  }

  static Future<List<Scenario>> loadBundled(AssetBundle bundle) async {
    final manifest = await AssetManifest.loadFromAssetBundle(bundle);
    final paths =
        manifest
            .listAssets()
            .where(
              (p) => p.startsWith('assets/scenarios/') && p.endsWith('.json'),
            )
            .toList()
          ..sort();
    return [
      for (final p in paths)
        Scenario.fromJson(
          jsonDecode(await bundle.loadString(p)) as Map<String, Object?>,
        ),
    ];
  }
}
