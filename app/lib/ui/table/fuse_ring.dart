import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../theme.dart';

/// The turn timer drawn as a fuse burning clockwise around the deck. The part
/// still ahead of the spark shows the reward zones: green = fast throw
/// (draw 0), sulfur = normal throw, red = others may steal the turn.
class FuseRing extends StatefulWidget {
  const FuseRing({
    super.key,
    required this.size,
    required this.startedAt,
    required this.limitMs,
    required this.fastMs,
    required this.stealMs,
    required this.nowMs,
    required this.running,
    this.hapticsForMe = false,
    this.child,
  });

  final double size;
  final int startedAt;
  final int limitMs;
  final int fastMs;
  final int stealMs;
  final int Function() nowMs;
  final bool running;

  /// Light haptic when the fast window closes (plan §5).
  final bool hapticsForMe;
  final Widget? child;

  @override
  State<FuseRing> createState() => _FuseRingState();
}

class _FuseRingState extends State<FuseRing>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker = createTicker((_) => _tick());
  final _elapsed = ValueNotifier<double>(0);
  int? _hapticForTurn;

  @override
  void initState() {
    super.initState();
    _sync();
  }

  @override
  void didUpdateWidget(FuseRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sync();
  }

  void _sync() {
    if (widget.running && !_ticker.isActive) {
      _ticker.start();
    } else if (!widget.running && _ticker.isActive) {
      _ticker.stop();
    }
    _tick();
  }

  void _tick() {
    final raw = widget.nowMs() - widget.startedAt;
    final e = raw.clamp(0, widget.limitMs).toDouble();
    if (widget.hapticsForMe &&
        _hapticForTurn != widget.startedAt &&
        e >= widget.fastMs &&
        e < widget.fastMs + 300) {
      _hapticForTurn = widget.startedAt;
      HapticFeedback.lightImpact();
    }
    _elapsed.value = e;
  }

  @override
  void dispose() {
    _ticker.dispose();
    _elapsed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: widget.size,
    child: CustomPaint(
      painter: _FusePainter(
        elapsed: _elapsed,
        limit: widget.limitMs.toDouble(),
        fast: widget.fastMs.toDouble(),
        steal: widget.stealMs.toDouble(),
      ),
      child: Center(child: widget.child),
    ),
  );
}

class _FusePainter extends CustomPainter {
  _FusePainter({
    required this.elapsed,
    required this.limit,
    required this.fast,
    required this.steal,
  }) : super(repaint: elapsed);

  final ValueListenable<double> elapsed;
  final double limit;
  final double fast;
  final double steal;

  static const _start = -math.pi / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.shortestSide / 2 - 12;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final e = elapsed.value;
    double angle(double ms) => _start + 2 * math.pi * (ms / limit);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..color = Palette.tableLine,
    );

    void segment(double from, double to, Color color) {
      final a = math.max(from, e);
      final b = math.min(to, limit);
      if (b <= a) return;
      canvas.drawArc(
        rect,
        angle(a),
        angle(b) - angle(a),
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 7
          ..color = color,
      );
    }

    final fastEnd = math.min(fast, limit);
    final stealEnd = math.min(math.max(steal, fastEnd), limit);
    segment(0, fastEnd, Palette.fuseGreen);
    segment(fastEnd, stealEnd, Palette.sulfur);
    segment(stealEnd, limit, Palette.matchRed);

    if (e >= limit) return;
    final a = angle(e);
    final tip = center + Offset(math.cos(a), math.sin(a)) * radius;
    canvas.drawCircle(
      tip,
      13,
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFFFFF4CF),
            Palette.sulfur.withValues(alpha: 0.65),
            Palette.sulfur.withValues(alpha: 0),
          ],
          stops: const [0, 0.35, 1],
        ).createShader(Rect.fromCircle(center: tip, radius: 13)),
    );
    final t = e / 45;
    final spark = Paint()..color = const Color(0xFFFFE08A);
    for (var i = 0; i < 6; i++) {
      final dir = a + math.pi / 2 + math.sin(t + i * 2.1) * 1.4;
      final dist = 9 + 7 * (0.5 + 0.5 * math.sin(t * 1.7 + i * 1.3));
      canvas.drawCircle(
        tip + Offset(math.cos(dir), math.sin(dir)) * dist,
        1.3,
        spark,
      );
    }
  }

  @override
  bool shouldRepaint(_FusePainter old) =>
      old.limit != limit ||
      old.fast != fast ||
      old.steal != steal ||
      old.elapsed != elapsed;
}
