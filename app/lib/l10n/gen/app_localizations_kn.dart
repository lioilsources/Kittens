// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get tagline => 'ಬತ್ತಿ ಉರಿದು ಮುಗಿಯುವ ಮೊದಲು ಸರಿಯಾದ ಕಾರ್ಡ್ ಎಸೆಯಿರಿ.';

  @override
  String get sectionPlayers => 'ಆಟಗಾರರು';

  @override
  String get sectionRules => 'ನಿಯಮಗಳು';

  @override
  String get sectionScenarios => 'ಸನ್ನಿವೇಶಗಳು';

  @override
  String get ruleTurnLimit => '1ನೇ ಸುತ್ತಿನ ನಡೆಯ ಮಿತಿ';

  @override
  String get ruleFastThrow => 'ಎತ್ತಿಕೊಳ್ಳದೆ ತ್ವರಿತ ಎಸೆತ, ಇದರವರೆಗೆ';

  @override
  String get ruleSteal => 'ಇದಕ್ಕಿಂತ ಹೆಚ್ಚು ಹಿಂಜರಿದರೆ ಕಳ್ಳತನ';

  @override
  String get gameSpeed => 'ಆಟದ ವೇಗ';

  @override
  String get play => 'ಆಡಿ';

  @override
  String get loadReplayFromClipboard => 'ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ನಿಂದ ರಿಪ್ಲೇ ಲೋಡ್ ಮಾಡಿ';

  @override
  String get noReplayInClipboard => 'ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ನಲ್ಲಿ Kittens ರಿಪ್ಲೇ ಇಲ್ಲ';

  @override
  String get replayCopied => 'ರಿಪ್ಲೇ ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ನಲ್ಲಿದೆ';

  @override
  String get replayTitle => 'ರಿಪ್ಲೇ';

  @override
  String get seatYou => 'ನೀವು';

  @override
  String botName(int number) {
    return 'ಬಾಟ್ $number';
  }

  @override
  String get seatModeHuman => 'ಮನುಷ್ಯ';

  @override
  String get seatModeBot => 'ಬಾಟ್';

  @override
  String get seatModePaused => 'ವಿರಾಮ';

  @override
  String reactionFixed(String duration) {
    return 'ಪ್ರತಿಕ್ರಿಯೆ $duration';
  }

  @override
  String get reactionRandom => 'ಯಾದೃಚ್ಛಿಕ ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String get botIqSmart => 'ಜಾಣತನದಿಂದ ಆಡುತ್ತದೆ';

  @override
  String get botIqFirstValid => 'ಮೊದಲ ಮಾನ್ಯ ಕಾರ್ಡ್';

  @override
  String get botIqSloppy => '20% ತಪ್ಪು ಮಾಡುತ್ತದೆ';

  @override
  String get colorRed => 'ಕೆಂಪು';

  @override
  String get colorGreen => 'ಹಸಿರು';

  @override
  String get colorBlue => 'ನೀಲಿ';

  @override
  String get colorYellow => 'ಹಳದಿ';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'ಮೂಲ';

  @override
  String get cardBomb => 'ಬಾಂಬ್';

  @override
  String get cardDefuse => 'ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';

  @override
  String get cardDetonate => 'ಸ್ಫೋಟಿಸಿ';

  @override
  String get cardNope => 'ಇಲ್ಲ!';

  @override
  String get cardShield => 'ಗುರಾಣಿ';

  @override
  String get cardSteal => 'ಕಳ್ಳತನ';

  @override
  String get cardTwist => 'ತಿರುಗಿಸಿ';

  @override
  String get cardBlind => 'ಕುರುಡು';

  @override
  String get rejectNotYourTurn => 'ನಿಮ್ಮ ಸರದಿ ಅಲ್ಲ';

  @override
  String get rejectCardNotInHand => 'ಈ ಕಾರ್ಡ್ ಇನ್ನು ನಿಮ್ಮ ಬಳಿ ಇಲ್ಲ';

  @override
  String get rejectInvalidTarget => 'ಈ ಆಟಗಾರನನ್ನು ಗುರಿಯಾಗಿಸಲಾಗದು';

  @override
  String get rejectNotAReaction => 'ಈ ಕಾರ್ಡ್ ಅನ್ನು ಡೆಕ್ ಮೇಲೆ ಎಸೆಯಲಾಗುತ್ತದೆ';

  @override
  String get rejectGhost => 'ಪ್ರೇತ ಇಲ್ಲ! ಮಾತ್ರ ಆಡಬಹುದು';

  @override
  String get rejectNotGhost => 'ಕಾರ್ಡ್ ಇಲ್ಲದ ಇಲ್ಲ! ಪ್ರೇತಕ್ಕೆ ಮಾತ್ರ ಇದೆ';

  @override
  String get rejectGhostNopeUsed =>
      'ಪ್ರೇತದ ಇಲ್ಲ! ಈ ಸುತ್ತಿನಲ್ಲಿ ಈಗಾಗಲೇ ಬಳಕೆಯಾಗಿದೆ';

  @override
  String get rejectGhostNeedsCard => 'ಪ್ರೇತಕ್ಕೆ ಇಲ್ಲ! ಕಾರ್ಡ್ ಬೇಕು';

  @override
  String get rejectNothingToNope => 'ರದ್ದುಮಾಡಲು ಏನೂ ಇಲ್ಲ';

  @override
  String get rejectNoPendingLoss => 'ಗುರಾಣಿಗೆ ಈಗ ತಡವಾಗಿದೆ';

  @override
  String get rejectOwnTurn => 'ನಿಮ್ಮದೇ ಸರದಿಯನ್ನು ಕದಿಯಲಾಗದು';

  @override
  String rejectTooEarly(String duration) {
    return '$duration ಹಿಂಜರಿಕೆಯ ನಂತರ ಮಾತ್ರ ಕದಿಯಬಹುದು';
  }

  @override
  String get rejectGameOver => 'ಆಟ ಮುಗಿಯಿತು';

  @override
  String get rejectOther => 'ಆದೇಶ ತಿರಸ್ಕರಿಸಲಾಗಿದೆ';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $durationರಲ್ಲಿ';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $durationರಲ್ಲಿ, $count ಎತ್ತಿಕೊಳ್ಳುತ್ತಾರೆ';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card ಮಾನ್ಯವಲ್ಲ';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: ಸಮಯ ಮುಗಿಯಿತು';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: ಸರದಿ ಕಳ್ಳತನ ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card ಮೇಲೆ ಇಲ್ಲ!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: ಇಲ್ಲ! ವಿಫಲವಾಯಿತು';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'ಬಾಂಬ್ ಮೇಲೆ ಬಂತು, ಬತ್ತಿ $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'ಬಾಂಬ್ ಸ್ಫೋಟಗೊಂಡಿತು: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target ಮೇಲೆ ಸ್ಫೋಟಿಸಿ';
  }

  @override
  String captionShield(String player) {
    return '$player: ಗುರಾಣಿ';
  }

  @override
  String captionGhost(String player) {
    return '$player ಪ್ರೇತ';
  }

  @override
  String get hintDetonate => 'ಸ್ಫೋಟಿಸಿ ಅನ್ನು ಬಾಂಬ್ ಪಡೆಯುವ ಆಟಗಾರನ ಮೇಲೆ ಎಳೆಯಿರಿ';

  @override
  String get hintSteal => 'ಕಳ್ಳತನ ಅನ್ನು ಸರದಿಯಲ್ಲಿರುವ ಆಟಗಾರನ ಮೇಲೆ ಎಳೆಯಿರಿ';

  @override
  String toastInvalidCard(int count) {
    return 'ಅಮಾನ್ಯ ಕಾರ್ಡ್: ಒಂದು ಜೀವ ಹೋಗುತ್ತದೆ ಮತ್ತು $count ಎತ್ತಿಕೊಳ್ಳುತ್ತೀರಿ';
  }

  @override
  String get toastTimeOut => 'ಸಮಯ ಮುಗಿಯಿತು';

  @override
  String toastShieldWindow(String duration) {
    return '$durationರೊಳಗೆ ಗುರಾಣಿ!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: ನಿಮ್ಮ ಸರದಿ ಕದ್ದರು';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ನಿಮ್ಮ ಮೇಲೆ ಬಾಂಬ್ ಕಳುಹಿಸಿದರು';
  }

  @override
  String get toastNopeReturns => 'ಇಲ್ಲ! ಸರದಿಯನ್ನು ನಿಮಗೆ ಹಿಂತಿರುಗಿಸುತ್ತದೆ';

  @override
  String get yourTurn => 'ನಿಮ್ಮ ಸರದಿ';

  @override
  String onTurn(String player) {
    return 'ಸರದಿ: $player';
  }

  @override
  String deckCount(int count) {
    return 'ಡೆಕ್ $count';
  }

  @override
  String ghostName(String name) {
    return '$name (ಪ್ರೇತ)';
  }

  @override
  String get ghostNope => 'ಪ್ರೇತದ ಇಲ್ಲ!';

  @override
  String get startHelp =>
      'ಡೆಕ್ ಮೇಲಿನ ಗೆರೆ ದಾಟಿಸಿ ಅದೇ ಬಣ್ಣ ಅಥವಾ ಸಂಖ್ಯೆಯ ಕಾರ್ಡ್ ಎಸೆಯಿರಿ. ಇಲ್ಲ! ಮತ್ತು ಗುರಾಣಿಯನ್ನು ಬದಿಗೆ ಸ್ವೈಪ್ ಮಾಡಿ, ಸ್ಫೋಟಿಸಿ ಮತ್ತು ಕಳ್ಳತನವನ್ನು ಆಟಗಾರನ ಮೇಲೆ ಎಳೆಯಿರಿ.';

  @override
  String get start => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get youWin => 'ನೀವು ಗೆದ್ದಿರಿ';

  @override
  String get nobodySurvived => 'ಯಾರೂ ಉಳಿಯಲಿಲ್ಲ';

  @override
  String playerWins(String player) {
    return '$player ಗೆದ್ದರು';
  }

  @override
  String get playAgain => 'ಮತ್ತೆ ಆಡಿ';

  @override
  String get copyReplay => 'ರಿಪ್ಲೇ ನಕಲಿಸಿ';

  @override
  String get gameSettings => 'ಆಟದ ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'ಬಾಂಬ್, $fuse ನಡೆಗಳು ಬಾಕಿ',
      one: 'ಬಾಂಬ್, $fuse ನಡೆ ಬಾಕಿ',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'ಮುಂದುವರಿಸಿ';

  @override
  String get pause => 'ವಿರಾಮ';

  @override
  String get debug => 'ಡೀಬಗ್';

  @override
  String get sectionTime => 'ಸಮಯ';

  @override
  String get step => 'ಹಂತ';

  @override
  String gameClock(String duration, int round) {
    return 'ಆಟದ ಸಮಯ $duration, ಸುತ್ತು $round';
  }

  @override
  String get artificialLatency => 'ಕೃತಕ ವಿಳಂಬ';

  @override
  String get followTurn => 'ನೋಟವು ಸರದಿಯಲ್ಲಿರುವ ಆಟಗಾರನನ್ನು ಅನುಸರಿಸುತ್ತದೆ';

  @override
  String get followTurnHint => 'ಮನುಷ್ಯರು ನಿಯಂತ್ರಿಸುವ ಸ್ಥಾನಗಳು ಮಾತ್ರ';

  @override
  String get sectionForceCard => 'ಕಾರ್ಡ್ ಹೇರಿ';

  @override
  String get number => 'ಸಂಖ್ಯೆ';

  @override
  String get giveToHand => 'ಕೈಗೆ ನೀಡಿ';

  @override
  String get setAsTarget => 'ಗುರಿಯಾಗಿ ಹೊಂದಿಸಿ';

  @override
  String get sectionBombAndLimit => 'ಬಾಂಬ್ ಮತ್ತು ನಡೆಯ ಮಿತಿ';

  @override
  String get noBomb => 'ಬಾಂಬ್ ಇಲ್ಲ';

  @override
  String fuseValue(int fuse) {
    return 'ಬತ್ತಿ $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '1ನೇ ಸುತ್ತಿನ ಮಿತಿ (ಈಗ $duration)';
  }

  @override
  String get loadFromClipboard => 'ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ನಿಂದ ಲೋಡ್ ಮಾಡಿ';

  @override
  String get sectionEvents => 'ಘಟನೆಗಳು';

  @override
  String get endGame => 'ಆಟ ಮುಗಿಸಿ';

  @override
  String get removeLife => 'ಜೀವ ಕಡಿಮೆ ಮಾಡಿ';

  @override
  String get addLife => 'ಜೀವ ಸೇರಿಸಿ';
}
