// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get tagline => '在引线烧完之前，打出正确的牌。';

  @override
  String get sectionPlayers => '玩家';

  @override
  String get sectionRules => '规则';

  @override
  String get sectionScenarios => '场景';

  @override
  String get ruleTurnLimit => '第 1 轮出牌时限';

  @override
  String get ruleFastThrow => '不摸牌的快速出牌上限';

  @override
  String get ruleSteal => '犹豫超过此时间可抢夺';

  @override
  String get gameSpeed => '游戏速度';

  @override
  String get play => '开始';

  @override
  String get loadReplayFromClipboard => '从剪贴板载入回放';

  @override
  String get noReplayInClipboard => '剪贴板中没有 Kittens 回放';

  @override
  String get replayCopied => '回放已复制到剪贴板';

  @override
  String get replayTitle => '回放';

  @override
  String get seatYou => '你';

  @override
  String botName(int number) {
    return '机器人 $number';
  }

  @override
  String get seatModeHuman => '玩家';

  @override
  String get seatModeBot => '机器人';

  @override
  String get seatModePaused => '暂停';

  @override
  String reactionFixed(String duration) {
    return '反应 $duration';
  }

  @override
  String get reactionRandom => '随机反应';

  @override
  String get botIqSmart => '聪明地玩';

  @override
  String get botIqFirstValid => '第一张有效牌';

  @override
  String get botIqSloppy => '20% 出错';

  @override
  String get colorRed => '红色';

  @override
  String get colorGreen => '绿色';

  @override
  String get colorBlue => '蓝色';

  @override
  String get colorYellow => '黄色';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => '基础';

  @override
  String get cardBomb => '炸弹';

  @override
  String get cardDefuse => '拆除';

  @override
  String get cardDetonate => '引爆';

  @override
  String get cardNope => '不行！';

  @override
  String get cardShield => '护盾';

  @override
  String get cardSteal => '抢夺';

  @override
  String get cardTwist => '反转';

  @override
  String get cardBlind => '盲牌';

  @override
  String get rejectNotYourTurn => '还没轮到你';

  @override
  String get rejectCardNotInHand => '你已经没有这张牌了';

  @override
  String get rejectInvalidTarget => '不能选择这名玩家';

  @override
  String get rejectNotAReaction => '这张牌要扔到牌堆上';

  @override
  String get rejectGhost => '幽灵只能打出“不行！”';

  @override
  String get rejectNotGhost => '只有幽灵能不用牌使用“不行！”';

  @override
  String get rejectGhostNopeUsed => '幽灵的“不行！”本轮已用完';

  @override
  String get rejectGhostNeedsCard => '幽灵需要一张“不行！”牌';

  @override
  String get rejectNothingToNope => '没有可取消的内容';

  @override
  String get rejectNoPendingLoss => '来不及用护盾了';

  @override
  String get rejectOwnTurn => '不能抢自己的回合';

  @override
  String rejectTooEarly(String duration) {
    return '犹豫 $duration 后才能抢夺';
  }

  @override
  String get rejectGameOver => '游戏已结束';

  @override
  String get rejectOther => '指令被拒绝';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player：$card，用时 $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player：$card，用时 $duration，摸 $count 张';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player：$card 无效';
  }

  @override
  String captionTimedOut(String player) {
    return '$player：超时';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player：抢夺回合（$victim）';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player：对 $card 使用“不行！”';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player：“不行！”落空';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return '炸弹浮出，引线 $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return '炸弹爆炸：$player';
  }

  @override
  String captionDefused(String player) {
    return '$player：拆除';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player：向 $target 引爆';
  }

  @override
  String captionShield(String player) {
    return '$player：护盾';
  }

  @override
  String captionGhost(String player) {
    return '$player 变成了幽灵';
  }

  @override
  String get hintDetonate => '把“引爆”拖到将收到炸弹的玩家身上';

  @override
  String get hintSteal => '把“抢夺”拖到当前回合的玩家身上';

  @override
  String toastInvalidCard(int count) {
    return '无效牌：失去一条命并摸 $count 张';
  }

  @override
  String get toastTimeOut => '超时';

  @override
  String toastShieldWindow(String duration) {
    return '$duration 内使用护盾！';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player：抢了你的回合';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player 把炸弹引爆到你身上';
  }

  @override
  String get toastNopeReturns => '“不行！”把回合还给了你';

  @override
  String get yourTurn => '轮到你了';

  @override
  String onTurn(String player) {
    return '轮到：$player';
  }

  @override
  String deckCount(int count) {
    return '牌堆 $count';
  }

  @override
  String ghostName(String name) {
    return '$name（幽灵）';
  }

  @override
  String get ghostNope => '幽灵的“不行！”';

  @override
  String get startHelp => '把同色或同数字的牌越过牌堆上方的线扔出。“不行！”和护盾向旁边滑动，“引爆”和“抢夺”拖到玩家身上。';

  @override
  String get start => '开始';

  @override
  String get youWin => '你赢了';

  @override
  String get nobodySurvived => '无人幸存';

  @override
  String playerWins(String player) {
    return '$player 获胜';
  }

  @override
  String get playAgain => '再玩一次';

  @override
  String get copyReplay => '复制回放';

  @override
  String get gameSettings => '游戏设置';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: '炸弹，还剩 $fuse 回合',
    );
    return '$_temp0';
  }

  @override
  String get resume => '继续';

  @override
  String get pause => '暂停';

  @override
  String get debug => '调试';

  @override
  String get sectionTime => '时间';

  @override
  String get step => '单步';

  @override
  String gameClock(String duration, int round) {
    return '游戏时间 $duration，第 $round 轮';
  }

  @override
  String get artificialLatency => '人为延迟';

  @override
  String get followTurn => '视角跟随当前回合的玩家';

  @override
  String get followTurnHint => '仅限真人控制的座位';

  @override
  String get sectionForceCard => '强制出牌';

  @override
  String get number => '数字';

  @override
  String get giveToHand => '加入手牌';

  @override
  String get setAsTarget => '设为目标';

  @override
  String get sectionBombAndLimit => '炸弹与回合时限';

  @override
  String get noBomb => '无炸弹';

  @override
  String fuseValue(int fuse) {
    return '引线 $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '第 1 轮时限（当前 $duration）';
  }

  @override
  String get loadFromClipboard => '从剪贴板载入';

  @override
  String get sectionEvents => '事件';

  @override
  String get endGame => '结束游戏';

  @override
  String get removeLife => '扣一条命';

  @override
  String get addLife => '加一条命';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get tagline => '在引線燒完之前，打出正確的牌。';

  @override
  String get sectionPlayers => '玩家';

  @override
  String get sectionRules => '規則';

  @override
  String get sectionScenarios => '情境';

  @override
  String get ruleTurnLimit => '第 1 輪出牌時限';

  @override
  String get ruleFastThrow => '不摸牌的快速出牌上限';

  @override
  String get ruleSteal => '猶豫超過此時間可搶奪';

  @override
  String get gameSpeed => '遊戲速度';

  @override
  String get play => '開始';

  @override
  String get loadReplayFromClipboard => '從剪貼簿載入重播';

  @override
  String get noReplayInClipboard => '剪貼簿中沒有 Kittens 重播';

  @override
  String get replayCopied => '重播已拷貝到剪貼簿';

  @override
  String get replayTitle => '重播';

  @override
  String get seatYou => '你';

  @override
  String botName(int number) {
    return '機器人 $number';
  }

  @override
  String get seatModeHuman => '玩家';

  @override
  String get seatModeBot => '機器人';

  @override
  String get seatModePaused => '暫停';

  @override
  String reactionFixed(String duration) {
    return '反應 $duration';
  }

  @override
  String get reactionRandom => '隨機反應';

  @override
  String get botIqSmart => '聰明地玩';

  @override
  String get botIqFirstValid => '第一張有效牌';

  @override
  String get botIqSloppy => '20% 出錯';

  @override
  String get colorRed => '紅色';

  @override
  String get colorGreen => '綠色';

  @override
  String get colorBlue => '藍色';

  @override
  String get colorYellow => '黃色';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => '基礎';

  @override
  String get cardBomb => '炸彈';

  @override
  String get cardDefuse => '拆除';

  @override
  String get cardDetonate => '引爆';

  @override
  String get cardNope => '不行！';

  @override
  String get cardShield => '護盾';

  @override
  String get cardSteal => '搶奪';

  @override
  String get cardTwist => '反轉';

  @override
  String get cardBlind => '盲牌';

  @override
  String get rejectNotYourTurn => '還沒輪到你';

  @override
  String get rejectCardNotInHand => '你已經沒有這張牌了';

  @override
  String get rejectInvalidTarget => '不能選擇這名玩家';

  @override
  String get rejectNotAReaction => '這張牌要丟到牌堆上';

  @override
  String get rejectGhost => '幽靈只能打出「不行！」';

  @override
  String get rejectNotGhost => '只有幽靈能不用牌使用「不行！」';

  @override
  String get rejectGhostNopeUsed => '幽靈的「不行！」本輪已用完';

  @override
  String get rejectGhostNeedsCard => '幽靈需要一張「不行！」牌';

  @override
  String get rejectNothingToNope => '沒有可取消的內容';

  @override
  String get rejectNoPendingLoss => '來不及用護盾了';

  @override
  String get rejectOwnTurn => '不能搶自己的回合';

  @override
  String rejectTooEarly(String duration) {
    return '猶豫 $duration 後才能搶奪';
  }

  @override
  String get rejectGameOver => '遊戲已結束';

  @override
  String get rejectOther => '指令被拒絕';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player：$card，用時 $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player：$card，用時 $duration，摸 $count 張';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player：$card 無效';
  }

  @override
  String captionTimedOut(String player) {
    return '$player：逾時';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player：搶奪回合（$victim）';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player：對 $card 使用「不行！」';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player：「不行！」落空';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return '炸彈浮出，引線 $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return '炸彈爆炸：$player';
  }

  @override
  String captionDefused(String player) {
    return '$player：拆除';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player：向 $target 引爆';
  }

  @override
  String captionShield(String player) {
    return '$player：護盾';
  }

  @override
  String captionGhost(String player) {
    return '$player 變成了幽靈';
  }

  @override
  String get hintDetonate => '把「引爆」拖到將收到炸彈的玩家身上';

  @override
  String get hintSteal => '把「搶奪」拖到目前回合的玩家身上';

  @override
  String toastInvalidCard(int count) {
    return '無效牌：失去一條命並摸 $count 張';
  }

  @override
  String get toastTimeOut => '逾時';

  @override
  String toastShieldWindow(String duration) {
    return '$duration 內使用護盾！';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player：搶了你的回合';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player 把炸彈引爆到你身上';
  }

  @override
  String get toastNopeReturns => '「不行！」把回合還給了你';

  @override
  String get yourTurn => '輪到你了';

  @override
  String onTurn(String player) {
    return '輪到：$player';
  }

  @override
  String deckCount(int count) {
    return '牌堆 $count';
  }

  @override
  String ghostName(String name) {
    return '$name（幽靈）';
  }

  @override
  String get ghostNope => '幽靈的「不行！」';

  @override
  String get startHelp => '把同色或同數字的牌越過牌堆上方的線丟出。「不行！」和護盾向旁邊滑動，「引爆」和「搶奪」拖到玩家身上。';

  @override
  String get start => '開始';

  @override
  String get youWin => '你贏了';

  @override
  String get nobodySurvived => '無人倖存';

  @override
  String playerWins(String player) {
    return '$player 獲勝';
  }

  @override
  String get playAgain => '再玩一次';

  @override
  String get copyReplay => '拷貝重播';

  @override
  String get gameSettings => '遊戲設定';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: '炸彈，還剩 $fuse 回合',
    );
    return '$_temp0';
  }

  @override
  String get resume => '繼續';

  @override
  String get pause => '暫停';

  @override
  String get debug => '除錯';

  @override
  String get sectionTime => '時間';

  @override
  String get step => '單步';

  @override
  String gameClock(String duration, int round) {
    return '遊戲時間 $duration，第 $round 輪';
  }

  @override
  String get artificialLatency => '人為延遲';

  @override
  String get followTurn => '視角跟隨目前回合的玩家';

  @override
  String get followTurnHint => '僅限真人控制的座位';

  @override
  String get sectionForceCard => '強制出牌';

  @override
  String get number => '數字';

  @override
  String get giveToHand => '加入手牌';

  @override
  String get setAsTarget => '設為目標';

  @override
  String get sectionBombAndLimit => '炸彈與回合時限';

  @override
  String get noBomb => '無炸彈';

  @override
  String fuseValue(int fuse) {
    return '引線 $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '第 1 輪時限（目前 $duration）';
  }

  @override
  String get loadFromClipboard => '從剪貼簿載入';

  @override
  String get sectionEvents => '事件';

  @override
  String get endGame => '結束遊戲';

  @override
  String get removeLife => '扣一條命';

  @override
  String get addLife => '加一條命';
}
