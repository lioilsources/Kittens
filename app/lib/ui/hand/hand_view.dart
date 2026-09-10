import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:fuse_core/fuse_core.dart';

import '../card_face.dart';

/// Where a dragged card is (global coordinates resolved by the table).
sealed class DropZone {
  const DropZone();
}

/// Above the deck line, in the deck column.
final class DeckZone extends DropZone {
  const DeckZone();
}

final class SeatZone extends DropZone {
  const SeatZone(this.playerId);

  final String playerId;
}

/// Left or right edge of the table (reactions with an implicit target).
final class SideZone extends DropZone {
  const SideZone();
}

final class NoZone extends DropZone {
  const NoZone();
}

/// Cards that count the moment they cross the deck line (plan §5). Reaction
/// and target cards resolve on release, so dragging them to an avatar
/// across the deck column never throws them by accident.
bool throwsOnCross(CardKind kind) => switch (kind) {
  CardKind.number ||
  CardKind.twist ||
  CardKind.blind ||
  CardKind.defuse => true,
  _ => false,
};

/// The fanned hand. The card follows the finger; the table decides what a
/// drop means and the host decides whether it was valid — until the host
/// answers, a played card stays hidden instead of being removed locally.
class HandView extends StatefulWidget {
  const HandView({
    super.key,
    required this.cards,
    required this.version,
    required this.resolveZone,
    required this.deckCenter,
    required this.deckLineY,
    required this.onThrow,
    required this.onRelease,
    this.onDragChanged,
    this.shakeToken = 0,
    this.bottomInset = 14,
    this.maxCardWidth = 80,
  });

  final List<Card> cards;

  /// Snapshot version; a newer one means the host has answered.
  final int version;
  final DropZone Function(Offset global) resolveZone;
  final Offset Function() deckCenter;

  /// Global y of the deck line.
  final double Function() deckLineY;

  /// A throwable card crossed the deck line (or was flicked up).
  final void Function(Card card) onThrow;

  /// A card was released over [zone] at [global]. Return the global point it
  /// should fly to when it was played, or null to send it back into the hand.
  final Offset? Function(Card card, DropZone zone, Offset global) onRelease;
  final ValueChanged<Card?>? onDragChanged;

  /// Changing it shakes the hand (invalid throw).
  final int shakeToken;
  final double bottomInset;
  final double maxCardWidth;

  @override
  State<HandView> createState() => _HandViewState();
}

final class _Drag {
  _Drag(this.card, this.center, this.grab) : start = center;

  final Card card;
  Offset center;
  final Offset grab;

  /// Where the drag began, to tell an upward swipe from a diagonal one.
  final Offset start;
}

final class _Flight {
  _Flight(this.card, this.controller, this.from, this.to);

  final Card card;
  final AnimationController controller;
  final Offset from;
  final Offset to;
}

class _HandViewState extends State<HandView> with TickerProviderStateMixin {
  static const _lift = 18.0;

  late final AnimationController _shake = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 380),
  );
  final Map<int, Offset> _slotCenters = {};
  final Map<int, _Flight> _flights = {};

  /// Played cards waiting for the host: id → snapshot version at the time.
  final Map<int, int> _pending = {};

  /// Safety net per played card: never hide it forever if no answer comes.
  final Map<int, Timer> _pendingTimeouts = {};
  int? _touchedId;
  _Drag? _drag;
  double _cardWidth = 80;

  @override
  void didUpdateWidget(HandView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.version != widget.version) _resolvePending();
    if (oldWidget.shakeToken != widget.shakeToken) {
      _shake.forward(from: 0);
    }
  }

  @override
  void dispose() {
    for (final f in _flights.values) {
      f.controller.dispose();
    }
    for (final t in _pendingTimeouts.values) {
      t.cancel();
    }
    _shake.dispose();
    super.dispose();
  }

  void _resolvePending() {
    final inHand = {for (final c in widget.cards) c.id};
    _pending.removeWhere((id, sentAt) {
      if (!inHand.contains(id)) return true; // played
      // Still in hand after the host answered and the flight landed: it
      // bounced (invalid throw or rejected command).
      return widget.version > sentAt && !_flights.containsKey(id);
    });
  }

  RenderBox get _box => context.findRenderObject()! as RenderBox;
  Offset _toLocal(Offset global) => _box.globalToLocal(global);
  Offset _toGlobal(Offset local) => _box.localToGlobal(local);

  // -------------------------------------------------------------- gestures

  void _start(Card card, Offset global) {
    final local = _toLocal(global);
    final slot = (_slotCenters[card.id] ?? local) - const Offset(0, _lift);
    setState(() => _drag = _Drag(card, slot, local - slot));
    HapticFeedback.selectionClick();
    widget.onDragChanged?.call(card);
  }

  void _update(Card card, Offset global) {
    final drag = _drag;
    if (drag == null || drag.card.id != card.id) return;
    drag.center = _toLocal(global) - drag.grab;
    if (throwsOnCross(card.kind) && _crossedDeckLine(drag)) {
      _commitThrow(drag);
      return;
    }
    setState(() {});
  }

  /// Above the deck line after an upward swipe (plan §5). A diagonal swipe
  /// only counts when it ends right in the deck column.
  bool _crossedDeckLine(_Drag drag) {
    final global = _toGlobal(drag.center);
    if (global.dy >= widget.deckLineY()) return false;
    final moved = drag.center - drag.start;
    if (moved.dy >= 0) return false;
    return moved.dx.abs() <= -moved.dy * 0.75 ||
        widget.resolveZone(global) is DeckZone;
  }

  void _end(Card card, Velocity velocity) {
    final drag = _drag;
    if (drag == null || drag.card.id != card.id) return;
    final zone = widget.resolveZone(_toGlobal(drag.center));
    final v = velocity.pixelsPerSecond;
    final flickUp = v.dy < -900 && v.dx.abs() < v.dy.abs() * 0.7;
    if (throwsOnCross(card.kind) && flickUp && zone is! SeatZone) {
      _commitThrow(drag);
      return;
    }
    final target = widget.onRelease(card, zone, _toGlobal(drag.center));
    _endDrag();
    if (target != null) {
      _fly(card, drag.center, _toLocal(target), played: true);
    } else {
      _fly(
        card,
        drag.center,
        _slotCenters[card.id] ?? drag.center,
        played: false,
      );
    }
  }

  void _cancel(Card card) {
    final drag = _drag;
    if (drag == null || drag.card.id != card.id) return;
    _endDrag();
    _fly(
      card,
      drag.center,
      _slotCenters[card.id] ?? drag.center,
      played: false,
    );
  }

  void _commitThrow(_Drag drag) {
    widget.onThrow(drag.card);
    _endDrag();
    _fly(drag.card, drag.center, _toLocal(widget.deckCenter()), played: true);
  }

  void _endDrag() {
    _drag = null;
    _touchedId = null;
    widget.onDragChanged?.call(null);
  }

  void _fly(Card card, Offset from, Offset to, {required bool played}) {
    final controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: played ? 170 : 150),
    );
    _flights.remove(card.id)?.controller.dispose();
    _flights[card.id] = _Flight(card, controller, from, to);
    if (played) _pending[card.id] = widget.version;
    setState(() {});
    controller.forward().whenComplete(() {
      if (!mounted) return;
      setState(() {
        if (_flights[card.id]?.controller == controller) {
          _flights.remove(card.id);
        }
        controller.dispose();
        _resolvePending();
      });
      if (played) {
        _pendingTimeouts.remove(card.id)?.cancel();
        _pendingTimeouts[card.id] = Timer(
          const Duration(milliseconds: 1500),
          () {
            _pendingTimeouts.remove(card.id);
            if (mounted && _pending.remove(card.id) != null) setState(() {});
          },
        );
      }
    });
  }

  // ---------------------------------------------------------------- layout

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth;
      final height = constraints.maxHeight;
      final draggingId = _drag?.card.id;
      final inFan = [
        for (final c in widget.cards)
          if (!_pending.containsKey(c.id) && !_flights.containsKey(c.id)) c,
      ];
      final slots = [
        for (final c in widget.cards)
          if (!_pending.containsKey(c.id)) c,
      ];
      final n = slots.length;
      final available = width - 24;
      final cw = n == 0
          ? widget.maxCardWidth
          : math.min(widget.maxCardWidth, available / (1 + 0.5 * (n - 1)));
      _cardWidth = cw;
      final ch = cw * cardAspect;
      final step = n <= 1
          ? 0.0
          : math.min(cw * 0.9, (available - cw) / (n - 1));
      final left = (width - (cw + step * (n - 1))) / 2;
      final baseTop = height - widget.bottomInset - ch;
      final angles = <int, double>{};

      _slotCenters.clear();
      for (var i = 0; i < n; i++) {
        final d = i - (n - 1) / 2;
        _slotCenters[slots[i].id] = Offset(
          left + i * step + cw / 2,
          baseTop + ch / 2 + d * d * 1.6,
        );
        angles[slots[i].id] = d * math.min(0.055, 0.45 / n);
      }

      Widget card(
        Card c,
        Offset center, {
        required double angle,
        required bool lifted,
      }) {
        return Positioned(
          key: ValueKey(c.id),
          left: center.dx - cw / 2,
          top: center.dy - ch / 2,
          child: Transform.rotate(
            angle: angle,
            child: Transform.scale(
              scale: c.id == draggingId ? 1.08 : 1.0,
              child: Listener(
                onPointerDown: (_) => setState(() => _touchedId = c.id),
                onPointerUp: (_) => setState(() => _touchedId = null),
                onPointerCancel: (_) => setState(() => _touchedId = null),
                child: GestureDetector(
                  dragStartBehavior: DragStartBehavior.down,
                  onPanStart: (d) => _start(c, d.globalPosition),
                  onPanUpdate: (d) => _update(c, d.globalPosition),
                  onPanEnd: (d) => _end(c, d.velocity),
                  onPanCancel: () => _cancel(c),
                  child: CardFace(
                    key: ValueKey('card-${c.id}'),
                    card: c,
                    width: cw,
                    lifted: lifted,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      final children = <Widget>[
        for (final c in inFan)
          if (c.id != draggingId)
            card(
              c,
              _slotCenters[c.id]! - Offset(0, _touchedId == c.id ? _lift : 0),
              angle: _touchedId == c.id ? 0 : angles[c.id]!,
              lifted: _touchedId == c.id,
            ),
        if (_drag != null && inFan.any((c) => c.id == draggingId))
          card(_drag!.card, _drag!.center, angle: 0, lifted: true),
        for (final f in _flights.values)
          AnimatedBuilder(
            key: ValueKey('flight-${f.card.id}'),
            animation: f.controller,
            builder: (context, child) {
              final t = Curves.easeOut.transform(f.controller.value);
              final p = Offset.lerp(f.from, f.to, t)!;
              final played = _pending.containsKey(f.card.id);
              return Positioned(
                left: p.dx - _cardWidth / 2,
                top: p.dy - _cardWidth * cardAspect / 2,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: played ? 1 - 0.6 * t : 1,
                    child: Transform.scale(
                      scale: played ? 1.08 - 0.28 * t : 1,
                      child: child,
                    ),
                  ),
                ),
              );
            },
            child: CardFace(card: f.card, width: cw, lifted: true),
          ),
      ];

      return AnimatedBuilder(
        animation: _shake,
        builder: (context, child) {
          final t = _shake.value;
          final dx = _shake.isAnimating
              ? math.sin(t * math.pi * 7) * (1 - t) * 12
              : 0.0;
          return Transform.translate(offset: Offset(dx, 0), child: child);
        },
        child: Stack(clipBehavior: Clip.none, children: children),
      );
    },
  );
}
