import 'package:flutter/widgets.dart';
import 'package:fuse_core/fuse_core.dart';

import '../session/seat.dart';
import '../ui/theme.dart';
import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';

extension L10nContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Display names for core and session enums; fuse_core itself stays
/// language-neutral apart from its Czech debug labels.
extension L10nLabels on AppLocalizations {
  String colorName(CardColor color) => switch (color) {
    CardColor.red => colorRed,
    CardColor.green => colorGreen,
    CardColor.blue => colorBlue,
    CardColor.yellow => colorYellow,
  };

  String kindName(CardKind kind) => switch (kind) {
    CardKind.number => cardNumber,
    CardKind.bomb => cardBomb,
    CardKind.defuse => cardDefuse,
    CardKind.detonate => cardDetonate,
    CardKind.nope => cardNope,
    CardKind.shield => cardShield,
    CardKind.steal => cardSteal,
    CardKind.twist => cardTwist,
    CardKind.blind => cardBlind,
  };

  String cardLabel(Card card) => card.isNumber
      ? cardNumberLabel(colorName(card.color!), card.number!)
      : kindName(card.kind);

  String seatModeName(SeatMode mode) => switch (mode) {
    SeatMode.human => seatModeHuman,
    SeatMode.bot => seatModeBot,
    SeatMode.paused => seatModePaused,
  };

  String botIqName(BotIq iq) => switch (iq) {
    BotIq.smart => botIqSmart,
    BotIq.firstValid => botIqFirstValid,
    BotIq.sloppy => botIqSloppy,
  };

  String reactionName(ReactionPreset preset) => switch (preset.model) {
    FixedReaction(:final ms) => reactionFixed(seconds(ms)),
    _ => reactionRandom,
  };
}
