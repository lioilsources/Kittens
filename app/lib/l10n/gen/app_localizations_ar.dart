// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get tagline => 'ارمِ البطاقة الصحيحة قبل أن يحترق الفتيل.';

  @override
  String get sectionPlayers => 'اللاعبون';

  @override
  String get sectionRules => 'القواعد';

  @override
  String get sectionScenarios => 'السيناريوهات';

  @override
  String get ruleTurnLimit => 'حد الدور في الجولة 1';

  @override
  String get ruleFastThrow => 'رمي سريع دون سحب حتى';

  @override
  String get ruleSteal => 'سرقة بعد تردد أطول من';

  @override
  String get gameSpeed => 'سرعة اللعبة';

  @override
  String get play => 'العب';

  @override
  String get loadReplayFromClipboard => 'تحميل الإعادة من الحافظة';

  @override
  String get noReplayInClipboard => 'لا توجد إعادة Kittens في الحافظة';

  @override
  String get replayCopied => 'الإعادة في الحافظة';

  @override
  String get replayTitle => 'إعادة';

  @override
  String get seatYou => 'أنت';

  @override
  String botName(int number) {
    return 'روبوت $number';
  }

  @override
  String get seatModeHuman => 'بشري';

  @override
  String get seatModeBot => 'روبوت';

  @override
  String get seatModePaused => 'متوقف مؤقتًا';

  @override
  String reactionFixed(String duration) {
    return 'ردة الفعل $duration';
  }

  @override
  String get reactionRandom => 'ردة فعل عشوائية';

  @override
  String get botIqSmart => 'يلعب بذكاء';

  @override
  String get botIqFirstValid => 'أول بطاقة صالحة';

  @override
  String get botIqSloppy => 'يخطئ بنسبة 20%';

  @override
  String get colorRed => 'حمراء';

  @override
  String get colorGreen => 'خضراء';

  @override
  String get colorBlue => 'زرقاء';

  @override
  String get colorYellow => 'صفراء';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'أساسية';

  @override
  String get cardBomb => 'قنبلة';

  @override
  String get cardDefuse => 'إبطال';

  @override
  String get cardDetonate => 'تفجير';

  @override
  String get cardNope => 'لا!';

  @override
  String get cardShield => 'درع';

  @override
  String get cardSteal => 'سرقة';

  @override
  String get cardTwist => 'عكس';

  @override
  String get cardBlind => 'عمياء';

  @override
  String get rejectNotYourTurn => 'ليس دورك';

  @override
  String get rejectCardNotInHand => 'لم تعد تملك هذه البطاقة';

  @override
  String get rejectInvalidTarget => 'لا يمكن استهداف هذا اللاعب';

  @override
  String get rejectNotAReaction => 'تُرمى هذه البطاقة على الرزمة';

  @override
  String get rejectGhost => 'يمكن للشبح أن يلعب «لا!» فقط';

  @override
  String get rejectNotGhost => '«لا!» بلا بطاقة للشبح فقط';

  @override
  String get rejectGhostNopeUsed =>
      'استُخدمت «لا!» الخاصة بالشبح في هذه الجولة';

  @override
  String get rejectGhostNeedsCard => 'يحتاج الشبح إلى بطاقة «لا!»';

  @override
  String get rejectNothingToNope => 'لا شيء لإلغائه';

  @override
  String get rejectNoPendingLoss => 'فات الأوان على الدرع';

  @override
  String get rejectOwnTurn => 'لا يمكنك سرقة دورك أنت';

  @override
  String rejectTooEarly(String duration) {
    return 'يمكن السرقة فقط بعد تردد $duration';
  }

  @override
  String get rejectGameOver => 'انتهت اللعبة';

  @override
  String get rejectOther => 'تم رفض الأمر';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card في $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card في $duration، يسحب $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card غير صالحة';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: انتهى الوقت';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: سرقة الدور ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: «لا!» على $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: «لا!» لم تنجح';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'ظهرت القنبلة، الفتيل $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'انفجرت القنبلة: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: إبطال';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: تفجير على $target';
  }

  @override
  String captionShield(String player) {
    return '$player: درع';
  }

  @override
  String captionGhost(String player) {
    return '$player أصبح شبحًا';
  }

  @override
  String get hintDetonate => 'اسحب «تفجير» إلى اللاعب الذي سيتلقى القنبلة';

  @override
  String get hintSteal => 'اسحب «سرقة» إلى اللاعب صاحب الدور';

  @override
  String toastInvalidCard(int count) {
    return 'بطاقة غير صالحة: تفقد حياة وتسحب $count';
  }

  @override
  String get toastTimeOut => 'انتهى الوقت';

  @override
  String toastShieldWindow(String duration) {
    return 'الدرع خلال $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: سرق دورك';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player أرسل القنبلة إليك';
  }

  @override
  String get toastNopeReturns => '«لا!» تعيد الدور إليك';

  @override
  String get yourTurn => 'دورك';

  @override
  String onTurn(String player) {
    return 'الدور: $player';
  }

  @override
  String deckCount(int count) {
    return 'الرزمة $count';
  }

  @override
  String ghostName(String name) {
    return '$name (شبح)';
  }

  @override
  String get ghostNope => '«لا!» الشبح';

  @override
  String get startHelp =>
      'ارمِ بطاقة بنفس اللون أو الرقم فوق الخط الذي أعلى الرزمة. مرّر «لا!» والدرع إلى الجانب، واسحب «تفجير» و«سرقة» إلى لاعب.';

  @override
  String get start => 'ابدأ';

  @override
  String get youWin => 'فزت';

  @override
  String get nobodySurvived => 'لم ينجُ أحد';

  @override
  String playerWins(String player) {
    return '$player يفوز';
  }

  @override
  String get playAgain => 'العب مجددًا';

  @override
  String get copyReplay => 'نسخ الإعادة';

  @override
  String get gameSettings => 'إعدادات اللعبة';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'قنبلة، تبقّى $fuse دور',
      many: 'قنبلة، تبقّى $fuse دورًا',
      few: 'قنبلة، تبقّت $fuse أدوار',
      two: 'قنبلة، تبقّى دوران',
      one: 'قنبلة، تبقّى دور واحد',
      zero: 'قنبلة، لم يتبقَّ أي دور',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'متابعة';

  @override
  String get pause => 'إيقاف مؤقت';

  @override
  String get debug => 'تصحيح';

  @override
  String get sectionTime => 'الوقت';

  @override
  String get step => 'خطوة';

  @override
  String gameClock(String duration, int round) {
    return 'وقت اللعبة $duration، الجولة $round';
  }

  @override
  String get artificialLatency => 'زمن انتقال اصطناعي';

  @override
  String get followTurn => 'العرض يتبع اللاعب صاحب الدور';

  @override
  String get followTurnHint => 'فقط المقاعد التي يتحكم بها إنسان';

  @override
  String get sectionForceCard => 'فرض بطاقة';

  @override
  String get number => 'الرقم';

  @override
  String get giveToHand => 'أعطِ لليد';

  @override
  String get setAsTarget => 'تعيين كهدف';

  @override
  String get sectionBombAndLimit => 'القنبلة وحد الدور';

  @override
  String get noBomb => 'بلا قنبلة';

  @override
  String fuseValue(int fuse) {
    return 'الفتيل $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'الحد في الجولة 1 (الآن $duration)';
  }

  @override
  String get loadFromClipboard => 'تحميل من الحافظة';

  @override
  String get sectionEvents => 'الأحداث';

  @override
  String get endGame => 'إنهاء اللعبة';

  @override
  String get removeLife => 'إنقاص حياة';

  @override
  String get addLife => 'إضافة حياة';
}
