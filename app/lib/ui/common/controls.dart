import 'package:flutter/material.dart';
import 'package:fuse_core/fuse_core.dart';
import 'package:intl/intl.dart';

import '../../l10n/l10n.dart';
import '../../session/seat.dart';
import '../theme.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 22, bottom: 8),
    child: Text(
      text,
      style: const TextStyle(
        fontFamily: displayFont,
        fontSize: 18,
        color: Palette.text,
      ),
    ),
  );
}

class LabeledSlider extends StatelessWidget {
  const LabeledSlider({
    super.key,
    required this.label,
    required this.valueText,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
    this.onChangeEnd,
  });

  final String label;
  final String valueText;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;
  final ValueChanged<double>? onChangeEnd;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        children: [
          Expanded(child: Text(label)),
          Text(valueText, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
      Slider(
        value: value.clamp(min, max),
        min: min,
        max: max,
        divisions: divisions,
        onChanged: onChanged,
        onChangeEnd: onChangeEnd,
      ),
    ],
  );
}

class SeatModeSelector extends StatelessWidget {
  const SeatModeSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final SeatMode value;
  final ValueChanged<SeatMode> onChanged;

  static IconData iconFor(SeatMode mode) => switch (mode) {
    SeatMode.human => Icons.person,
    SeatMode.bot => Icons.smart_toy,
    SeatMode.paused => Icons.pause,
  };

  /// Equal-width toggles: fits any width, unlike a segmented button.
  @override
  Widget build(BuildContext context) => Row(
    children: [
      for (final m in SeatMode.values)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Material(
              color: m == value ? Palette.stock : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: m == value ? Palette.stock : Palette.tableLine,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => onChanged(m),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          iconFor(m),
                          size: 16,
                          color: m == value ? Palette.ink : Palette.muted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          context.l10n.seatModeName(m),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: m == value ? Palette.ink : Palette.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    ],
  );
}

class BotSettings extends StatelessWidget {
  const BotSettings({super.key, required this.seat, required this.onChanged});

  final SeatConfig seat;
  final ValueChanged<SeatConfig> onChanged;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: DropdownButton<BotIq>(
          isExpanded: true,
          value: seat.iq,
          items: [
            for (final iq in BotIq.values)
              DropdownMenuItem(
                value: iq,
                child: Text(context.l10n.botIqName(iq)),
              ),
          ],
          onChanged: (v) {
            if (v != null) onChanged(seat.copyWith(iq: v));
          },
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: DropdownButton<ReactionPreset>(
          isExpanded: true,
          value: seat.reaction,
          items: [
            for (final r in ReactionPreset.values)
              DropdownMenuItem(
                value: r,
                child: Text(context.l10n.reactionName(r)),
              ),
          ],
          onChanged: (v) {
            if (v != null) onChanged(seat.copyWith(reaction: v));
          },
        ),
      ),
    ],
  );
}

/// `0,25×`, `1×` — locale-aware decimal separator, see [seconds].
String factor(double value) => '${NumberFormat('0.##').format(value)}×';
