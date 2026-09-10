import 'dart:math' as math;

import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuse_core/fuse_core.dart';

import '../../session/scenario.dart';
import '../../session/seat.dart';
import '../../state/providers.dart';
import '../card_face.dart';
import '../common/controls.dart';
import '../theme.dart';

const _small = TextStyle(fontSize: 12, color: Palette.muted);
const _log = TextStyle(
  fontSize: 10.5,
  height: 1.3,
  color: Palette.muted,
  fontFeatures: [FontFeature.tabularFigures()],
);

/// Debug drawer (plan §6.2): clock, seats, forced cards, bomb, limit,
/// replay, scenarios and the event log. Everything goes through the host as
/// logged debug commands, so a replay reproduces it.
class DebugPanel extends ConsumerStatefulWidget {
  const DebugPanel({super.key});

  @override
  ConsumerState<DebugPanel> createState() => _DebugPanelState();
}

class _DebugPanelState extends ConsumerState<DebugPanel> {
  String? _giveTo;
  CardKind _kind = CardKind.number;
  CardColor _color = CardColor.red;
  double _number = 5;
  double? _limitDraft;
  late final Future<List<Scenario>> _scenarios = Scenario.loadBundled(
    DefaultAssetBundle.of(context),
  );

  String get _code => _kind == CardKind.number
      ? '${_color.code}${_number.round()}'
      : _kind.code;

  void _snack(String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  Future<void> _copyReplay(Replay replay) async {
    await Clipboard.setData(ClipboardData(text: replay.encode()));
    if (mounted) _snack('Replay je ve schránce');
  }

  Future<void> _pasteReplay() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (!mounted) return;
    final Replay replay;
    try {
      replay = Replay.decode(data?.text ?? '');
    } on Object {
      _snack('Ve schránce není replay Kittens');
      return;
    }
    Navigator.of(context).pop();
    ref.read(sessionProvider.notifier).loadReplay(replay);
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider);
    final update = ref.watch(hostProvider);
    final puppet = ref.watch(puppetProvider);
    if (session == null || update == null) return const Drawer();
    final host = session.host;
    final state = update.state;
    final giveTo = _giveTo ?? puppet.viewAs;
    final limit = _limitDraft ?? state.rules.turnLimitMs.toDouble();

    return Drawer(
      width: math.min(380, MediaQuery.sizeOf(context).width * 0.92),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          children: [
            const SectionHeading('Čas'),
            Row(
              children: [
                FilledButton.tonalIcon(
                  onPressed: update.paused ? host.resume : host.pause,
                  icon: Icon(update.paused ? Icons.play_arrow : Icons.pause),
                  label: Text(update.paused ? 'Pokračovat' : 'Pozastavit'),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: host.step,
                  icon: const Icon(Icons.skip_next),
                  label: const Text('Krok'),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Herní čas ${seconds(host.clock.nowMs, digits: 2)}, '
              'kolo ${state.round + 1}',
              style: _small,
            ),
            const SizedBox(height: 8),
            LabeledSlider(
              label: 'Rychlost hry',
              valueText: factor(update.speed),
              value: update.speed,
              min: 0.1,
              max: 2,
              divisions: 19,
              onChanged: host.setSpeed,
            ),
            LabeledSlider(
              label: 'Umělá latence',
              valueText: '${session.network.latency.inMilliseconds} ms',
              value: session.network.latency.inMilliseconds.toDouble(),
              min: 0,
              max: 300,
              divisions: 30,
              onChanged: (v) => setState(
                () =>
                    session.network.latency = Duration(milliseconds: v.round()),
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Pohled sleduje hráče na tahu'),
              subtitle: const Text(
                'Jen místa ovládaná člověkem',
                style: _small,
              ),
              value: puppet.autoFollow,
              onChanged: ref.read(puppetProvider.notifier).setAutoFollow,
            ),

            const SectionHeading('Hráči'),
            for (final p in state.players)
              _SeatEditor(
                seat: update.seats[p.id]!,
                player: p,
                maxLives: state.rules.startLives,
                onSeat: host.setSeat,
                onLives: (lives) => host.debug(
                  DebugSetLives(playerId: p.id, lives: lives, serverTs: 0),
                ),
              ),

            const SectionHeading('Vnutit kartu'),
            Row(
              children: [
                DropdownButton<String>(
                  value: giveTo,
                  items: [
                    for (final p in state.players)
                      DropdownMenuItem(value: p.id, child: Text(p.name)),
                  ],
                  onChanged: (v) => setState(() => _giveTo = v),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButton<CardKind>(
                    isExpanded: true,
                    value: _kind,
                    items: [
                      for (final k in CardKind.values)
                        if (k != CardKind.bomb)
                          DropdownMenuItem(value: k, child: Text(k.nameCs)),
                    ],
                    onChanged: (v) => setState(() => _kind = v ?? _kind),
                  ),
                ),
              ],
            ),
            if (_kind == CardKind.number) ...[
              const SizedBox(height: 8),
              SegmentedButton<CardColor>(
                segments: [
                  for (final c in CardColor.values)
                    ButtonSegment(
                      value: c,
                      label: ColorMark(color: c, size: 16),
                    ),
                ],
                selected: {_color},
                showSelectedIcon: false,
                onSelectionChanged: (s) => setState(() => _color = s.first),
              ),
              LabeledSlider(
                label: 'Číslo',
                valueText: '${_number.round()}',
                value: _number,
                min: 1,
                max: 10,
                divisions: 9,
                onChanged: (v) => setState(() => _number = v),
              ),
            ],
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton(
                  onPressed: () => host.debug(
                    DebugGiveCard(playerId: giveTo, code: _code, serverTs: 0),
                  ),
                  child: const Text('Dát do ruky'),
                ),
                if (_kind == CardKind.number)
                  OutlinedButton(
                    onPressed: () =>
                        host.debug(DebugSetTarget(code: _code, serverTs: 0)),
                    child: const Text('Nastavit jako cíl'),
                  ),
              ],
            ),

            const SectionHeading('Bomba a limit tahu'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton(
                  onPressed: () =>
                      host.debug(const DebugSetBomb(fuse: null, serverTs: 0)),
                  child: const Text('Bez bomby'),
                ),
                for (final fuse in [1, 2, 3])
                  OutlinedButton(
                    onPressed: () =>
                        host.debug(DebugSetBomb(fuse: fuse, serverTs: 0)),
                    child: Text('Fuse $fuse'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            LabeledSlider(
              label: 'Limit v 1. kole (teď ${seconds(state.turn.limitMs)})',
              valueText: seconds(limit.round()),
              value: limit,
              min: 800,
              max: 6000,
              divisions: 52,
              onChanged: (v) => setState(() => _limitDraft = v),
              onChangeEnd: (v) {
                host.debug(DebugSetTurnLimit(limitMs: v.round(), serverTs: 0));
                setState(() => _limitDraft = null);
              },
            ),

            const SectionHeading('Replay'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: () => _copyReplay(host.replay),
                  icon: const Icon(Icons.copy),
                  label: const Text('Kopírovat replay'),
                ),
                OutlinedButton.icon(
                  onPressed: _pasteReplay,
                  icon: const Icon(Icons.content_paste),
                  label: const Text('Načíst ze schránky'),
                ),
              ],
            ),

            const SectionHeading('Scénáře'),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: _small,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        ref.read(sessionProvider.notifier).startScenario(s);
                      },
                    ),
                ],
              ),
            ),

            const SectionHeading('Události'),
            for (final e in host.game.events.reversed.take(80))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Text('$e', style: _log),
              ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(sessionProvider.notifier).quit();
              },
              child: const Text('Ukončit hru'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeatEditor extends StatelessWidget {
  const _SeatEditor({
    required this.seat,
    required this.player,
    required this.maxLives,
    required this.onSeat,
    required this.onLives,
  });

  final SeatConfig seat;
  final PlayerState player;
  final int maxLives;
  final ValueChanged<SeatConfig> onSeat;
  final ValueChanged<int> onLives;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.fromLTRB(12, 4, 8, 8),
    decoration: BoxDecoration(
      border: Border.all(color: Palette.tableLine),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              player.name,
              style: const TextStyle(fontFamily: displayFont, fontSize: 15),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Ubrat život',
              onPressed: player.lives > 0
                  ? () => onLives(player.lives - 1)
                  : null,
              icon: const Icon(Icons.remove),
            ),
            Text('${player.lives}'),
            IconButton(
              tooltip: 'Přidat život',
              onPressed: player.lives < maxLives
                  ? () => onLives(player.lives + 1)
                  : null,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        SeatModeSelector(
          value: seat.mode,
          onChanged: (m) => onSeat(seat.copyWith(mode: m)),
        ),
        if (seat.mode == SeatMode.bot)
          BotSettings(seat: seat, onChanged: onSeat),
      ],
    ),
  );
}
