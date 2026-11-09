import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuse_core/fuse_core.dart';

import '../../l10n/l10n.dart';
import '../../session/puppet_session.dart';
import '../../session/scenario.dart';
import '../../session/seat.dart';
import '../../state/providers.dart';
import '../common/controls.dart';
import '../theme.dart';

class SetupScreen extends ConsumerStatefulWidget {
  const SetupScreen({super.key});

  @override
  ConsumerState<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<SetupScreen> {
  int _count = 4;
  final _seats = <SeatConfig>[
    const SeatConfig(id: 'p1', name: 'Ty', mode: SeatMode.human),
    const SeatConfig(id: 'p2', name: 'Bot 1', reaction: ReactionPreset.fast),
    const SeatConfig(id: 'p3', name: 'Bot 2', reaction: ReactionPreset.slow),
    const SeatConfig(id: 'p4', name: 'Bot 3', iq: BotIq.sloppy),
    const SeatConfig(id: 'p5', name: 'Bot 4', iq: BotIq.firstValid),
  ];
  double _limit = 3000;
  double _fast = 1000;
  double _steal = 2000;
  double _speed = 1;
  late final Future<List<Scenario>> _scenarios = Scenario.loadBundled(
    DefaultAssetBundle.of(context),
  );

  /// Default seat names are stored as ids so they follow the UI language;
  /// the localized name is baked in only when the game starts.
  static String _seatName(BuildContext context, SeatConfig seat) {
    final l = context.l10n;
    if (seat.id == 'p1') return l.seatYou;
    return l.botName(int.parse(seat.id.substring(1)) - 1);
  }

  void _start() {
    const base = RulesConfig();
    final limit = _limit.round();
    ref
        .read(sessionProvider.notifier)
        .startNew(
          NewGameConfig(
            seats: [
              for (final s in _seats.take(_count))
                s.copyWith(name: _seatName(context, s)),
            ],
            seed: DateTime.now().millisecondsSinceEpoch % 1000000,
            speed: _speed,
            rules: base.copyWith(
              turnLimitMs: limit,
              turnLimitMinMs: math.min(base.turnLimitMinMs, limit),
              fastThrowMs: _fast.round(),
              stealThresholdMs: _steal.round(),
            ),
          ),
        );
  }

  Future<void> _paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (!mounted) return;
    try {
      ref
          .read(sessionProvider.notifier)
          .loadReplay(
            Replay.decode(data?.text ?? ''),
            title: context.l10n.replayTitle,
          );
    } on Object {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.l10n.noReplayInClipboard)));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 40),
            children: [
              const Text(
                'Kittens',
                style: TextStyle(
                  fontFamily: displayFont,
                  fontSize: 56,
                  height: 1,
                  color: Palette.sulfur,
                ),
              ),
              const SizedBox(height: 8),
              Text(context.l10n.tagline, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: SectionHeading(context.l10n.sectionPlayers)),
                  SegmentedButton<int>(
                    segments: [
                      for (var n = 2; n <= 5; n++)
                        ButtonSegment(value: n, label: Text('$n')),
                    ],
                    selected: {_count},
                    showSelectedIcon: false,
                    onSelectionChanged: (s) => setState(() => _count = s.first),
                  ),
                ],
              ),
              for (var i = 0; i < _count; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Palette.tableLine),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _seatName(context, _seats[i]),
                        style: const TextStyle(
                          fontFamily: displayFont,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SeatModeSelector(
                        value: _seats[i].mode,
                        onChanged: (m) => setState(
                          () => _seats[i] = _seats[i].copyWith(mode: m),
                        ),
                      ),
                      if (_seats[i].mode == SeatMode.bot)
                        BotSettings(
                          seat: _seats[i],
                          onChanged: (s) => setState(() => _seats[i] = s),
                        ),
                    ],
                  ),
                ),
              SectionHeading(context.l10n.sectionRules),
              LabeledSlider(
                label: context.l10n.ruleTurnLimit,
                valueText: seconds(_limit.round()),
                value: _limit,
                min: 1500,
                max: 5000,
                divisions: 14,
                onChanged: (v) => setState(() => _limit = v),
              ),
              LabeledSlider(
                label: context.l10n.ruleFastThrow,
                valueText: seconds(_fast.round()),
                value: _fast,
                min: 500,
                max: 2000,
                divisions: 15,
                onChanged: (v) => setState(() => _fast = v),
              ),
              LabeledSlider(
                label: context.l10n.ruleSteal,
                valueText: seconds(_steal.round()),
                value: _steal,
                min: 1000,
                max: 3000,
                divisions: 20,
                onChanged: (v) => setState(() => _steal = v),
              ),
              LabeledSlider(
                label: context.l10n.gameSpeed,
                valueText: factor(_speed),
                value: _speed,
                min: 0.25,
                max: 2,
                divisions: 7,
                onChanged: (v) => setState(() => _speed = v),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _start,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: Text(
                  context.l10n.play,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 6),
              TextButton.icon(
                onPressed: _paste,
                icon: const Icon(Icons.content_paste),
                label: Text(context.l10n.loadReplayFromClipboard),
              ),
              SectionHeading(context.l10n.sectionScenarios),
              FutureBuilder<List<Scenario>>(
                future: _scenarios,
                builder: (context, snapshot) => Column(
                  children: [
                    for (final s in snapshot.data ?? const <Scenario>[])
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(s.name),
                        subtitle: Text(
                          s.description,
                          style: const TextStyle(color: Palette.muted),
                        ),
                        trailing: const Icon(Icons.play_arrow),
                        onTap: () =>
                            ref.read(sessionProvider.notifier).startScenario(s),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
