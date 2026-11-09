// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get tagline => 'ปาการ์ดที่ใช่ก่อนที่ชนวนจะไหม้หมด';

  @override
  String get sectionPlayers => 'ผู้เล่น';

  @override
  String get sectionRules => 'กฎ';

  @override
  String get sectionScenarios => 'สถานการณ์';

  @override
  String get ruleTurnLimit => 'เวลาจำกัดต่อตาในรอบที่ 1';

  @override
  String get ruleFastThrow => 'ปาเร็วโดยไม่จั่วถึง';

  @override
  String get ruleSteal => 'ขโมยหลังลังเลนานกว่า';

  @override
  String get gameSpeed => 'ความเร็วเกม';

  @override
  String get play => 'เล่น';

  @override
  String get loadReplayFromClipboard => 'โหลดรีเพลย์จากคลิปบอร์ด';

  @override
  String get noReplayInClipboard => 'ไม่มีรีเพลย์ Kittens ในคลิปบอร์ด';

  @override
  String get replayCopied => 'รีเพลย์อยู่ในคลิปบอร์ดแล้ว';

  @override
  String get replayTitle => 'รีเพลย์';

  @override
  String get seatYou => 'คุณ';

  @override
  String botName(int number) {
    return 'บอต $number';
  }

  @override
  String get seatModeHuman => 'คน';

  @override
  String get seatModeBot => 'บอต';

  @override
  String get seatModePaused => 'หยุดชั่วคราว';

  @override
  String reactionFixed(String duration) {
    return 'ปฏิกิริยา $duration';
  }

  @override
  String get reactionRandom => 'ปฏิกิริยาแบบสุ่ม';

  @override
  String get botIqSmart => 'เล่นฉลาด';

  @override
  String get botIqFirstValid => 'ใบแรกที่ใช้ได้';

  @override
  String get botIqSloppy => 'พลาด 20%';

  @override
  String get colorRed => 'แดง';

  @override
  String get colorGreen => 'เขียว';

  @override
  String get colorBlue => 'น้ำเงิน';

  @override
  String get colorYellow => 'เหลือง';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'พื้นฐาน';

  @override
  String get cardBomb => 'ระเบิด';

  @override
  String get cardDefuse => 'ปลดชนวน';

  @override
  String get cardDetonate => 'จุดระเบิด';

  @override
  String get cardNope => 'ไม่!';

  @override
  String get cardShield => 'โล่';

  @override
  String get cardSteal => 'ขโมย';

  @override
  String get cardTwist => 'กลับทาง';

  @override
  String get cardBlind => 'ตาบอด';

  @override
  String get rejectNotYourTurn => 'ยังไม่ถึงตาคุณ';

  @override
  String get rejectCardNotInHand => 'คุณไม่มีการ์ดใบนี้แล้ว';

  @override
  String get rejectInvalidTarget => 'เลือกผู้เล่นคนนี้ไม่ได้';

  @override
  String get rejectNotAReaction => 'การ์ดใบนี้ปาลงบนกองไพ่';

  @override
  String get rejectGhost => 'ผีเล่นได้เฉพาะ ไม่!';

  @override
  String get rejectNotGhost =>
      'มีแต่ผีเท่านั้นที่ใช้ ไม่! ได้โดยไม่ต้องมีการ์ด';

  @override
  String get rejectGhostNopeUsed => 'ไม่! ของผีถูกใช้ไปแล้วในรอบนี้';

  @override
  String get rejectGhostNeedsCard => 'ผีต้องมีการ์ด ไม่!';

  @override
  String get rejectNothingToNope => 'ไม่มีอะไรให้ยกเลิก';

  @override
  String get rejectNoPendingLoss => 'สายเกินไปสำหรับโล่';

  @override
  String get rejectOwnTurn => 'ขโมยตาของตัวเองไม่ได้';

  @override
  String rejectTooEarly(String duration) {
    return 'ขโมยได้หลังลังเล $duration เท่านั้น';
  }

  @override
  String get rejectGameOver => 'เกมจบแล้ว';

  @override
  String get rejectOther => 'คำสั่งถูกปฏิเสธ';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card ใน $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card ใน $duration จั่ว $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card ใช้ไม่ได้';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: หมดเวลา';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: ขโมยตา ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: ไม่! ใส่ $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: ไม่! ไม่สำเร็จ';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'ระเบิดโผล่ขึ้นมา ชนวน $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'ระเบิดแล้ว: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: ปลดชนวน';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: จุดระเบิดใส่ $target';
  }

  @override
  String captionShield(String player) {
    return '$player: โล่';
  }

  @override
  String captionGhost(String player) {
    return '$player เป็นผี';
  }

  @override
  String get hintDetonate => 'ลาก จุดระเบิด ไปที่ผู้เล่นที่จะได้รับระเบิด';

  @override
  String get hintSteal => 'ลาก ขโมย ไปที่ผู้เล่นที่ถึงตา';

  @override
  String toastInvalidCard(int count) {
    return 'การ์ดใช้ไม่ได้: คุณเสียหนึ่งชีวิตและจั่ว $count';
  }

  @override
  String get toastTimeOut => 'หมดเวลา';

  @override
  String toastShieldWindow(String duration) {
    return 'โล่ภายใน $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: ขโมยตาของคุณ';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ส่งระเบิดมาให้คุณ';
  }

  @override
  String get toastNopeReturns => 'ไม่! คืนตาให้คุณ';

  @override
  String get yourTurn => 'ตาของคุณ';

  @override
  String onTurn(String player) {
    return 'ตา: $player';
  }

  @override
  String deckCount(int count) {
    return 'กองไพ่ $count';
  }

  @override
  String ghostName(String name) {
    return '$name (ผี)';
  }

  @override
  String get ghostNope => 'ไม่! ของผี';

  @override
  String get startHelp =>
      'ปาการ์ดสีหรือเลขเดียวกันข้ามเส้นเหนือกองไพ่ ปัด ไม่! และ โล่ ไปด้านข้าง ลาก จุดระเบิด และ ขโมย ไปที่ผู้เล่น';

  @override
  String get start => 'เริ่ม';

  @override
  String get youWin => 'คุณชนะ';

  @override
  String get nobodySurvived => 'ไม่มีใครรอด';

  @override
  String playerWins(String player) {
    return '$player ชนะ';
  }

  @override
  String get playAgain => 'เล่นอีกครั้ง';

  @override
  String get copyReplay => 'คัดลอกรีเพลย์';

  @override
  String get gameSettings => 'การตั้งค่าเกม';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'ระเบิด เหลืออีก $fuse ตา',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'เล่นต่อ';

  @override
  String get pause => 'หยุดชั่วคราว';

  @override
  String get debug => 'ดีบัก';

  @override
  String get sectionTime => 'เวลา';

  @override
  String get step => 'ขั้น';

  @override
  String gameClock(String duration, int round) {
    return 'เวลาเกม $duration รอบที่ $round';
  }

  @override
  String get artificialLatency => 'ความหน่วงจำลอง';

  @override
  String get followTurn => 'มุมมองตามผู้เล่นที่ถึงตา';

  @override
  String get followTurnHint => 'เฉพาะที่นั่งที่คนควบคุม';

  @override
  String get sectionForceCard => 'บังคับการ์ด';

  @override
  String get number => 'หมายเลข';

  @override
  String get giveToHand => 'ให้ขึ้นมือ';

  @override
  String get setAsTarget => 'ตั้งเป็นเป้าหมาย';

  @override
  String get sectionBombAndLimit => 'ระเบิดและเวลาจำกัด';

  @override
  String get noBomb => 'ไม่มีระเบิด';

  @override
  String fuseValue(int fuse) {
    return 'ชนวน $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'เวลาจำกัดรอบที่ 1 (ตอนนี้ $duration)';
  }

  @override
  String get loadFromClipboard => 'โหลดจากคลิปบอร์ด';

  @override
  String get sectionEvents => 'เหตุการณ์';

  @override
  String get endGame => 'จบเกม';

  @override
  String get removeLife => 'ลดชีวิต';

  @override
  String get addLife => 'เพิ่มชีวิต';
}
