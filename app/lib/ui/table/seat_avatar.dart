import 'package:flutter/material.dart';
import 'package:fuse_core/fuse_core.dart';

import '../../l10n/l10n.dart';
import '../../session/seat.dart';
import '../theme.dart';

String initials(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  if (parts.length == 1) {
    return parts.first.length <= 2 ? parts.first : parts.first.substring(0, 2);
  }
  return parts.take(2).map((p) => p.isEmpty ? '' : p[0]).join().toUpperCase();
}

/// A player at the table. Also a drop target for Odpal and Kradež.
class SeatAvatar extends StatefulWidget {
  const SeatAvatar({
    super.key,
    required this.seat,
    required this.mode,
    required this.maxLives,
    this.onTurn = false,
    this.highlighted = false,
    this.pendingLoss = 0,
    this.size = 54,
  });

  final SeatView seat;
  final SeatMode mode;
  final int maxLives;
  final bool onTurn;
  final bool highlighted;

  /// Lives about to be lost (Štít window open).
  final int pendingLoss;
  final double size;

  @override
  State<SeatAvatar> createState() => _SeatAvatarState();
}

class _SeatAvatarState extends State<SeatAvatar>
    with SingleTickerProviderStateMixin {
  late final _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  );

  @override
  void initState() {
    super.initState();
    _syncPulse();
  }

  @override
  void didUpdateWidget(SeatAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncPulse();
  }

  void _syncPulse() {
    if (widget.pendingLoss > 0 && !_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    } else if (widget.pendingLoss == 0 && _pulse.isAnimating) {
      _pulse
        ..stop()
        ..value = 0;
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final seat = widget.seat;
    final ghost = seat.isGhost;
    final ring = widget.highlighted || widget.onTurn
        ? Palette.sulfur
        : Palette.tableLine;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _pulse,
          builder: (context, child) {
            final danger = widget.pendingLoss > 0;
            return Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ghost ? Palette.tableDeep : Palette.seat,
                border: Border.all(
                  color: danger
                      ? Color.lerp(
                          ring,
                          Palette.matchRed,
                          0.4 + 0.6 * _pulse.value,
                        )!
                      : ring,
                  width: widget.highlighted || widget.onTurn || danger
                      ? 3
                      : 1.5,
                ),
                boxShadow: [
                  if (widget.highlighted)
                    BoxShadow(
                      color: Palette.sulfur.withValues(alpha: 0.5),
                      blurRadius: 20,
                    ),
                  if (danger)
                    BoxShadow(
                      color: Palette.matchRed.withValues(
                        alpha: 0.5 * _pulse.value,
                      ),
                      blurRadius: 18,
                    ),
                ],
              ),
              child: child,
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Text(
                initials(seat.name),
                style: TextStyle(
                  fontFamily: displayFont,
                  fontSize: widget.size * 0.34,
                  color: ghost ? Palette.muted : Palette.text,
                ),
              ),
              Positioned(
                right: -4,
                bottom: -4,
                child: _ModeBadge(mode: widget.mode, ghost: ghost),
              ),
              if (widget.pendingLoss > 0)
                Positioned(
                  top: -6,
                  right: -8,
                  child: _LossBadge(amount: widget.pendingLoss),
                ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          ghost ? context.l10n.ghostName(seat.name) : seat.name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: ghost ? Palette.muted : Palette.text,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            LivesRow(lives: seat.lives, max: widget.maxLives),
            const SizedBox(width: 6),
            const Icon(Icons.style, size: 12, color: Palette.muted),
            const SizedBox(width: 2),
            Text(
              '${seat.handCount}',
              style: const TextStyle(fontSize: 11, color: Palette.muted),
            ),
          ],
        ),
      ],
    );
  }
}

/// Lives as match heads: red = left, dark = burnt.
class LivesRow extends StatelessWidget {
  const LivesRow({super.key, required this.lives, required this.max});

  final int lives;
  final int max;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (var i = 0; i < max; i++)
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 1.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i < lives ? Palette.matchRed : Palette.tableLine,
          ),
        ),
    ],
  );
}

class _ModeBadge extends StatelessWidget {
  const _ModeBadge({required this.mode, required this.ghost});

  final SeatMode mode;
  final bool ghost;

  @override
  Widget build(BuildContext context) {
    final icon = switch (mode) {
      SeatMode.human => Icons.person,
      SeatMode.bot => Icons.smart_toy,
      SeatMode.paused => Icons.pause,
    };
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: Palette.tableDeep,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 12, color: ghost ? Palette.muted : Palette.text),
    );
  }
}

class _LossBadge extends StatelessWidget {
  const _LossBadge({required this.amount});

  final int amount;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    decoration: BoxDecoration(
      color: Palette.matchRed,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      '−$amount',
      style: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    ),
  );
}
