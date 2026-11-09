// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get tagline => 'Ném đúng lá bài trước khi ngòi cháy hết.';

  @override
  String get sectionPlayers => 'Người chơi';

  @override
  String get sectionRules => 'Luật chơi';

  @override
  String get sectionScenarios => 'Kịch bản';

  @override
  String get ruleTurnLimit => 'Giới hạn lượt ở vòng 1';

  @override
  String get ruleFastThrow => 'Ném nhanh không rút bài đến';

  @override
  String get ruleSteal => 'Cướp sau khi do dự lâu hơn';

  @override
  String get gameSpeed => 'Tốc độ trò chơi';

  @override
  String get play => 'Chơi';

  @override
  String get loadReplayFromClipboard => 'Tải bản phát lại từ bộ nhớ tạm';

  @override
  String get noReplayInClipboard => 'Bộ nhớ tạm không có bản phát lại Kittens';

  @override
  String get replayCopied => 'Bản phát lại đã vào bộ nhớ tạm';

  @override
  String get replayTitle => 'Phát lại';

  @override
  String get seatYou => 'Bạn';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Người';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Tạm dừng';

  @override
  String reactionFixed(String duration) {
    return 'Phản ứng $duration';
  }

  @override
  String get reactionRandom => 'Phản ứng ngẫu nhiên';

  @override
  String get botIqSmart => 'Chơi thông minh';

  @override
  String get botIqFirstValid => 'Lá hợp lệ đầu tiên';

  @override
  String get botIqSloppy => 'Sai 20%';

  @override
  String get colorRed => 'đỏ';

  @override
  String get colorGreen => 'xanh lá';

  @override
  String get colorBlue => 'xanh dương';

  @override
  String get colorYellow => 'vàng';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Cơ bản';

  @override
  String get cardBomb => 'Bom';

  @override
  String get cardDefuse => 'Gỡ bom';

  @override
  String get cardDetonate => 'Kích nổ';

  @override
  String get cardNope => 'Không!';

  @override
  String get cardShield => 'Khiên';

  @override
  String get cardSteal => 'Cướp';

  @override
  String get cardTwist => 'Đảo chiều';

  @override
  String get cardBlind => 'Mù';

  @override
  String get rejectNotYourTurn => 'Chưa đến lượt bạn';

  @override
  String get rejectCardNotInHand => 'Bạn không còn lá này';

  @override
  String get rejectInvalidTarget => 'Không thể nhắm vào người chơi này';

  @override
  String get rejectNotAReaction => 'Lá này được ném lên bộ bài';

  @override
  String get rejectGhost => 'Bóng ma chỉ được chơi Không!';

  @override
  String get rejectNotGhost => 'Chỉ bóng ma mới có Không! không cần lá';

  @override
  String get rejectGhostNopeUsed =>
      'Không! của bóng ma đã dùng hết trong vòng này';

  @override
  String get rejectGhostNeedsCard => 'Bóng ma cần lá Không!';

  @override
  String get rejectNothingToNope => 'Không có gì để hủy';

  @override
  String get rejectNoPendingLoss => 'Đã quá muộn để dùng Khiên';

  @override
  String get rejectOwnTurn => 'Không thể cướp lượt của chính mình';

  @override
  String rejectTooEarly(String duration) {
    return 'Chỉ cướp được sau khi do dự $duration';
  }

  @override
  String get rejectGameOver => 'Trò chơi đã kết thúc';

  @override
  String get rejectOther => 'Lệnh bị từ chối';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card trong $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card trong $duration, rút $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card không hợp lệ';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: hết giờ';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: cướp lượt ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Không! lên $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Không! thất bại';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bom xuất hiện, ngòi $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bom nổ: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Gỡ bom';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Kích nổ sang $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Khiên';
  }

  @override
  String captionGhost(String player) {
    return '$player là bóng ma';
  }

  @override
  String get hintDetonate => 'Kéo Kích nổ lên người chơi sẽ nhận bom';

  @override
  String get hintSteal => 'Kéo Cướp lên người chơi đang đến lượt';

  @override
  String toastInvalidCard(int count) {
    return 'Lá không hợp lệ: bạn mất một mạng và rút $count';
  }

  @override
  String get toastTimeOut => 'Hết giờ';

  @override
  String toastShieldWindow(String duration) {
    return 'Khiên trong $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: cướp lượt của bạn';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player đã gửi bom cho bạn';
  }

  @override
  String get toastNopeReturns => 'Không! trả lượt về cho bạn';

  @override
  String get yourTurn => 'Đến lượt bạn';

  @override
  String onTurn(String player) {
    return 'Lượt của: $player';
  }

  @override
  String deckCount(int count) {
    return 'Bộ bài $count';
  }

  @override
  String ghostName(String name) {
    return '$name (bóng ma)';
  }

  @override
  String get ghostNope => 'Không! của bóng ma';

  @override
  String get startHelp =>
      'Ném lá cùng màu hoặc cùng số qua vạch phía trên bộ bài. Vuốt Không! và Khiên sang bên, kéo Kích nổ và Cướp lên một người chơi.';

  @override
  String get start => 'Bắt đầu';

  @override
  String get youWin => 'Bạn thắng';

  @override
  String get nobodySurvived => 'Không ai sống sót';

  @override
  String playerWins(String player) {
    return '$player thắng';
  }

  @override
  String get playAgain => 'Chơi lại';

  @override
  String get copyReplay => 'Sao chép bản phát lại';

  @override
  String get gameSettings => 'Cài đặt trò chơi';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bom, còn $fuse lượt',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Tiếp tục';

  @override
  String get pause => 'Tạm dừng';

  @override
  String get debug => 'Gỡ lỗi';

  @override
  String get sectionTime => 'Thời gian';

  @override
  String get step => 'Bước';

  @override
  String gameClock(String duration, int round) {
    return 'Thời gian chơi $duration, vòng $round';
  }

  @override
  String get artificialLatency => 'Độ trễ nhân tạo';

  @override
  String get followTurn => 'Góc nhìn theo người chơi đang đến lượt';

  @override
  String get followTurnHint => 'Chỉ các ghế do người điều khiển';

  @override
  String get sectionForceCard => 'Ép lá bài';

  @override
  String get number => 'Số';

  @override
  String get giveToHand => 'Đưa vào tay';

  @override
  String get setAsTarget => 'Đặt làm mục tiêu';

  @override
  String get sectionBombAndLimit => 'Bom và giới hạn lượt';

  @override
  String get noBomb => 'Không bom';

  @override
  String fuseValue(int fuse) {
    return 'Ngòi $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Giới hạn vòng 1 (hiện $duration)';
  }

  @override
  String get loadFromClipboard => 'Tải từ bộ nhớ tạm';

  @override
  String get sectionEvents => 'Sự kiện';

  @override
  String get endGame => 'Kết thúc trò chơi';

  @override
  String get removeLife => 'Trừ một mạng';

  @override
  String get addLife => 'Thêm một mạng';
}
