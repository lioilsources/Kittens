// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get tagline => '심지가 다 타기 전에 알맞은 카드를 던지세요.';

  @override
  String get sectionPlayers => '플레이어';

  @override
  String get sectionRules => '규칙';

  @override
  String get sectionScenarios => '시나리오';

  @override
  String get ruleTurnLimit => '1라운드 턴 제한';

  @override
  String get ruleFastThrow => '드로 없이 빠르게 던지기(최대)';

  @override
  String get ruleSteal => '이보다 오래 망설이면 훔치기';

  @override
  String get gameSpeed => '게임 속도';

  @override
  String get play => '플레이';

  @override
  String get loadReplayFromClipboard => '클립보드에서 리플레이 불러오기';

  @override
  String get noReplayInClipboard => '클립보드에 Kittens 리플레이가 없습니다';

  @override
  String get replayCopied => '리플레이가 클립보드에 있습니다';

  @override
  String get replayTitle => '리플레이';

  @override
  String get seatYou => '나';

  @override
  String botName(int number) {
    return '봇 $number';
  }

  @override
  String get seatModeHuman => '사람';

  @override
  String get seatModeBot => '봇';

  @override
  String get seatModePaused => '일시정지';

  @override
  String reactionFixed(String duration) {
    return '반응 $duration';
  }

  @override
  String get reactionRandom => '무작위 반응';

  @override
  String get botIqSmart => '똑똑하게 플레이';

  @override
  String get botIqFirstValid => '첫 번째 유효 카드';

  @override
  String get botIqSloppy => '20% 실수';

  @override
  String get colorRed => '빨강';

  @override
  String get colorGreen => '초록';

  @override
  String get colorBlue => '파랑';

  @override
  String get colorYellow => '노랑';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => '기본';

  @override
  String get cardBomb => '폭탄';

  @override
  String get cardDefuse => '해제';

  @override
  String get cardDetonate => '기폭';

  @override
  String get cardNope => '안 돼!';

  @override
  String get cardShield => '방패';

  @override
  String get cardSteal => '훔치기';

  @override
  String get cardTwist => '뒤집기';

  @override
  String get cardBlind => '블라인드';

  @override
  String get rejectNotYourTurn => '당신의 차례가 아닙니다';

  @override
  String get rejectCardNotInHand => '이 카드는 더 이상 없습니다';

  @override
  String get rejectInvalidTarget => '이 플레이어는 대상으로 지정할 수 없습니다';

  @override
  String get rejectNotAReaction => '이 카드는 덱에 던집니다';

  @override
  String get rejectGhost => '유령은 안 돼!만 낼 수 있습니다';

  @override
  String get rejectNotGhost => '카드 없는 안 돼!는 유령만 가능합니다';

  @override
  String get rejectGhostNopeUsed => '유령의 안 돼!는 이번 라운드에 이미 사용했습니다';

  @override
  String get rejectGhostNeedsCard => '유령에게는 안 돼! 카드가 필요합니다';

  @override
  String get rejectNothingToNope => '취소할 것이 없습니다';

  @override
  String get rejectNoPendingLoss => '방패를 쓰기엔 너무 늦었습니다';

  @override
  String get rejectOwnTurn => '자기 차례는 훔칠 수 없습니다';

  @override
  String rejectTooEarly(String duration) {
    return '$duration 동안 망설인 뒤에야 훔칠 수 있습니다';
  }

  @override
  String get rejectGameOver => '게임이 끝났습니다';

  @override
  String get rejectOther => '명령이 거부되었습니다';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card ($duration)';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card ($duration), $count장 드로';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card 무효';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: 시간 초과';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: 턴 훔치기 ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card에 안 돼!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: 안 돼! 불발';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return '폭탄이 떠올랐습니다, 심지 $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return '폭탄 폭발: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: 해제';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target에게 기폭';
  }

  @override
  String captionShield(String player) {
    return '$player: 방패';
  }

  @override
  String captionGhost(String player) {
    return '$player은(는) 유령입니다';
  }

  @override
  String get hintDetonate => '기폭을 폭탄을 받을 플레이어에게 끌어다 놓으세요';

  @override
  String get hintSteal => '훔치기를 현재 차례인 플레이어에게 끌어다 놓으세요';

  @override
  String toastInvalidCard(int count) {
    return '무효 카드: 목숨 1개를 잃고 $count장을 뽑습니다';
  }

  @override
  String get toastTimeOut => '시간 초과';

  @override
  String toastShieldWindow(String duration) {
    return '$duration 안에 방패!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: 당신의 차례를 훔쳤습니다';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player이(가) 당신에게 폭탄을 보냈습니다';
  }

  @override
  String get toastNopeReturns => '안 돼!로 차례가 당신에게 돌아옵니다';

  @override
  String get yourTurn => '당신의 차례';

  @override
  String onTurn(String player) {
    return '차례: $player';
  }

  @override
  String deckCount(int count) {
    return '덱 $count';
  }

  @override
  String ghostName(String name) {
    return '$name (유령)';
  }

  @override
  String get ghostNope => '유령의 안 돼!';

  @override
  String get startHelp =>
      '덱 위의 선을 넘겨 같은 색이나 숫자의 카드를 던지세요. 안 돼!와 방패는 옆으로 밀고, 기폭과 훔치기는 플레이어에게 끌어다 놓으세요.';

  @override
  String get start => '시작';

  @override
  String get youWin => '승리했습니다';

  @override
  String get nobodySurvived => '아무도 살아남지 못했습니다';

  @override
  String playerWins(String player) {
    return '$player 승리';
  }

  @override
  String get playAgain => '다시 하기';

  @override
  String get copyReplay => '리플레이 복사';

  @override
  String get gameSettings => '게임 설정';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: '폭탄, $fuse턴 남음',
    );
    return '$_temp0';
  }

  @override
  String get resume => '계속';

  @override
  String get pause => '일시정지';

  @override
  String get debug => '디버그';

  @override
  String get sectionTime => '시간';

  @override
  String get step => '단계';

  @override
  String gameClock(String duration, int round) {
    return '게임 시간 $duration, $round라운드';
  }

  @override
  String get artificialLatency => '인위적 지연';

  @override
  String get followTurn => '시점이 차례인 플레이어를 따라감';

  @override
  String get followTurnHint => '사람이 조작하는 자리만';

  @override
  String get sectionForceCard => '카드 강제';

  @override
  String get number => '숫자';

  @override
  String get giveToHand => '손패에 주기';

  @override
  String get setAsTarget => '대상으로 설정';

  @override
  String get sectionBombAndLimit => '폭탄과 턴 제한';

  @override
  String get noBomb => '폭탄 없음';

  @override
  String fuseValue(int fuse) {
    return '심지 $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '1라운드 제한 (현재 $duration)';
  }

  @override
  String get loadFromClipboard => '클립보드에서 불러오기';

  @override
  String get sectionEvents => '이벤트';

  @override
  String get endGame => '게임 종료';

  @override
  String get removeLife => '목숨 빼기';

  @override
  String get addLife => '목숨 더하기';
}
