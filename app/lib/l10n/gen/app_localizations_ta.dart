// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get tagline => 'திரி எரிந்து முடியும் முன் சரியான அட்டையை வீசுங்கள்.';

  @override
  String get sectionPlayers => 'ஆட்டக்காரர்கள்';

  @override
  String get sectionRules => 'விதிகள்';

  @override
  String get sectionScenarios => 'சூழல்கள்';

  @override
  String get ruleTurnLimit => '1வது சுற்றில் நகர்வு வரம்பு';

  @override
  String get ruleFastThrow => 'எடுக்காமல் வேகமான வீச்சு, வரம்பு';

  @override
  String get ruleSteal => 'இதைவிட நீண்ட தயக்கத்திற்குப் பின் திருட்டு';

  @override
  String get gameSpeed => 'ஆட்ட வேகம்';

  @override
  String get play => 'விளையாடு';

  @override
  String get loadReplayFromClipboard => 'கிளிப்போர்டிலிருந்து ரீப்ளேயை ஏற்று';

  @override
  String get noReplayInClipboard => 'கிளிப்போர்டில் Kittens ரீப்ளே இல்லை';

  @override
  String get replayCopied => 'ரீப்ளே கிளிப்போர்டில் உள்ளது';

  @override
  String get replayTitle => 'ரீப்ளே';

  @override
  String get seatYou => 'நீங்கள்';

  @override
  String botName(int number) {
    return 'பாட் $number';
  }

  @override
  String get seatModeHuman => 'மனிதர்';

  @override
  String get seatModeBot => 'பாட்';

  @override
  String get seatModePaused => 'இடைநிறுத்தம்';

  @override
  String reactionFixed(String duration) {
    return 'எதிர்வினை $duration';
  }

  @override
  String get reactionRandom => 'சீரற்ற எதிர்வினை';

  @override
  String get botIqSmart => 'புத்திசாலித்தனமாக விளையாடும்';

  @override
  String get botIqFirstValid => 'முதல் செல்லுபடியானது';

  @override
  String get botIqSloppy => '20% தவறு செய்யும்';

  @override
  String get colorRed => 'சிவப்பு';

  @override
  String get colorGreen => 'பச்சை';

  @override
  String get colorBlue => 'நீலம்';

  @override
  String get colorYellow => 'மஞ்சள்';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'அடிப்படை';

  @override
  String get cardBomb => 'வெடிகுண்டு';

  @override
  String get cardDefuse => 'செயலிழக்கச் செய்';

  @override
  String get cardDetonate => 'வெடிக்கச் செய்';

  @override
  String get cardNope => 'இல்லை!';

  @override
  String get cardShield => 'கேடயம்';

  @override
  String get cardSteal => 'திருட்டு';

  @override
  String get cardTwist => 'திருப்பு';

  @override
  String get cardBlind => 'குருட்டு';

  @override
  String get rejectNotYourTurn => 'இது உங்கள் முறை இல்லை';

  @override
  String get rejectCardNotInHand => 'இந்த அட்டை இனி உங்களிடம் இல்லை';

  @override
  String get rejectInvalidTarget => 'இந்த ஆட்டக்காரரை இலக்காக்க முடியாது';

  @override
  String get rejectNotAReaction => 'இந்த அட்டை அடுக்கின் மீது வீசப்படும்';

  @override
  String get rejectGhost => 'பேய் இல்லை! மட்டுமே ஆட முடியும்';

  @override
  String get rejectNotGhost => 'அட்டை இல்லாத இல்லை! பேய்க்கு மட்டுமே உண்டு';

  @override
  String get rejectGhostNopeUsed =>
      'பேயின் இல்லை! இந்தச் சுற்றில் ஏற்கனவே பயன்படுத்தப்பட்டது';

  @override
  String get rejectGhostNeedsCard => 'பேய்க்கு இல்லை! அட்டை தேவை';

  @override
  String get rejectNothingToNope => 'ரத்து செய்ய எதுவும் இல்லை';

  @override
  String get rejectNoPendingLoss => 'கேடயத்திற்கு இனி தாமதமாகிவிட்டது';

  @override
  String get rejectOwnTurn => 'சொந்த முறையைத் திருட முடியாது';

  @override
  String rejectTooEarly(String duration) {
    return '$duration தயக்கத்திற்குப் பின்தான் திருட முடியும்';
  }

  @override
  String get rejectGameOver => 'ஆட்டம் முடிந்தது';

  @override
  String get rejectOther => 'கட்டளை நிராகரிக்கப்பட்டது';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $durationல்';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $durationல், $count எடுக்கிறார்';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card செல்லாது';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: நேரம் முடிந்தது';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: முறை திருட்டு ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card மீது இல்லை!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: இல்லை! பலிக்கவில்லை';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'வெடிகுண்டு மேலெழுந்தது, திரி $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'வெடிகுண்டு வெடித்தது: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: செயலிழக்கச் செய்';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target மீது வெடிக்கச் செய்';
  }

  @override
  String captionShield(String player) {
    return '$player: கேடயம்';
  }

  @override
  String captionGhost(String player) {
    return '$player பேய் ஆனார்';
  }

  @override
  String get hintDetonate =>
      'வெடிக்கச் செய் என்பதை வெடிகுண்டு பெறும் ஆட்டக்காரர் மீது இழுக்கவும்';

  @override
  String get hintSteal =>
      'திருட்டு என்பதை முறை உள்ள ஆட்டக்காரர் மீது இழுக்கவும்';

  @override
  String toastInvalidCard(int count) {
    return 'செல்லாத அட்டை: ஓர் உயிரை இழந்து $count எடுக்கிறீர்கள்';
  }

  @override
  String get toastTimeOut => 'நேரம் முடிந்தது';

  @override
  String toastShieldWindow(String duration) {
    return '$durationக்குள் கேடயம்!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: உங்கள் முறையைத் திருடினார்';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player உங்கள் மீது வெடிகுண்டை அனுப்பினார்';
  }

  @override
  String get toastNopeReturns => 'இல்லை! முறையை உங்களிடமே திருப்புகிறது';

  @override
  String get yourTurn => 'உங்கள் முறை';

  @override
  String onTurn(String player) {
    return 'முறை: $player';
  }

  @override
  String deckCount(int count) {
    return 'அடுக்கு $count';
  }

  @override
  String ghostName(String name) {
    return '$name (பேய்)';
  }

  @override
  String get ghostNope => 'பேயின் இல்லை!';

  @override
  String get startHelp =>
      'அடுக்கின் மேலுள்ள கோட்டைத் தாண்டி அதே நிறம் அல்லது எண் கொண்ட அட்டையை வீசுங்கள். இல்லை!, கேடயம் ஆகியவற்றை பக்கவாட்டில் இழுக்கவும்; வெடிக்கச் செய், திருட்டு ஆகியவற்றை ஆட்டக்காரர் மீது இழுக்கவும்.';

  @override
  String get start => 'தொடங்கு';

  @override
  String get youWin => 'நீங்கள் வென்றீர்கள்';

  @override
  String get nobodySurvived => 'யாரும் தப்பவில்லை';

  @override
  String playerWins(String player) {
    return '$player வென்றார்';
  }

  @override
  String get playAgain => 'மீண்டும் விளையாடு';

  @override
  String get copyReplay => 'ரீப்ளேயை நகலெடு';

  @override
  String get gameSettings => 'ஆட்ட அமைப்புகள்';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'வெடிகுண்டு, $fuse நகர்வுகள் மீதம்',
      one: 'வெடிகுண்டு, $fuse நகர்வு மீதம்',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'தொடர்';

  @override
  String get pause => 'இடைநிறுத்து';

  @override
  String get debug => 'பிழைத்திருத்தம்';

  @override
  String get sectionTime => 'நேரம்';

  @override
  String get step => 'படி';

  @override
  String gameClock(String duration, int round) {
    return 'ஆட்ட நேரம் $duration, சுற்று $round';
  }

  @override
  String get artificialLatency => 'செயற்கைத் தாமதம்';

  @override
  String get followTurn => 'பார்வை முறை உள்ள ஆட்டக்காரரைப் பின்தொடர்கிறது';

  @override
  String get followTurnHint => 'மனிதர்கள் கட்டுப்படுத்தும் இருக்கைகள் மட்டும்';

  @override
  String get sectionForceCard => 'அட்டையைத் திணி';

  @override
  String get number => 'எண்';

  @override
  String get giveToHand => 'கையில் கொடு';

  @override
  String get setAsTarget => 'இலக்காக அமை';

  @override
  String get sectionBombAndLimit => 'வெடிகுண்டும் நகர்வு வரம்பும்';

  @override
  String get noBomb => 'வெடிகுண்டு இல்லை';

  @override
  String fuseValue(int fuse) {
    return 'திரி $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '1வது சுற்று வரம்பு (இப்போது $duration)';
  }

  @override
  String get loadFromClipboard => 'கிளிப்போர்டிலிருந்து ஏற்று';

  @override
  String get sectionEvents => 'நிகழ்வுகள்';

  @override
  String get endGame => 'ஆட்டத்தை முடி';

  @override
  String get removeLife => 'உயிரைக் குறை';

  @override
  String get addLife => 'உயிரைக் கூட்டு';
}
