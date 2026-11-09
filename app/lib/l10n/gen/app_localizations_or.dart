// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get tagline => 'ପଳିତା ଜଳିଯିବା ଆଗରୁ ଠିକ୍ କାର୍ଡ ଫିଙ୍ଗନ୍ତୁ।';

  @override
  String get sectionPlayers => 'ଖେଳାଳି';

  @override
  String get sectionRules => 'ନିୟମ';

  @override
  String get sectionScenarios => 'ପରିସ୍ଥିତି';

  @override
  String get ruleTurnLimit => 'ପ୍ରଥମ ରାଉଣ୍ଡରେ ଚାଲିର ସୀମା';

  @override
  String get ruleFastThrow => 'ନଉଠାଇ ଶୀଘ୍ର ଫିଙ୍ଗା, ସୀମା';

  @override
  String get ruleSteal => 'ଏହାଠାରୁ ଅଧିକ ଦ୍ୱିଧା ପରେ ଚୋରି';

  @override
  String get gameSpeed => 'ଖେଳର ଗତି';

  @override
  String get play => 'ଖେଳନ୍ତୁ';

  @override
  String get loadReplayFromClipboard => 'କ୍ଲିପ୍‌ବୋର୍ଡରୁ ରିପ୍ଲେ ଲୋଡ୍ କରନ୍ତୁ';

  @override
  String get noReplayInClipboard => 'କ୍ଲିପ୍‌ବୋର୍ଡରେ Kittens ରିପ୍ଲେ ନାହିଁ';

  @override
  String get replayCopied => 'ରିପ୍ଲେ କ୍ଲିପ୍‌ବୋର୍ଡରେ ଅଛି';

  @override
  String get replayTitle => 'ରିପ୍ଲେ';

  @override
  String get seatYou => 'ଆପଣ';

  @override
  String botName(int number) {
    return 'ବଟ୍ $number';
  }

  @override
  String get seatModeHuman => 'ମଣିଷ';

  @override
  String get seatModeBot => 'ବଟ୍';

  @override
  String get seatModePaused => 'ବିରାମ';

  @override
  String reactionFixed(String duration) {
    return 'ପ୍ରତିକ୍ରିୟା $duration';
  }

  @override
  String get reactionRandom => 'ଅନିୟମିତ ପ୍ରତିକ୍ରିୟା';

  @override
  String get botIqSmart => 'ବୁଦ୍ଧିମାନ ଭାବେ ଖେଳେ';

  @override
  String get botIqFirstValid => 'ପ୍ରଥମ ବୈଧ କାର୍ଡ';

  @override
  String get botIqSloppy => '20% ଭୁଲ କରେ';

  @override
  String get colorRed => 'ନାଲି';

  @override
  String get colorGreen => 'ସବୁଜ';

  @override
  String get colorBlue => 'ନୀଳ';

  @override
  String get colorYellow => 'ହଳଦିଆ';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'ମୌଳିକ';

  @override
  String get cardBomb => 'ବମ୍';

  @override
  String get cardDefuse => 'ନିଷ୍କ୍ରିୟ କରନ୍ତୁ';

  @override
  String get cardDetonate => 'ବିସ୍ଫୋରଣ';

  @override
  String get cardNope => 'ନା!';

  @override
  String get cardShield => 'ଢାଲ';

  @override
  String get cardSteal => 'ଚୋରି';

  @override
  String get cardTwist => 'ଓଲଟାନ୍ତୁ';

  @override
  String get cardBlind => 'ଅନ୍ଧ';

  @override
  String get rejectNotYourTurn => 'ଏହା ଆପଣଙ୍କ ପାଳି ନୁହେଁ';

  @override
  String get rejectCardNotInHand => 'ଏହି କାର୍ଡ ଆଉ ଆପଣଙ୍କ ପାଖରେ ନାହିଁ';

  @override
  String get rejectInvalidTarget => 'ଏହି ଖେଳାଳିଙ୍କୁ ଲକ୍ଷ୍ୟ କରାଯାଇପାରିବ ନାହିଁ';

  @override
  String get rejectNotAReaction => 'ଏହି କାର୍ଡ ଡେକ୍ ଉପରେ ଫିଙ୍ଗାଯାଏ';

  @override
  String get rejectGhost => 'ଭୂତ କେବଳ ନା! ଖେଳିପାରିବ';

  @override
  String get rejectNotGhost => 'କାର୍ଡ ବିନା ନା! କେବଳ ଭୂତ ପାଖରେ ଅଛି';

  @override
  String get rejectGhostNopeUsed => 'ଭୂତର ନା! ଏହି ରାଉଣ୍ଡରେ ବ୍ୟବହୃତ ହୋଇସାରିଛି';

  @override
  String get rejectGhostNeedsCard => 'ଭୂତକୁ ନା! କାର୍ଡ ଦରକାର';

  @override
  String get rejectNothingToNope => 'ବାତିଲ୍ କରିବାକୁ କିଛି ନାହିଁ';

  @override
  String get rejectNoPendingLoss => 'ଢାଲ ପାଇଁ ଏବେ ବହୁତ ବିଳମ୍ବ';

  @override
  String get rejectOwnTurn => 'ନିଜ ପାଳି ଚୋରି କରିହେବ ନାହିଁ';

  @override
  String rejectTooEarly(String duration) {
    return '$duration ଦ୍ୱିଧା ପରେ ହିଁ ଚୋରି ସମ୍ଭବ';
  }

  @override
  String get rejectGameOver => 'ଖେଳ ଶେଷ';

  @override
  String get rejectOther => 'ନିର୍ଦ୍ଦେଶ ଅସ୍ୱୀକୃତ';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $durationରେ';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $durationରେ, $count ଉଠାଏ';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card ବୈଧ ନୁହେଁ';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: ସମୟ ଶେଷ';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: ପାଳି ଚୋରି ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card ଉପରେ ନା!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: ନା! ବିଫଳ';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'ବମ୍ ଭାସି ଉଠିଲା, ପଳିତା $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'ବମ୍ ଫାଟିଲା: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: ନିଷ୍କ୍ରିୟ କରନ୍ତୁ';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target ଉପରେ ବିସ୍ଫୋରଣ';
  }

  @override
  String captionShield(String player) {
    return '$player: ଢାଲ';
  }

  @override
  String captionGhost(String player) {
    return '$player ଭୂତ ହେଲା';
  }

  @override
  String get hintDetonate =>
      'ବିସ୍ଫୋରଣକୁ ଯେଉଁ ଖେଳାଳି ବମ୍ ପାଇବ ତାହା ଉପରକୁ ଟାଣନ୍ତୁ';

  @override
  String get hintSteal => 'ଚୋରିକୁ ଯାହାର ପାଳି ତାହା ଉପରକୁ ଟାଣନ୍ତୁ';

  @override
  String toastInvalidCard(int count) {
    return 'ଅବୈଧ କାର୍ଡ: ଏକ ଜୀବନ ଯାଏ ଏବଂ $count ଉଠାନ୍ତି';
  }

  @override
  String get toastTimeOut => 'ସମୟ ଶେଷ';

  @override
  String toastShieldWindow(String duration) {
    return '$duration ଭିତରେ ଢାଲ!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: ଆପଣଙ୍କ ପାଳି ଚୋରି କଲା';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ଆପଣଙ୍କ ଉପରକୁ ବମ୍ ପଠାଇଲା';
  }

  @override
  String get toastNopeReturns => 'ନା! ପାଳି ଆପଣଙ୍କୁ ଫେରାଏ';

  @override
  String get yourTurn => 'ଆପଣଙ୍କ ପାଳି';

  @override
  String onTurn(String player) {
    return 'ପାଳି: $player';
  }

  @override
  String deckCount(int count) {
    return 'ଡେକ୍ $count';
  }

  @override
  String ghostName(String name) {
    return '$name (ଭୂତ)';
  }

  @override
  String get ghostNope => 'ଭୂତର ନା!';

  @override
  String get startHelp =>
      'ଡେକ୍ ଉପରର ରେଖା ପାର କରି ସମାନ ରଙ୍ଗ କିମ୍ବା ସଂଖ୍ୟାର କାର୍ଡ ଫିଙ୍ଗନ୍ତୁ। ନା! ଓ ଢାଲକୁ ପାର୍ଶ୍ୱକୁ ସ୍ୱାଇପ୍ କରନ୍ତୁ, ବିସ୍ଫୋରଣ ଓ ଚୋରିକୁ ଖେଳାଳି ଉପରକୁ ଟାଣନ୍ତୁ।';

  @override
  String get start => 'ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get youWin => 'ଆପଣ ଜିତିଲେ';

  @override
  String get nobodySurvived => 'କେହି ବଞ୍ଚିଲେ ନାହିଁ';

  @override
  String playerWins(String player) {
    return '$player ଜିତିଲା';
  }

  @override
  String get playAgain => 'ପୁଣି ଖେଳନ୍ତୁ';

  @override
  String get copyReplay => 'ରିପ୍ଲେ କପି କରନ୍ତୁ';

  @override
  String get gameSettings => 'ଖେଳ ସେଟିଂସ୍';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'ବମ୍, $fuseଟି ଚାଲି ବାକି',
      one: 'ବମ୍, $fuseଟି ଚାଲି ବାକି',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'ଜାରି ରଖନ୍ତୁ';

  @override
  String get pause => 'ବିରାମ';

  @override
  String get debug => 'ଡିବଗ୍';

  @override
  String get sectionTime => 'ସମୟ';

  @override
  String get step => 'ପଦକ୍ଷେପ';

  @override
  String gameClock(String duration, int round) {
    return 'ଖେଳ ସମୟ $duration, ରାଉଣ୍ଡ $round';
  }

  @override
  String get artificialLatency => 'କୃତ୍ରିମ ବିଳମ୍ବ';

  @override
  String get followTurn => 'ଦୃଶ୍ୟ ପାଳିର ଖେଳାଳିଙ୍କୁ ଅନୁସରଣ କରେ';

  @override
  String get followTurnHint => 'କେବଳ ମଣିଷ ନିୟନ୍ତ୍ରିତ ଆସନ';

  @override
  String get sectionForceCard => 'କାର୍ଡ ଲଦନ୍ତୁ';

  @override
  String get number => 'ସଂଖ୍ୟା';

  @override
  String get giveToHand => 'ହାତକୁ ଦିଅନ୍ତୁ';

  @override
  String get setAsTarget => 'ଲକ୍ଷ୍ୟ ଭାବେ ସେଟ୍ କରନ୍ତୁ';

  @override
  String get sectionBombAndLimit => 'ବମ୍ ଓ ଚାଲିର ସୀମା';

  @override
  String get noBomb => 'ବମ୍ ନାହିଁ';

  @override
  String fuseValue(int fuse) {
    return 'ପଳିତା $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'ପ୍ରଥମ ରାଉଣ୍ଡର ସୀମା (ଏବେ $duration)';
  }

  @override
  String get loadFromClipboard => 'କ୍ଲିପ୍‌ବୋର୍ଡରୁ ଲୋଡ୍ କରନ୍ତୁ';

  @override
  String get sectionEvents => 'ଘଟଣା';

  @override
  String get endGame => 'ଖେଳ ଶେଷ କରନ୍ତୁ';

  @override
  String get removeLife => 'ଜୀବନ କମାନ୍ତୁ';

  @override
  String get addLife => 'ଜୀବନ ବଢ଼ାନ୍ତୁ';
}
