import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fuse_core/fuse_core.dart';

import 'session/puppet_session.dart';
import 'session/scenario.dart';
import 'session/seat.dart';
import 'state/providers.dart';

/// Development shortcut that skips the setup screen and starts playing:
///
///   flutter run --dart-define=FUSE_AUTOSTART=bots        four bots
///   flutter run --dart-define=FUSE_AUTOSTART=02_dve_ne   a bundled scenario
///
/// Compile-time only: on iOS the Dart VM does not see environment variables
/// passed through `xcrun simctl launch`.
const autostartValue = String.fromEnvironment('FUSE_AUTOSTART');

Future<void> autostart(SessionNotifier sessions, String value) async {
  if (value == 'bots') {
    sessions.startNew(
      NewGameConfig(
        seed: 7,
        seats: [
          for (var i = 0; i < 4; i++)
            SeatConfig(
              id: 'p${i + 1}',
              name: 'Bot ${i + 1}',
              iq: BotIq.values[i % BotIq.values.length],
              reaction: ReactionPreset.values[i % ReactionPreset.values.length],
            ),
        ],
      ),
      startPaused: false,
    );
    return;
  }
  final source = await rootBundle.loadString('assets/scenarios/$value.json');
  sessions.startScenario(
    Scenario.fromJson(jsonDecode(source) as Map<String, Object?>),
    startPaused: false,
  );
}
