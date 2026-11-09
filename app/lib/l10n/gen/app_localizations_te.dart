// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get tagline => 'ఫ్యూజ్ కాలిపోయేలోపు సరైన కార్డ్ విసరండి.';

  @override
  String get sectionPlayers => 'ఆటగాళ్లు';

  @override
  String get sectionRules => 'నియమాలు';

  @override
  String get sectionScenarios => 'సన్నివేశాలు';

  @override
  String get ruleTurnLimit => '1వ రౌండ్‌లో ఎత్తు పరిమితి';

  @override
  String get ruleFastThrow => 'తీసుకోకుండా వేగంగా విసరడం, పరిమితి';

  @override
  String get ruleSteal => 'దీనికంటే ఎక్కువ సంకోచం తర్వాత దొంగతనం';

  @override
  String get gameSpeed => 'ఆట వేగం';

  @override
  String get play => 'ఆడండి';

  @override
  String get loadReplayFromClipboard =>
      'క్లిప్‌బోర్డ్ నుండి రీప్లే లోడ్ చేయండి';

  @override
  String get noReplayInClipboard => 'క్లిప్‌బోర్డ్‌లో Kittens రీప్లే లేదు';

  @override
  String get replayCopied => 'రీప్లే క్లిప్‌బోర్డ్‌లో ఉంది';

  @override
  String get replayTitle => 'రీప్లే';

  @override
  String get seatYou => 'మీరు';

  @override
  String botName(int number) {
    return 'బాట్ $number';
  }

  @override
  String get seatModeHuman => 'మనిషి';

  @override
  String get seatModeBot => 'బాట్';

  @override
  String get seatModePaused => 'పాజ్ చేయబడింది';

  @override
  String reactionFixed(String duration) {
    return 'ప్రతిస్పందన $duration';
  }

  @override
  String get reactionRandom => 'యాదృచ్ఛిక ప్రతిస్పందన';

  @override
  String get botIqSmart => 'తెలివిగా ఆడుతుంది';

  @override
  String get botIqFirstValid => 'మొదటి చెల్లుబాటయ్యేది';

  @override
  String get botIqSloppy => '20% తప్పులు చేస్తుంది';

  @override
  String get colorRed => 'ఎరుపు';

  @override
  String get colorGreen => 'ఆకుపచ్చ';

  @override
  String get colorBlue => 'నీలం';

  @override
  String get colorYellow => 'పసుపు';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'ప్రాథమిక';

  @override
  String get cardBomb => 'బాంబు';

  @override
  String get cardDefuse => 'నిర్వీర్యం చేయి';

  @override
  String get cardDetonate => 'పేల్చు';

  @override
  String get cardNope => 'కాదు!';

  @override
  String get cardShield => 'కవచం';

  @override
  String get cardSteal => 'దొంగతనం';

  @override
  String get cardTwist => 'తిప్పు';

  @override
  String get cardBlind => 'గుడ్డి';

  @override
  String get rejectNotYourTurn => 'ఇది మీ వంతు కాదు';

  @override
  String get rejectCardNotInHand => 'ఈ కార్డ్ ఇక మీ దగ్గర లేదు';

  @override
  String get rejectInvalidTarget => 'ఈ ఆటగాడిని లక్ష్యం చేయలేరు';

  @override
  String get rejectNotAReaction => 'ఈ కార్డ్‌ను డెక్‌పై విసురుతారు';

  @override
  String get rejectGhost => 'దెయ్యం కాదు! మాత్రమే ఆడగలదు';

  @override
  String get rejectNotGhost => 'కార్డ్ లేని కాదు! దెయ్యానికి మాత్రమే ఉంది';

  @override
  String get rejectGhostNopeUsed => 'దెయ్యం కాదు! ఈ రౌండ్‌లో ఇప్పటికే వాడారు';

  @override
  String get rejectGhostNeedsCard => 'దెయ్యానికి కాదు! కార్డ్ కావాలి';

  @override
  String get rejectNothingToNope => 'రద్దు చేయడానికి ఏమీ లేదు';

  @override
  String get rejectNoPendingLoss => 'కవచానికి ఇప్పుడు ఆలస్యమైంది';

  @override
  String get rejectOwnTurn => 'మీ సొంత వంతును దొంగిలించలేరు';

  @override
  String rejectTooEarly(String duration) {
    return '$duration సంకోచం తర్వాతే దొంగిలించగలరు';
  }

  @override
  String get rejectGameOver => 'ఆట ముగిసింది';

  @override
  String get rejectOther => 'ఆదేశం తిరస్కరించబడింది';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $durationలో';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $durationలో, $count తీసుకుంటారు';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card చెల్లదు';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: సమయం ముగిసింది';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: వంతు దొంగతనం ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $cardపై కాదు!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: కాదు! విఫలమైంది';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'బాంబు పైకి తేలింది, ఫ్యూజ్ $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'బాంబు పేలింది: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: నిర్వీర్యం చేయి';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $targetపై పేల్చు';
  }

  @override
  String captionShield(String player) {
    return '$player: కవచం';
  }

  @override
  String captionGhost(String player) {
    return '$player దెయ్యం అయ్యారు';
  }

  @override
  String get hintDetonate => 'బాంబు అందుకునే ఆటగాడిపైకి పేల్చు ను లాగండి';

  @override
  String get hintSteal => 'వంతు ఉన్న ఆటగాడిపైకి దొంగతనం ను లాగండి';

  @override
  String toastInvalidCard(int count) {
    return 'చెల్లని కార్డ్: ఒక ప్రాణం పోతుంది, $count తీసుకుంటారు';
  }

  @override
  String get toastTimeOut => 'సమయం ముగిసింది';

  @override
  String toastShieldWindow(String duration) {
    return '$durationలోపు కవచం!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: మీ వంతును దొంగిలించారు';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player మీపైకి బాంబు పంపారు';
  }

  @override
  String get toastNopeReturns => 'కాదు! వంతును మీకే తిరిగిస్తుంది';

  @override
  String get yourTurn => 'మీ వంతు';

  @override
  String onTurn(String player) {
    return 'వంతు: $player';
  }

  @override
  String deckCount(int count) {
    return 'డెక్ $count';
  }

  @override
  String ghostName(String name) {
    return '$name (దెయ్యం)';
  }

  @override
  String get ghostNope => 'దెయ్యం కాదు!';

  @override
  String get startHelp =>
      'డెక్ పైన ఉన్న గీతను దాటించి అదే రంగు లేదా సంఖ్య కార్డ్ విసరండి. కాదు!, కవచం ను పక్కకు స్వైప్ చేయండి; పేల్చు, దొంగతనం ను ఆటగాడిపైకి లాగండి.';

  @override
  String get start => 'ప్రారంభించండి';

  @override
  String get youWin => 'మీరు గెలిచారు';

  @override
  String get nobodySurvived => 'ఎవరూ బతకలేదు';

  @override
  String playerWins(String player) {
    return '$player గెలిచారు';
  }

  @override
  String get playAgain => 'మళ్లీ ఆడండి';

  @override
  String get copyReplay => 'రీప్లే కాపీ చేయండి';

  @override
  String get gameSettings => 'ఆట సెట్టింగ్‌లు';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'బాంబు, $fuse ఎత్తులు మిగిలాయి',
      one: 'బాంబు, $fuse ఎత్తు మిగిలింది',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'కొనసాగించండి';

  @override
  String get pause => 'పాజ్ చేయండి';

  @override
  String get debug => 'డీబగ్';

  @override
  String get sectionTime => 'సమయం';

  @override
  String get step => 'అడుగు';

  @override
  String gameClock(String duration, int round) {
    return 'ఆట సమయం $duration, రౌండ్ $round';
  }

  @override
  String get artificialLatency => 'కృత్రిమ ఆలస్యం';

  @override
  String get followTurn => 'వీక్షణం వంతు ఉన్న ఆటగాడిని అనుసరిస్తుంది';

  @override
  String get followTurnHint => 'మనుషులు నియంత్రించే సీట్లు మాత్రమే';

  @override
  String get sectionForceCard => 'కార్డ్ రుద్దండి';

  @override
  String get number => 'సంఖ్య';

  @override
  String get giveToHand => 'చేతికి ఇవ్వండి';

  @override
  String get setAsTarget => 'లక్ష్యంగా సెట్ చేయండి';

  @override
  String get sectionBombAndLimit => 'బాంబు, ఎత్తు పరిమితి';

  @override
  String get noBomb => 'బాంబు లేదు';

  @override
  String fuseValue(int fuse) {
    return 'ఫ్యూజ్ $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '1వ రౌండ్ పరిమితి (ఇప్పుడు $duration)';
  }

  @override
  String get loadFromClipboard => 'క్లిప్‌బోర్డ్ నుండి లోడ్ చేయండి';

  @override
  String get sectionEvents => 'సంఘటనలు';

  @override
  String get endGame => 'ఆట ముగించండి';

  @override
  String get removeLife => 'ప్రాణం తగ్గించండి';

  @override
  String get addLife => 'ప్రాణం పెంచండి';
}
