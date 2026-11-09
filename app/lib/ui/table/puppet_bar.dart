import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../session/seat.dart';
import '../../state/providers.dart';
import '../theme.dart';
import 'seat_avatar.dart';

/// Puppet mode switcher (plan §6.2): tap a player to see their hand and
/// throw for them. The player on turn carries the sulfur dot.
class PuppetBar extends ConsumerWidget {
  const PuppetBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final host = ref.watch(hostProvider);
    final puppet = ref.watch(puppetProvider);
    if (host == null) return const SizedBox.shrink();
    final state = host.state;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 6, 4, 0),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final p in state.players)
                    _SeatChip(
                      name: p.name,
                      lives: p.lives,
                      maxLives: state.rules.startLives,
                      mode: host.seats[p.id]?.mode ?? SeatMode.bot,
                      selected: p.id == puppet.viewAs,
                      onTurn: !state.isOver && state.turn.playerId == p.id,
                      onTap: () =>
                          ref.read(puppetProvider.notifier).viewAs(p.id),
                    ),
                ],
              ),
            ),
          ),
          IconButton(
            tooltip: host.paused ? context.l10n.resume : context.l10n.pause,
            onPressed: () => host.paused
                ? ref.read(sessionProvider)?.host.resume()
                : ref.read(sessionProvider)?.host.pause(),
            icon: Icon(host.paused ? Icons.play_arrow : Icons.pause),
          ),
          IconButton(
            tooltip: context.l10n.debug,
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
    );
  }
}

class _SeatChip extends StatelessWidget {
  const _SeatChip({
    required this.name,
    required this.lives,
    required this.maxLives,
    required this.mode,
    required this.selected,
    required this.onTurn,
    required this.onTap,
  });

  final String name;
  final int lives;
  final int maxLives;
  final SeatMode mode;
  final bool selected;
  final bool onTurn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = selected ? Palette.ink : Palette.text;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 6),
      child: Material(
        color: selected ? Palette.stock : Colors.transparent,
        shape: StadiumBorder(
          side: BorderSide(color: selected ? Palette.stock : Palette.tableLine),
        ),
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: onTurn ? Palette.sulfur : Colors.transparent,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  initials(name),
                  style: TextStyle(
                    fontFamily: displayFont,
                    fontSize: 13,
                    color: lives > 0 ? fg : Palette.muted,
                  ),
                ),
                const SizedBox(width: 5),
                LivesRow(lives: lives, max: maxLives),
                if (mode != SeatMode.human) ...[
                  const SizedBox(width: 4),
                  Icon(
                    mode == SeatMode.bot ? Icons.smart_toy : Icons.pause,
                    size: 13,
                    color: selected ? Palette.ink : Palette.muted,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
