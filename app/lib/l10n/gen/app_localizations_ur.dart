// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get tagline => 'فیوز جلنے سے پہلے صحیح پتہ پھینکو۔';

  @override
  String get sectionPlayers => 'کھلاڑی';

  @override
  String get sectionRules => 'قواعد';

  @override
  String get sectionScenarios => 'منظرنامے';

  @override
  String get ruleTurnLimit => 'پہلے راؤنڈ میں باری کی حد';

  @override
  String get ruleFastThrow => 'بغیر اٹھائے تیز پھینک، حد تک';

  @override
  String get ruleSteal => 'اس سے زیادہ ہچکچاہٹ پر چوری';

  @override
  String get gameSpeed => 'گیم کی رفتار';

  @override
  String get play => 'کھیلیں';

  @override
  String get loadReplayFromClipboard => 'کلپ بورڈ سے ری پلے لوڈ کریں';

  @override
  String get noReplayInClipboard => 'کلپ بورڈ میں Kittens کا ری پلے نہیں ہے';

  @override
  String get replayCopied => 'ری پلے کلپ بورڈ میں ہے';

  @override
  String get replayTitle => 'ری پلے';

  @override
  String get seatYou => 'آپ';

  @override
  String botName(int number) {
    return 'بوٹ $number';
  }

  @override
  String get seatModeHuman => 'انسان';

  @override
  String get seatModeBot => 'بوٹ';

  @override
  String get seatModePaused => 'رکا ہوا';

  @override
  String reactionFixed(String duration) {
    return 'ردعمل $duration';
  }

  @override
  String get reactionRandom => 'بے ترتیب ردعمل';

  @override
  String get botIqSmart => 'سمجھداری سے کھیلتا ہے';

  @override
  String get botIqFirstValid => 'پہلا درست پتہ';

  @override
  String get botIqSloppy => '20% غلطی کرتا ہے';

  @override
  String get colorRed => 'سرخ';

  @override
  String get colorGreen => 'سبز';

  @override
  String get colorBlue => 'نیلا';

  @override
  String get colorYellow => 'پیلا';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'بنیادی';

  @override
  String get cardBomb => 'بم';

  @override
  String get cardDefuse => 'ناکارہ کریں';

  @override
  String get cardDetonate => 'دھماکا';

  @override
  String get cardNope => 'نہیں!';

  @override
  String get cardShield => 'ڈھال';

  @override
  String get cardSteal => 'چوری';

  @override
  String get cardTwist => 'الٹائیں';

  @override
  String get cardBlind => 'اندھا';

  @override
  String get rejectNotYourTurn => 'آپ کی باری نہیں ہے';

  @override
  String get rejectCardNotInHand => 'یہ پتہ اب آپ کے پاس نہیں ہے';

  @override
  String get rejectInvalidTarget => 'اس کھلاڑی کو نشانہ نہیں بنایا جا سکتا';

  @override
  String get rejectNotAReaction => 'یہ پتہ ڈیک پر پھینکا جاتا ہے';

  @override
  String get rejectGhost => 'بھوت صرف نہیں! کھیل سکتا ہے';

  @override
  String get rejectNotGhost => 'بغیر پتے کے نہیں! صرف بھوت کے پاس ہے';

  @override
  String get rejectGhostNopeUsed =>
      'بھوت کا نہیں! اس راؤنڈ میں استعمال ہو چکا ہے';

  @override
  String get rejectGhostNeedsCard => 'بھوت کو نہیں! کا پتہ چاہیے';

  @override
  String get rejectNothingToNope => 'منسوخ کرنے کو کچھ نہیں';

  @override
  String get rejectNoPendingLoss => 'ڈھال کے لیے اب دیر ہو چکی ہے';

  @override
  String get rejectOwnTurn => 'اپنی ہی باری نہیں چرا سکتے';

  @override
  String rejectTooEarly(String duration) {
    return 'چوری صرف $duration ہچکچاہٹ کے بعد ممکن ہے';
  }

  @override
  String get rejectGameOver => 'گیم ختم ہو گئی';

  @override
  String get rejectOther => 'حکم مسترد ہو گیا';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card، $duration میں';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card، $duration میں، $count اٹھاتا ہے';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card درست نہیں';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: وقت ختم';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: باری کی چوری ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card پر نہیں!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: نہیں! ناکام رہا';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'بم ابھر آیا، فیوز $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'بم پھٹ گیا: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: ناکارہ کریں';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target پر دھماکا';
  }

  @override
  String captionShield(String player) {
    return '$player: ڈھال';
  }

  @override
  String captionGhost(String player) {
    return '$player بھوت ہے';
  }

  @override
  String get hintDetonate => 'دھماکا کو اس کھلاڑی پر گھسیٹیں جسے بم ملے گا';

  @override
  String get hintSteal => 'چوری کو اس کھلاڑی پر گھسیٹیں جس کی باری ہے';

  @override
  String toastInvalidCard(int count) {
    return 'غلط پتہ: ایک جان جاتی ہے اور $count اٹھانے پڑتے ہیں';
  }

  @override
  String get toastTimeOut => 'وقت ختم';

  @override
  String toastShieldWindow(String duration) {
    return '$duration کے اندر ڈھال!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: نے آپ کی باری چرا لی';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player نے آپ کی طرف بم بھیج دیا';
  }

  @override
  String get toastNopeReturns => 'نہیں! باری آپ کو لوٹا دیتا ہے';

  @override
  String get yourTurn => 'آپ کی باری';

  @override
  String onTurn(String player) {
    return 'باری: $player';
  }

  @override
  String deckCount(int count) {
    return 'ڈیک $count';
  }

  @override
  String ghostName(String name) {
    return '$name (بھوت)';
  }

  @override
  String get ghostNope => 'بھوت کا نہیں!';

  @override
  String get startHelp =>
      'ڈیک کے اوپر والی لکیر کے پار اسی رنگ یا نمبر کا پتہ پھینکیں۔ نہیں! اور ڈھال کو کنارے کی طرف سوائپ کریں، دھماکا اور چوری کو کھلاڑی پر گھسیٹیں۔';

  @override
  String get start => 'شروع کریں';

  @override
  String get youWin => 'آپ جیت گئے';

  @override
  String get nobodySurvived => 'کوئی نہیں بچا';

  @override
  String playerWins(String player) {
    return '$player جیت گیا';
  }

  @override
  String get playAgain => 'دوبارہ کھیلیں';

  @override
  String get copyReplay => 'ری پلے کاپی کریں';

  @override
  String get gameSettings => 'گیم کی ترتیبات';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'بم، $fuse باریاں باقی',
      one: 'بم، $fuse باری باقی',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'جاری رکھیں';

  @override
  String get pause => 'روکیں';

  @override
  String get debug => 'ڈیبگ';

  @override
  String get sectionTime => 'وقت';

  @override
  String get step => 'قدم';

  @override
  String gameClock(String duration, int round) {
    return 'گیم کا وقت $duration، راؤنڈ $round';
  }

  @override
  String get artificialLatency => 'مصنوعی تاخیر';

  @override
  String get followTurn => 'منظر باری والے کھلاڑی کا پیچھا کرتا ہے';

  @override
  String get followTurnHint => 'صرف وہ نشستیں جو انسان کے کنٹرول میں ہوں';

  @override
  String get sectionForceCard => 'پتہ زبردستی دیں';

  @override
  String get number => 'نمبر';

  @override
  String get giveToHand => 'ہاتھ میں دیں';

  @override
  String get setAsTarget => 'ہدف مقرر کریں';

  @override
  String get sectionBombAndLimit => 'بم اور باری کی حد';

  @override
  String get noBomb => 'بغیر بم';

  @override
  String fuseValue(int fuse) {
    return 'فیوز $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'پہلے راؤنڈ میں حد (ابھی $duration)';
  }

  @override
  String get loadFromClipboard => 'کلپ بورڈ سے لوڈ کریں';

  @override
  String get sectionEvents => 'واقعات';

  @override
  String get endGame => 'گیم ختم کریں';

  @override
  String get removeLife => 'جان کم کریں';

  @override
  String get addLife => 'جان بڑھائیں';
}
