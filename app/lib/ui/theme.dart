import 'package:flutter/material.dart';
import 'package:fuse_core/fuse_core.dart';
import 'package:intl/intl.dart';

/// Matchbox-label palette: ink-blue table, kraft card stock, sulfur and
/// match-head red for everything that burns.
abstract final class Palette {
  static const table = Color(0xFF1B2447);
  static const tableDeep = Color(0xFF111833);
  static const tableLine = Color(0xFF34407A);
  static const seat = Color(0xFF263163);
  static const stock = Color(0xFFF2E6CC);
  static const stockEdge = Color(0xFFD5C39C);
  static const ink = Color(0xFF221A13);
  static const sulfur = Color(0xFFF2B632);
  static const matchRed = Color(0xFFD6362B);
  static const fuseGreen = Color(0xFF55A870);
  static const text = Color(0xFFEDE5D2);
  static const muted = Color(0xFF9098BD);
}

const displayFont = 'AlfaSlabOne';

extension CardColorStyle on CardColor {
  /// Printed ink on card stock.
  Color get ink => switch (this) {
    CardColor.red => const Color(0xFFC4302A),
    CardColor.green => const Color(0xFF2E7A4D),
    CardColor.blue => const Color(0xFF2B55A1),
    CardColor.yellow => const Color(0xFFC98C08),
  };
}

extension CardKindStyle on CardKind {
  IconData get icon => switch (this) {
    CardKind.number => Icons.circle,
    CardKind.bomb => Icons.brightness_high,
    CardKind.defuse => Icons.content_cut,
    CardKind.detonate => Icons.local_fire_department,
    CardKind.nope => Icons.block,
    CardKind.shield => Icons.shield,
    CardKind.steal => Icons.back_hand,
    CardKind.twist => Icons.swap_vert,
    CardKind.blind => Icons.visibility_off,
  };

  /// Stripe colour groups cards by how they are played: sulfur = reaction
  /// (swipe to the side), red = bomb cards, ink = changes the table.
  Color get stripe => switch (this) {
    CardKind.nope || CardKind.shield || CardKind.steal => Palette.sulfur,
    CardKind.defuse || CardKind.detonate || CardKind.bomb => Palette.matchRed,
    CardKind.twist || CardKind.blind || CardKind.number => Palette.ink,
  };
}

ThemeData buildTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Palette.sulfur,
      onPrimary: Palette.ink,
      secondary: Palette.matchRed,
      surface: Palette.tableDeep,
      onSurface: Palette.text,
      error: Palette.matchRed,
    ),
    scaffoldBackgroundColor: Palette.table,
  );
  return base.copyWith(
    textTheme: base.textTheme.apply(
      bodyColor: Palette.text,
      displayColor: Palette.text,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Palette.tableDeep),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? Palette.stock
              : Colors.transparent,
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? Palette.ink : Palette.text,
        ),
        side: const WidgetStatePropertyAll(
          BorderSide(color: Palette.tableLine),
        ),
      ),
    ),
    sliderTheme: base.sliderTheme.copyWith(
      activeTrackColor: Palette.sulfur,
      thumbColor: Palette.sulfur,
      inactiveTrackColor: Palette.tableLine,
    ),
  );
}

/// `1,5 s` — decimal separator follows [Intl.defaultLocale], which the app
/// keeps in sync with the active UI locale.
String seconds(int ms, {int digits = 1}) =>
    '${NumberFormat.decimalPatternDigits(decimalDigits: digits).format(ms / 1000)} s';
