import 'package:flutter/material.dart' hide Card;
import 'package:fuse_core/fuse_core.dart';

import '../../l10n/l10n.dart';
import '../card_face.dart';
import '../theme.dart';
import 'fuse_ring.dart';

/// The target card inside the burning fuse ring, with the bomb, Otoč and
/// Slepá markers around it.
class DeckView extends StatelessWidget {
  const DeckView({
    super.key,
    required this.view,
    required this.nowMs,
    required this.running,
    required this.size,
    this.glow = false,
  });

  final PlayerView view;
  final int Function() nowMs;
  final bool running;
  final double size;

  /// A throwable card is being dragged.
  final bool glow;

  @override
  Widget build(BuildContext context) {
    final rules = view.rules;
    final target = view.target;
    final bomb = view.bomb;
    final cardWidth = size * 0.4;
    return FuseRing(
      size: size,
      startedAt: view.turn.startedAt,
      limitMs: view.turn.limitMs,
      fastMs: rules.fastThrowMs,
      stealMs: rules.stealThresholdMs,
      nowMs: nowMs,
      running: running && !view.isOver,
      hapticsForMe: view.isMyTurn,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            width: cardWidth * 1.25,
            height: cardWidth * cardAspect * 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                if (glow)
                  BoxShadow(
                    color: Palette.sulfur.withValues(alpha: 0.35),
                    blurRadius: 30,
                    spreadRadius: 4,
                  ),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 160),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: Tween(begin: 1.25, end: 1.0).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: CardFace(
              key: ValueKey(target?.id ?? -1),
              card: target ?? Card.special(-1, CardKind.blind),
              width: cardWidth,
              faceDown: target == null,
            ),
          ),
          if (bomb != null)
            Positioned(
              top: -cardWidth * 0.28,
              right: -cardWidth * 0.42,
              child: BombBadge(fuse: bomb.fuse),
            ),
          if (view.matchMode == MatchMode.twist)
            Positioned(
              bottom: -cardWidth * 0.12,
              left: -cardWidth * 0.5,
              child: const _Marker(icon: Icons.swap_vert, text: '±1'),
            ),
          if (view.blindTurnsLeft > 0)
            Positioned(
              bottom: -cardWidth * 0.12,
              right: -cardWidth * 0.5,
              child: _Marker(
                icon: Icons.visibility_off,
                text: '${view.blindTurnsLeft}',
              ),
            ),
        ],
      ),
    );
  }
}

/// Bomb with the number of completed turns left on its fuse.
class BombBadge extends StatelessWidget {
  const BombBadge({super.key, required this.fuse});

  final int fuse;

  @override
  Widget build(BuildContext context) => Semantics(
    label: context.l10n.bombTurnsLeft(fuse),
    child: Container(
      width: 42,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Palette.ink,
        border: Border.all(
          color: fuse <= 1 ? Palette.matchRed : Palette.sulfur,
          width: fuse <= 1 ? 3 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Palette.matchRed.withValues(alpha: fuse <= 1 ? 0.6 : 0.2),
            blurRadius: 14,
          ),
        ],
      ),
      child: Text(
        '$fuse',
        style: const TextStyle(
          fontFamily: displayFont,
          fontSize: 20,
          color: Palette.sulfur,
        ),
      ),
    ),
  );
}

class _Marker extends StatelessWidget {
  const _Marker({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    decoration: BoxDecoration(
      color: Palette.tableDeep,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Palette.sulfur.withValues(alpha: 0.6)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: Palette.sulfur),
        const SizedBox(width: 3),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Palette.sulfur,
          ),
        ),
      ],
    ),
  );
}
