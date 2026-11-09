// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get tagline => '導火線が燃え尽きる前に、正しいカードを投げよう。';

  @override
  String get sectionPlayers => 'プレイヤー';

  @override
  String get sectionRules => 'ルール';

  @override
  String get sectionScenarios => 'シナリオ';

  @override
  String get ruleTurnLimit => '第1ラウンドの制限時間';

  @override
  String get ruleFastThrow => 'ドローなしの速攻（上限）';

  @override
  String get ruleSteal => 'これより長い迷いで強奪';

  @override
  String get gameSpeed => 'ゲーム速度';

  @override
  String get play => 'プレイ';

  @override
  String get loadReplayFromClipboard => 'クリップボードからリプレイを読み込む';

  @override
  String get noReplayInClipboard => 'クリップボードにKittensのリプレイがありません';

  @override
  String get replayCopied => 'リプレイをクリップボードにコピーしました';

  @override
  String get replayTitle => 'リプレイ';

  @override
  String get seatYou => 'あなた';

  @override
  String botName(int number) {
    return 'ボット $number';
  }

  @override
  String get seatModeHuman => '人間';

  @override
  String get seatModeBot => 'ボット';

  @override
  String get seatModePaused => '一時停止';

  @override
  String reactionFixed(String duration) {
    return '反応 $duration';
  }

  @override
  String get reactionRandom => '反応はランダム';

  @override
  String get botIqSmart => '賢くプレイ';

  @override
  String get botIqFirstValid => '最初の有効手';

  @override
  String get botIqSloppy => '20%ミスする';

  @override
  String get colorRed => '赤';

  @override
  String get colorGreen => '緑';

  @override
  String get colorBlue => '青';

  @override
  String get colorYellow => '黄';

  @override
  String cardNumberLabel(String color, int number) {
    return '$colorの$number';
  }

  @override
  String get cardNumber => 'ノーマル';

  @override
  String get cardBomb => '爆弾';

  @override
  String get cardDefuse => '解除';

  @override
  String get cardDetonate => '起爆';

  @override
  String get cardNope => 'ノー！';

  @override
  String get cardShield => 'シールド';

  @override
  String get cardSteal => '強奪';

  @override
  String get cardTwist => '反転';

  @override
  String get cardBlind => 'ブラインド';

  @override
  String get rejectNotYourTurn => 'あなたの番ではありません';

  @override
  String get rejectCardNotInHand => 'このカードはもう持っていません';

  @override
  String get rejectInvalidTarget => 'このプレイヤーは対象にできません';

  @override
  String get rejectNotAReaction => 'このカードは山札に投げます';

  @override
  String get rejectGhost => 'ゴーストはノー！しか出せません';

  @override
  String get rejectNotGhost => 'カードなしのノー！はゴーストだけです';

  @override
  String get rejectGhostNopeUsed => 'ゴーストのノー！はこのラウンドで使用済みです';

  @override
  String get rejectGhostNeedsCard => 'ゴーストにはノー！のカードが必要です';

  @override
  String get rejectNothingToNope => '取り消すものがありません';

  @override
  String get rejectNoPendingLoss => 'シールドにはもう間に合いません';

  @override
  String get rejectOwnTurn => '自分の番は奪えません';

  @override
  String rejectTooEarly(String duration) {
    return '強奪できるのは$duration迷ってからです';
  }

  @override
  String get rejectGameOver => 'ゲームは終了しました';

  @override
  String get rejectOther => 'コマンドが拒否されました';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player：$card（$duration）';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player：$card（$duration）、$count枚ドロー';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player：$cardは無効';
  }

  @override
  String captionTimedOut(String player) {
    return '$player：時間切れ';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player：番を強奪（$victim）';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player：$cardにノー！';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player：ノー！は不発';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return '爆弾が浮上、導火線 $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return '爆弾が爆発：$player';
  }

  @override
  String captionDefused(String player) {
    return '$player：解除';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player：$targetに起爆';
  }

  @override
  String captionShield(String player) {
    return '$player：シールド';
  }

  @override
  String captionGhost(String player) {
    return '$playerはゴーストです';
  }

  @override
  String get hintDetonate => '起爆を、爆弾を受け取るプレイヤーにドラッグ';

  @override
  String get hintSteal => '強奪を、番のプレイヤーにドラッグ';

  @override
  String toastInvalidCard(int count) {
    return '無効なカード：ライフを1失い、$count枚ドロー';
  }

  @override
  String get toastTimeOut => '時間切れ';

  @override
  String toastShieldWindow(String duration) {
    return '$duration以内にシールド！';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player：あなたの番を強奪';
  }

  @override
  String toastBombOnYou(String player) {
    return '$playerがあなたに爆弾を送りました';
  }

  @override
  String get toastNopeReturns => 'ノー！で番があなたに戻ります';

  @override
  String get yourTurn => 'あなたの番';

  @override
  String onTurn(String player) {
    return '$playerの番';
  }

  @override
  String deckCount(int count) {
    return '山札 $count';
  }

  @override
  String ghostName(String name) {
    return '$name（ゴースト）';
  }

  @override
  String get ghostNope => 'ゴーストのノー！';

  @override
  String get startHelp =>
      '山札の上のラインを越えて、同じ色か数字のカードを投げます。ノー！とシールドは横へスワイプ、起爆と強奪はプレイヤーへドラッグ。';

  @override
  String get start => 'スタート';

  @override
  String get youWin => 'あなたの勝ち';

  @override
  String get nobodySurvived => '誰も生き残れなかった';

  @override
  String playerWins(String player) {
    return '$playerの勝ち';
  }

  @override
  String get playAgain => 'もう一度';

  @override
  String get copyReplay => 'リプレイをコピー';

  @override
  String get gameSettings => 'ゲーム設定';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: '爆弾、残り$fuseターン',
    );
    return '$_temp0';
  }

  @override
  String get resume => '再開';

  @override
  String get pause => '一時停止';

  @override
  String get debug => 'デバッグ';

  @override
  String get sectionTime => '時間';

  @override
  String get step => 'ステップ';

  @override
  String gameClock(String duration, int round) {
    return 'ゲーム時間 $duration、ラウンド $round';
  }

  @override
  String get artificialLatency => '疑似遅延';

  @override
  String get followTurn => '視点を番のプレイヤーに追従';

  @override
  String get followTurnHint => '人間が操作する席のみ';

  @override
  String get sectionForceCard => 'カードを強制';

  @override
  String get number => '数字';

  @override
  String get giveToHand => '手札に加える';

  @override
  String get setAsTarget => '対象に設定';

  @override
  String get sectionBombAndLimit => '爆弾と制限時間';

  @override
  String get noBomb => '爆弾なし';

  @override
  String fuseValue(int fuse) {
    return '導火線 $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '第1ラウンドの制限（現在 $duration）';
  }

  @override
  String get loadFromClipboard => 'クリップボードから読み込む';

  @override
  String get sectionEvents => 'イベント';

  @override
  String get endGame => 'ゲームを終了';

  @override
  String get removeLife => 'ライフを減らす';

  @override
  String get addLife => 'ライフを増やす';
}
