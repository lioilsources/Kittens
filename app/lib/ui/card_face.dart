import 'dart:math' as math;

import 'package:flutter/material.dart' hide Card;
import 'package:fuse_core/fuse_core.dart';

import 'theme.dart';

const cardAspect = 1.42;

/// A printed card. Number cards carry a colour mark (circle, triangle,
/// square, star) so colour is readable without relying on hue alone.
class CardFace extends StatelessWidget {
  const CardFace({
    super.key,
    required this.card,
    this.width = 72,
    this.faceDown = false,
    this.lifted = false,
  });

  final Card card;
  final double width;
  final bool faceDown;
  final bool lifted;

  @override
  Widget build(BuildContext context) {
    final height = width * cardAspect;
    final radius = BorderRadius.circular(width * 0.09);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: faceDown ? Palette.tableDeep : Palette.stock,
        borderRadius: radius,
        border: Border.all(
          color: faceDown
              ? Palette.sulfur.withValues(alpha: 0.5)
              : Palette.stockEdge,
          width: faceDown ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: lifted ? 0.55 : 0.35),
            blurRadius: lifted ? 14 : 5,
            offset: Offset(0, lifted ? 8 : 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: faceDown
            ? _Back(width: width)
            : card.isNumber
            ? _NumberFace(card: card, width: width)
            : _SpecialFace(card: card, width: width),
      ),
    );
  }
}

class _NumberFace extends StatelessWidget {
  const _NumberFace({required this.card, required this.width});

  final Card card;
  final double width;

  @override
  Widget build(BuildContext context) {
    final color = card.color!;
    final corner = TextStyle(
      fontFamily: displayFont,
      fontSize: width * 0.2,
      height: 1,
      color: color.ink,
    );
    return Stack(
      children: [
        Positioned(
          left: width * 0.08,
          top: width * 0.07,
          child: Column(
            children: [
              Text('${card.number}', style: corner),
              SizedBox(height: width * 0.03),
              ColorMark(color: color, size: width * 0.13),
            ],
          ),
        ),
        Center(
          child: Text(
            '${card.number}',
            style: TextStyle(
              fontFamily: displayFont,
              fontSize: width * 0.56,
              height: 1,
              color: color.ink,
            ),
          ),
        ),
        Positioned(
          right: width * 0.08,
          bottom: width * 0.08,
          child: ColorMark(color: color, size: width * 0.2),
        ),
      ],
    );
  }
}

class _SpecialFace extends StatelessWidget {
  const _SpecialFace({required this.card, required this.width});

  final Card card;
  final double width;

  @override
  Widget build(BuildContext context) {
    final kind = card.kind;
    return Column(
      children: [
        Container(height: width * 0.14, color: kind.stripe),
        Expanded(
          child: Icon(kind.icon, size: width * 0.42, color: Palette.ink),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(4, 0, 4, width * 0.12),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              kind.nameCs,
              style: TextStyle(
                fontFamily: displayFont,
                fontSize: width * 0.19,
                color: Palette.ink,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Back extends StatelessWidget {
  const _Back({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      '?',
      style: TextStyle(
        fontFamily: displayFont,
        fontSize: width * 0.5,
        color: Palette.sulfur.withValues(alpha: 0.8),
      ),
    ),
  );
}

/// Shape per colour, drawn (not a glyph) so it renders identically everywhere.
class ColorMark extends StatelessWidget {
  const ColorMark({super.key, required this.color, required this.size});

  final CardColor color;
  final double size;

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size.square(size), painter: _MarkPainter(color));
}

class _MarkPainter extends CustomPainter {
  _MarkPainter(this.color);

  final CardColor color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.ink;
    final s = size.width;
    final c = Offset(s / 2, s / 2);
    switch (color) {
      case CardColor.red:
        canvas.drawCircle(c, s / 2, paint);
      case CardColor.green:
        canvas.drawPath(
          Path()
            ..moveTo(s / 2, 0)
            ..lineTo(s, s * 0.92)
            ..lineTo(0, s * 0.92)
            ..close(),
          paint,
        );
      case CardColor.blue:
        canvas.drawRect(
          Rect.fromLTWH(s * 0.06, s * 0.06, s * 0.88, s * 0.88),
          paint,
        );
      case CardColor.yellow:
        final path = Path();
        for (var i = 0; i < 10; i++) {
          final r = i.isEven ? s / 2 : s / 4.6;
          final a = -math.pi / 2 + i * math.pi / 5;
          final p = c + Offset(math.cos(a), math.sin(a)) * r;
          i == 0 ? path.moveTo(p.dx, p.dy) : path.lineTo(p.dx, p.dy);
        }
        canvas.drawPath(path..close(), paint);
    }
  }

  @override
  bool shouldRepaint(_MarkPainter old) => old.color != color;
}
