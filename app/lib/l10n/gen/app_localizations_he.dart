// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get tagline => 'זרקו את הקלף הנכון לפני שהפתיל נשרף.';

  @override
  String get sectionPlayers => 'שחקנים';

  @override
  String get sectionRules => 'חוקים';

  @override
  String get sectionScenarios => 'תרחישים';

  @override
  String get ruleTurnLimit => 'מגבלת תור בסיבוב 1';

  @override
  String get ruleFastThrow => 'זריקה מהירה בלי משיכה עד';

  @override
  String get ruleSteal => 'גניבה אחרי היסוס ארוך מ־';

  @override
  String get gameSpeed => 'מהירות המשחק';

  @override
  String get play => 'שחק';

  @override
  String get loadReplayFromClipboard => 'טען הקלטה מהלוח';

  @override
  String get noReplayInClipboard => 'אין הקלטת Kittens בלוח';

  @override
  String get replayCopied => 'ההקלטה בלוח';

  @override
  String get replayTitle => 'הקלטה';

  @override
  String get seatYou => 'אתה';

  @override
  String botName(int number) {
    return 'בוט $number';
  }

  @override
  String get seatModeHuman => 'אדם';

  @override
  String get seatModeBot => 'בוט';

  @override
  String get seatModePaused => 'מושהה';

  @override
  String reactionFixed(String duration) {
    return 'תגובה $duration';
  }

  @override
  String get reactionRandom => 'תגובה אקראית';

  @override
  String get botIqSmart => 'משחק בחוכמה';

  @override
  String get botIqFirstValid => 'הראשון התקף';

  @override
  String get botIqSloppy => 'טועה ב־20%';

  @override
  String get colorRed => 'אדום';

  @override
  String get colorGreen => 'ירוק';

  @override
  String get colorBlue => 'כחול';

  @override
  String get colorYellow => 'צהוב';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'בסיסי';

  @override
  String get cardBomb => 'פצצה';

  @override
  String get cardDefuse => 'נטרול';

  @override
  String get cardDetonate => 'פיצוץ';

  @override
  String get cardNope => 'לא!';

  @override
  String get cardShield => 'מגן';

  @override
  String get cardSteal => 'גניבה';

  @override
  String get cardTwist => 'היפוך';

  @override
  String get cardBlind => 'עיוור';

  @override
  String get rejectNotYourTurn => 'זה לא התור שלך';

  @override
  String get rejectCardNotInHand => 'כבר אין לך את הקלף הזה';

  @override
  String get rejectInvalidTarget => 'אי אפשר לכוון אל השחקן הזה';

  @override
  String get rejectNotAReaction => 'את הקלף הזה זורקים על החבילה';

  @override
  String get rejectGhost => 'רוח רפאים יכולה לשחק רק לא!';

  @override
  String get rejectNotGhost => 'לא! בלי קלף יש רק לרוח רפאים';

  @override
  String get rejectGhostNopeUsed => 'הלא! של רוח הרפאים כבר נוצל בסיבוב הזה';

  @override
  String get rejectGhostNeedsCard => 'רוח רפאים צריכה קלף לא!';

  @override
  String get rejectNothingToNope => 'אין מה לבטל';

  @override
  String get rejectNoPendingLoss => 'מאוחר מדי למגן';

  @override
  String get rejectOwnTurn => 'אי אפשר לגנוב את התור של עצמך';

  @override
  String rejectTooEarly(String duration) {
    return 'אפשר לגנוב רק אחרי $duration של היסוס';
  }

  @override
  String get rejectGameOver => 'המשחק נגמר';

  @override
  String get rejectOther => 'הפקודה נדחתה';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card תוך $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card תוך $duration, מושך $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card לא תקף';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: נגמר הזמן';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: גניבת תור ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: לא! על $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: הלא! נכשל';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'הפצצה צפה, פתיל $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'הפצצה התפוצצה: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: נטרול';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: פיצוץ על $target';
  }

  @override
  String captionShield(String player) {
    return '$player: מגן';
  }

  @override
  String captionGhost(String player) {
    return '$player הוא רוח רפאים';
  }

  @override
  String get hintDetonate => 'גררו פיצוץ אל השחקן שיקבל את הפצצה';

  @override
  String get hintSteal => 'גררו גניבה אל השחקן שבתורו';

  @override
  String toastInvalidCard(int count) {
    return 'קלף לא תקף: אתם מאבדים חיים ומושכים $count';
  }

  @override
  String get toastTimeOut => 'נגמר הזמן';

  @override
  String toastShieldWindow(String duration) {
    return 'מגן תוך $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: גנב את התור שלך';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player שלח אליך את הפצצה';
  }

  @override
  String get toastNopeReturns => 'לא! מחזיר אליך את התור';

  @override
  String get yourTurn => 'התור שלך';

  @override
  String onTurn(String player) {
    return 'בתור: $player';
  }

  @override
  String deckCount(int count) {
    return 'חבילה $count';
  }

  @override
  String ghostName(String name) {
    return '$name (רוח רפאים)';
  }

  @override
  String get ghostNope => 'לא! של רוח הרפאים';

  @override
  String get startHelp =>
      'זרקו קלף באותו צבע או מספר מעל הקו שמעל החבילה. החליקו לא! ומגן הצידה, וגררו פיצוץ וגניבה אל שחקן.';

  @override
  String get start => 'התחל';

  @override
  String get youWin => 'ניצחת';

  @override
  String get nobodySurvived => 'אף אחד לא שרד';

  @override
  String playerWins(String player) {
    return '$player מנצח';
  }

  @override
  String get playAgain => 'שחק שוב';

  @override
  String get copyReplay => 'העתק הקלטה';

  @override
  String get gameSettings => 'הגדרות משחק';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'פצצה, נשארו $fuse תורות',
      two: 'פצצה, נשארו שני תורות',
      one: 'פצצה, נשאר תור אחד',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'המשך';

  @override
  String get pause => 'השהה';

  @override
  String get debug => 'ניפוי שגיאות';

  @override
  String get sectionTime => 'זמן';

  @override
  String get step => 'צעד';

  @override
  String gameClock(String duration, int round) {
    return 'זמן משחק $duration, סיבוב $round';
  }

  @override
  String get artificialLatency => 'השהיה מלאכותית';

  @override
  String get followTurn => 'התצוגה עוקבת אחרי השחקן שבתורו';

  @override
  String get followTurnHint => 'רק מושבים שבשליטת אדם';

  @override
  String get sectionForceCard => 'כפה קלף';

  @override
  String get number => 'מספר';

  @override
  String get giveToHand => 'תן ליד';

  @override
  String get setAsTarget => 'הגדר כמטרה';

  @override
  String get sectionBombAndLimit => 'פצצה ומגבלת תור';

  @override
  String get noBomb => 'בלי פצצה';

  @override
  String fuseValue(int fuse) {
    return 'פתיל $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'מגבלה בסיבוב 1 (כרגע $duration)';
  }

  @override
  String get loadFromClipboard => 'טען מהלוח';

  @override
  String get sectionEvents => 'אירועים';

  @override
  String get endGame => 'סיים משחק';

  @override
  String get removeLife => 'הורד חיים';

  @override
  String get addLife => 'הוסף חיים';
}
