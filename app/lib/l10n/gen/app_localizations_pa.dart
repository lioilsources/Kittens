// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get tagline => 'ਫ਼ਿਊਜ਼ ਸੜਨ ਤੋਂ ਪਹਿਲਾਂ ਸਹੀ ਪੱਤਾ ਸੁੱਟੋ।';

  @override
  String get sectionPlayers => 'ਖਿਡਾਰੀ';

  @override
  String get sectionRules => 'ਨਿਯਮ';

  @override
  String get sectionScenarios => 'ਹਾਲਾਤ';

  @override
  String get ruleTurnLimit => 'ਪਹਿਲੇ ਗੇੜ ਵਿੱਚ ਚਾਲ ਦੀ ਹੱਦ';

  @override
  String get ruleFastThrow => 'ਬਿਨਾਂ ਚੁੱਕੇ ਤੇਜ਼ ਸੁੱਟ, ਹੱਦ';

  @override
  String get ruleSteal => 'ਇਸ ਤੋਂ ਲੰਮੀ ਝਿਜਕ ਮਗਰੋਂ ਚੋਰੀ';

  @override
  String get gameSpeed => 'ਖੇਡ ਦੀ ਰਫ਼ਤਾਰ';

  @override
  String get play => 'ਖੇਡੋ';

  @override
  String get loadReplayFromClipboard => 'ਕਲਿੱਪਬੋਰਡ ਤੋਂ ਰੀਪਲੇ ਲੋਡ ਕਰੋ';

  @override
  String get noReplayInClipboard => 'ਕਲਿੱਪਬੋਰਡ ਵਿੱਚ Kittens ਰੀਪਲੇ ਨਹੀਂ ਹੈ';

  @override
  String get replayCopied => 'ਰੀਪਲੇ ਕਲਿੱਪਬੋਰਡ ਵਿੱਚ ਹੈ';

  @override
  String get replayTitle => 'ਰੀਪਲੇ';

  @override
  String get seatYou => 'ਤੁਸੀਂ';

  @override
  String botName(int number) {
    return 'ਬੋਟ $number';
  }

  @override
  String get seatModeHuman => 'ਇਨਸਾਨ';

  @override
  String get seatModeBot => 'ਬੋਟ';

  @override
  String get seatModePaused => 'ਰੋਕਿਆ ਹੋਇਆ';

  @override
  String reactionFixed(String duration) {
    return 'ਪ੍ਰਤੀਕਿਰਿਆ $duration';
  }

  @override
  String get reactionRandom => 'ਬੇਤਰਤੀਬ ਪ੍ਰਤੀਕਿਰਿਆ';

  @override
  String get botIqSmart => 'ਸਿਆਣਪ ਨਾਲ ਖੇਡਦਾ ਹੈ';

  @override
  String get botIqFirstValid => 'ਪਹਿਲਾ ਜਾਇਜ਼ ਪੱਤਾ';

  @override
  String get botIqSloppy => '20% ਗਲਤੀ ਕਰਦਾ ਹੈ';

  @override
  String get colorRed => 'ਲਾਲ';

  @override
  String get colorGreen => 'ਹਰਾ';

  @override
  String get colorBlue => 'ਨੀਲਾ';

  @override
  String get colorYellow => 'ਪੀਲਾ';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'ਬੁਨਿਆਦੀ';

  @override
  String get cardBomb => 'ਬੰਬ';

  @override
  String get cardDefuse => 'ਨਕਾਰਾ ਕਰੋ';

  @override
  String get cardDetonate => 'ਧਮਾਕਾ';

  @override
  String get cardNope => 'ਨਹੀਂ!';

  @override
  String get cardShield => 'ਢਾਲ';

  @override
  String get cardSteal => 'ਚੋਰੀ';

  @override
  String get cardTwist => 'ਪਲਟੋ';

  @override
  String get cardBlind => 'ਅੰਨ੍ਹਾ';

  @override
  String get rejectNotYourTurn => 'ਤੁਹਾਡੀ ਵਾਰੀ ਨਹੀਂ ਹੈ';

  @override
  String get rejectCardNotInHand => 'ਇਹ ਪੱਤਾ ਹੁਣ ਤੁਹਾਡੇ ਕੋਲ ਨਹੀਂ ਹੈ';

  @override
  String get rejectInvalidTarget => 'ਇਸ ਖਿਡਾਰੀ ਨੂੰ ਨਿਸ਼ਾਨਾ ਨਹੀਂ ਬਣਾਇਆ ਜਾ ਸਕਦਾ';

  @override
  String get rejectNotAReaction => 'ਇਹ ਪੱਤਾ ਡੈੱਕ ’ਤੇ ਸੁੱਟਿਆ ਜਾਂਦਾ ਹੈ';

  @override
  String get rejectGhost => 'ਭੂਤ ਸਿਰਫ਼ ਨਹੀਂ! ਖੇਡ ਸਕਦਾ ਹੈ';

  @override
  String get rejectNotGhost => 'ਪੱਤੇ ਤੋਂ ਬਿਨਾਂ ਨਹੀਂ! ਸਿਰਫ਼ ਭੂਤ ਕੋਲ ਹੈ';

  @override
  String get rejectGhostNopeUsed =>
      'ਭੂਤ ਦਾ ਨਹੀਂ! ਇਸ ਗੇੜ ਵਿੱਚ ਵਰਤਿਆ ਜਾ ਚੁੱਕਾ ਹੈ';

  @override
  String get rejectGhostNeedsCard => 'ਭੂਤ ਨੂੰ ਨਹੀਂ! ਦਾ ਪੱਤਾ ਚਾਹੀਦਾ ਹੈ';

  @override
  String get rejectNothingToNope => 'ਰੱਦ ਕਰਨ ਲਈ ਕੁਝ ਨਹੀਂ';

  @override
  String get rejectNoPendingLoss => 'ਢਾਲ ਲਈ ਹੁਣ ਦੇਰ ਹੋ ਚੁੱਕੀ ਹੈ';

  @override
  String get rejectOwnTurn => 'ਆਪਣੀ ਹੀ ਵਾਰੀ ਚੋਰੀ ਨਹੀਂ ਕੀਤੀ ਜਾ ਸਕਦੀ';

  @override
  String rejectTooEarly(String duration) {
    return 'ਚੋਰੀ ਸਿਰਫ਼ $duration ਦੀ ਝਿਜਕ ਮਗਰੋਂ ਹੋ ਸਕਦੀ ਹੈ';
  }

  @override
  String get rejectGameOver => 'ਖੇਡ ਖ਼ਤਮ ਹੋ ਗਈ';

  @override
  String get rejectOther => 'ਹੁਕਮ ਰੱਦ ਕੀਤਾ ਗਿਆ';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $duration ਵਿੱਚ';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $duration ਵਿੱਚ, $count ਚੁੱਕਦਾ ਹੈ';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card ਜਾਇਜ਼ ਨਹੀਂ';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: ਸਮਾਂ ਖ਼ਤਮ';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: ਵਾਰੀ ਦੀ ਚੋਰੀ ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card ’ਤੇ ਨਹੀਂ!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: ਨਹੀਂ! ਅਸਫਲ';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'ਬੰਬ ਉੱਭਰ ਆਇਆ, ਫ਼ਿਊਜ਼ $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'ਬੰਬ ਫਟ ਗਿਆ: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: ਨਕਾਰਾ ਕਰੋ';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target ’ਤੇ ਧਮਾਕਾ';
  }

  @override
  String captionShield(String player) {
    return '$player: ਢਾਲ';
  }

  @override
  String captionGhost(String player) {
    return '$player ਭੂਤ ਹੈ';
  }

  @override
  String get hintDetonate => 'ਧਮਾਕਾ ਨੂੰ ਉਸ ਖਿਡਾਰੀ ’ਤੇ ਖਿੱਚੋ ਜਿਸ ਨੂੰ ਬੰਬ ਮਿਲੇਗਾ';

  @override
  String get hintSteal => 'ਚੋਰੀ ਨੂੰ ਉਸ ਖਿਡਾਰੀ ’ਤੇ ਖਿੱਚੋ ਜਿਸ ਦੀ ਵਾਰੀ ਹੈ';

  @override
  String toastInvalidCard(int count) {
    return 'ਨਾਜਾਇਜ਼ ਪੱਤਾ: ਇੱਕ ਜਾਨ ਜਾਂਦੀ ਹੈ ਅਤੇ $count ਚੁੱਕਣੇ ਪੈਂਦੇ ਹਨ';
  }

  @override
  String get toastTimeOut => 'ਸਮਾਂ ਖ਼ਤਮ';

  @override
  String toastShieldWindow(String duration) {
    return '$duration ਦੇ ਅੰਦਰ ਢਾਲ!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: ਨੇ ਤੁਹਾਡੀ ਵਾਰੀ ਚੋਰੀ ਕਰ ਲਈ';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ਨੇ ਤੁਹਾਡੇ ਵੱਲ ਬੰਬ ਭੇਜ ਦਿੱਤਾ';
  }

  @override
  String get toastNopeReturns => 'ਨਹੀਂ! ਵਾਰੀ ਤੁਹਾਨੂੰ ਮੋੜ ਦਿੰਦਾ ਹੈ';

  @override
  String get yourTurn => 'ਤੁਹਾਡੀ ਵਾਰੀ';

  @override
  String onTurn(String player) {
    return 'ਵਾਰੀ: $player';
  }

  @override
  String deckCount(int count) {
    return 'ਡੈੱਕ $count';
  }

  @override
  String ghostName(String name) {
    return '$name (ਭੂਤ)';
  }

  @override
  String get ghostNope => 'ਭੂਤ ਦਾ ਨਹੀਂ!';

  @override
  String get startHelp =>
      'ਡੈੱਕ ਦੇ ਉੱਪਰਲੀ ਲਕੀਰ ਪਾਰ ਕਰਕੇ ਉਸੇ ਰੰਗ ਜਾਂ ਨੰਬਰ ਦਾ ਪੱਤਾ ਸੁੱਟੋ। ਨਹੀਂ! ਅਤੇ ਢਾਲ ਨੂੰ ਪਾਸੇ ਵੱਲ ਸਵਾਈਪ ਕਰੋ, ਧਮਾਕਾ ਅਤੇ ਚੋਰੀ ਨੂੰ ਖਿਡਾਰੀ ’ਤੇ ਖਿੱਚੋ।';

  @override
  String get start => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get youWin => 'ਤੁਸੀਂ ਜਿੱਤ ਗਏ';

  @override
  String get nobodySurvived => 'ਕੋਈ ਨਹੀਂ ਬਚਿਆ';

  @override
  String playerWins(String player) {
    return '$player ਜਿੱਤ ਗਿਆ';
  }

  @override
  String get playAgain => 'ਦੁਬਾਰਾ ਖੇਡੋ';

  @override
  String get copyReplay => 'ਰੀਪਲੇ ਕਾਪੀ ਕਰੋ';

  @override
  String get gameSettings => 'ਖੇਡ ਦੀਆਂ ਸੈਟਿੰਗਾਂ';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'ਬੰਬ, $fuse ਚਾਲਾਂ ਬਾਕੀ',
      one: 'ਬੰਬ, $fuse ਚਾਲ ਬਾਕੀ',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get pause => 'ਰੋਕੋ';

  @override
  String get debug => 'ਡੀਬੱਗ';

  @override
  String get sectionTime => 'ਸਮਾਂ';

  @override
  String get step => 'ਕਦਮ';

  @override
  String gameClock(String duration, int round) {
    return 'ਖੇਡ ਦਾ ਸਮਾਂ $duration, ਗੇੜ $round';
  }

  @override
  String get artificialLatency => 'ਬਣਾਉਟੀ ਦੇਰੀ';

  @override
  String get followTurn => 'ਦ੍ਰਿਸ਼ ਵਾਰੀ ਵਾਲੇ ਖਿਡਾਰੀ ਦਾ ਪਿੱਛਾ ਕਰਦਾ ਹੈ';

  @override
  String get followTurnHint => 'ਸਿਰਫ਼ ਇਨਸਾਨ ਦੁਆਰਾ ਕੰਟਰੋਲ ਕੀਤੀਆਂ ਸੀਟਾਂ';

  @override
  String get sectionForceCard => 'ਪੱਤਾ ਥੋਪੋ';

  @override
  String get number => 'ਨੰਬਰ';

  @override
  String get giveToHand => 'ਹੱਥ ਵਿੱਚ ਦਿਓ';

  @override
  String get setAsTarget => 'ਨਿਸ਼ਾਨੇ ਵਜੋਂ ਸੈੱਟ ਕਰੋ';

  @override
  String get sectionBombAndLimit => 'ਬੰਬ ਅਤੇ ਚਾਲ ਦੀ ਹੱਦ';

  @override
  String get noBomb => 'ਬਿਨਾਂ ਬੰਬ';

  @override
  String fuseValue(int fuse) {
    return 'ਫ਼ਿਊਜ਼ $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'ਪਹਿਲੇ ਗੇੜ ਦੀ ਹੱਦ (ਹੁਣ $duration)';
  }

  @override
  String get loadFromClipboard => 'ਕਲਿੱਪਬੋਰਡ ਤੋਂ ਲੋਡ ਕਰੋ';

  @override
  String get sectionEvents => 'ਘਟਨਾਵਾਂ';

  @override
  String get endGame => 'ਖੇਡ ਖ਼ਤਮ ਕਰੋ';

  @override
  String get removeLife => 'ਜਾਨ ਘਟਾਓ';

  @override
  String get addLife => 'ਜਾਨ ਵਧਾਓ';
}
