// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get tagline => 'वात जळून संपण्यापूर्वी योग्य पत्ता फेका.';

  @override
  String get sectionPlayers => 'खेळाडू';

  @override
  String get sectionRules => 'नियम';

  @override
  String get sectionScenarios => 'परिस्थिती';

  @override
  String get ruleTurnLimit => 'पहिल्या फेरीत चालीची मर्यादा';

  @override
  String get ruleFastThrow => 'न उचलता जलद फेक, कमाल';

  @override
  String get ruleSteal => 'यापेक्षा जास्त संकोचानंतर चोरी';

  @override
  String get gameSpeed => 'खेळाची गती';

  @override
  String get play => 'खेळा';

  @override
  String get loadReplayFromClipboard => 'क्लिपबोर्डवरून रिप्ले लोड करा';

  @override
  String get noReplayInClipboard => 'क्लिपबोर्डमध्ये Kittens रिप्ले नाही';

  @override
  String get replayCopied => 'रिप्ले क्लिपबोर्डमध्ये आहे';

  @override
  String get replayTitle => 'रिप्ले';

  @override
  String get seatYou => 'तुम्ही';

  @override
  String botName(int number) {
    return 'बॉट $number';
  }

  @override
  String get seatModeHuman => 'माणूस';

  @override
  String get seatModeBot => 'बॉट';

  @override
  String get seatModePaused => 'थांबवले';

  @override
  String reactionFixed(String duration) {
    return 'प्रतिक्रिया $duration';
  }

  @override
  String get reactionRandom => 'यादृच्छिक प्रतिक्रिया';

  @override
  String get botIqSmart => 'हुशारीने खेळतो';

  @override
  String get botIqFirstValid => 'पहिला वैध पत्ता';

  @override
  String get botIqSloppy => '20% चुका करतो';

  @override
  String get colorRed => 'लाल';

  @override
  String get colorGreen => 'हिरवा';

  @override
  String get colorBlue => 'निळा';

  @override
  String get colorYellow => 'पिवळा';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'मूलभूत';

  @override
  String get cardBomb => 'बॉम्ब';

  @override
  String get cardDefuse => 'निकामी करा';

  @override
  String get cardDetonate => 'स्फोट';

  @override
  String get cardNope => 'नाही!';

  @override
  String get cardShield => 'ढाल';

  @override
  String get cardSteal => 'चोरी';

  @override
  String get cardTwist => 'उलटवा';

  @override
  String get cardBlind => 'आंधळा';

  @override
  String get rejectNotYourTurn => 'तुमची पाळी नाही';

  @override
  String get rejectCardNotInHand => 'हा पत्ता आता तुमच्याकडे नाही';

  @override
  String get rejectInvalidTarget => 'या खेळाडूला लक्ष्य करता येत नाही';

  @override
  String get rejectNotAReaction => 'हा पत्ता डेकवर फेकला जातो';

  @override
  String get rejectGhost => 'भूत फक्त नाही! खेळू शकते';

  @override
  String get rejectNotGhost => 'पत्त्याशिवाय नाही! फक्त भुताकडे आहे';

  @override
  String get rejectGhostNopeUsed => 'भुताचे नाही! या फेरीत वापरून झाले आहे';

  @override
  String get rejectGhostNeedsCard => 'भुताला नाही! पत्ता हवा';

  @override
  String get rejectNothingToNope => 'रद्द करण्यासारखे काही नाही';

  @override
  String get rejectNoPendingLoss => 'ढालीसाठी आता उशीर झाला';

  @override
  String get rejectOwnTurn => 'स्वतःची पाळी चोरता येत नाही';

  @override
  String rejectTooEarly(String duration) {
    return '$duration संकोचानंतरच चोरी करता येते';
  }

  @override
  String get rejectGameOver => 'खेळ संपला';

  @override
  String get rejectOther => 'आदेश नाकारला';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $durationमध्ये';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $durationमध्ये, $count उचलतो';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card वैध नाही';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: वेळ संपली';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: पाळीची चोरी ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card वर नाही!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: नाही! अयशस्वी';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'बॉम्ब वर आला, वात $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'बॉम्ब फुटला: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: निकामी करा';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target वर स्फोट';
  }

  @override
  String captionShield(String player) {
    return '$player: ढाल';
  }

  @override
  String captionGhost(String player) {
    return '$player भूत आहे';
  }

  @override
  String get hintDetonate => 'स्फोट हा बॉम्ब मिळणाऱ्या खेळाडूवर ओढा';

  @override
  String get hintSteal => 'चोरी ही ज्याची पाळी आहे त्या खेळाडूवर ओढा';

  @override
  String toastInvalidCard(int count) {
    return 'अवैध पत्ता: एक जीव जातो आणि $count उचलावे लागतात';
  }

  @override
  String get toastTimeOut => 'वेळ संपली';

  @override
  String toastShieldWindow(String duration) {
    return '$durationमध्ये ढाल!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: ने तुमची पाळी चोरली';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ने तुमच्यावर बॉम्ब पाठवला';
  }

  @override
  String get toastNopeReturns => 'नाही! पाळी तुम्हाला परत देते';

  @override
  String get yourTurn => 'तुमची पाळी';

  @override
  String onTurn(String player) {
    return 'पाळी: $player';
  }

  @override
  String deckCount(int count) {
    return 'डेक $count';
  }

  @override
  String ghostName(String name) {
    return '$name (भूत)';
  }

  @override
  String get ghostNope => 'भुताचे नाही!';

  @override
  String get startHelp =>
      'डेकवरील रेषा ओलांडून त्याच रंगाचा किंवा क्रमांकाचा पत्ता फेका. नाही! आणि ढाल बाजूला सरकवा, स्फोट आणि चोरी खेळाडूवर ओढा.';

  @override
  String get start => 'सुरू करा';

  @override
  String get youWin => 'तुम्ही जिंकलात';

  @override
  String get nobodySurvived => 'कोणीही वाचले नाही';

  @override
  String playerWins(String player) {
    return '$player जिंकला';
  }

  @override
  String get playAgain => 'पुन्हा खेळा';

  @override
  String get copyReplay => 'रिप्ले कॉपी करा';

  @override
  String get gameSettings => 'खेळ सेटिंग्ज';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'बॉम्ब, $fuse चाली शिल्लक',
      one: 'बॉम्ब, $fuse चाल शिल्लक',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'पुन्हा सुरू करा';

  @override
  String get pause => 'थांबवा';

  @override
  String get debug => 'डीबग';

  @override
  String get sectionTime => 'वेळ';

  @override
  String get step => 'पायरी';

  @override
  String gameClock(String duration, int round) {
    return 'खेळाची वेळ $duration, फेरी $round';
  }

  @override
  String get artificialLatency => 'कृत्रिम विलंब';

  @override
  String get followTurn => 'दृश्य पाळी असलेल्या खेळाडूचा पाठलाग करते';

  @override
  String get followTurnHint => 'फक्त माणसाने नियंत्रित केलेली जागा';

  @override
  String get sectionForceCard => 'पत्ता लादा';

  @override
  String get number => 'क्रमांक';

  @override
  String get giveToHand => 'हातात द्या';

  @override
  String get setAsTarget => 'लक्ष्य म्हणून सेट करा';

  @override
  String get sectionBombAndLimit => 'बॉम्ब आणि चालीची मर्यादा';

  @override
  String get noBomb => 'बॉम्बशिवाय';

  @override
  String fuseValue(int fuse) {
    return 'वात $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'पहिल्या फेरीची मर्यादा (आता $duration)';
  }

  @override
  String get loadFromClipboard => 'क्लिपबोर्डवरून लोड करा';

  @override
  String get sectionEvents => 'घटना';

  @override
  String get endGame => 'खेळ संपवा';

  @override
  String get removeLife => 'जीव कमी करा';

  @override
  String get addLife => 'जीव वाढवा';
}
