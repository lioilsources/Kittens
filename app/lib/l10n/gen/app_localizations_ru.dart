// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get tagline => 'Брось нужную карту, пока не догорел фитиль.';

  @override
  String get sectionPlayers => 'Игроки';

  @override
  String get sectionRules => 'Правила';

  @override
  String get sectionScenarios => 'Сценарии';

  @override
  String get ruleTurnLimit => 'Лимит хода в 1-м раунде';

  @override
  String get ruleFastThrow => 'Быстрый бросок без добора до';

  @override
  String get ruleSteal => 'Кража после колебания дольше';

  @override
  String get gameSpeed => 'Скорость игры';

  @override
  String get play => 'Играть';

  @override
  String get loadReplayFromClipboard => 'Загрузить повтор из буфера';

  @override
  String get noReplayInClipboard => 'В буфере нет повтора Kittens';

  @override
  String get replayCopied => 'Повтор скопирован в буфер';

  @override
  String get replayTitle => 'Повтор';

  @override
  String get seatYou => 'Ты';

  @override
  String botName(int number) {
    return 'Бот $number';
  }

  @override
  String get seatModeHuman => 'Человек';

  @override
  String get seatModeBot => 'Бот';

  @override
  String get seatModePaused => 'Пауза';

  @override
  String reactionFixed(String duration) {
    return 'Реакция $duration';
  }

  @override
  String get reactionRandom => 'Случайная реакция';

  @override
  String get botIqSmart => 'Играет умно';

  @override
  String get botIqFirstValid => 'Первая подходящая';

  @override
  String get botIqSloppy => 'Ошибается в 20 %';

  @override
  String get colorRed => 'красная';

  @override
  String get colorGreen => 'зелёная';

  @override
  String get colorBlue => 'синяя';

  @override
  String get colorYellow => 'жёлтая';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Обычная';

  @override
  String get cardBomb => 'Бомба';

  @override
  String get cardDefuse => 'Обезвредь';

  @override
  String get cardDetonate => 'Взрыв';

  @override
  String get cardNope => 'Нет!';

  @override
  String get cardShield => 'Щит';

  @override
  String get cardSteal => 'Кража';

  @override
  String get cardTwist => 'Разворот';

  @override
  String get cardBlind => 'Слепая';

  @override
  String get rejectNotYourTurn => 'Сейчас не твой ход';

  @override
  String get rejectCardNotInHand => 'У тебя больше нет этой карты';

  @override
  String get rejectInvalidTarget => 'Этого игрока нельзя выбрать';

  @override
  String get rejectNotAReaction => 'Эту карту бросают на колоду';

  @override
  String get rejectGhost => 'Призрак может играть только Нет!';

  @override
  String get rejectNotGhost => 'Нет! без карты есть только у призрака';

  @override
  String get rejectGhostNopeUsed =>
      'Нет! призрака уже использовано в этом раунде';

  @override
  String get rejectGhostNeedsCard => 'Призраку нужна карта Нет!';

  @override
  String get rejectNothingToNope => 'Нечего отменять';

  @override
  String get rejectNoPendingLoss => 'Щит уже не успеть';

  @override
  String get rejectOwnTurn => 'Свой ход украсть нельзя';

  @override
  String rejectTooEarly(String duration) {
    return 'Красть можно только после колебания в $duration';
  }

  @override
  String get rejectGameOver => 'Игра окончена';

  @override
  String get rejectOther => 'Команда отклонена';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card за $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card за $duration, берёт $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card не подходит';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: время вышло';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: кража хода ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Нет! на $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Нет! не сработало';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Бомба всплыла, фитиль $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Бомба взорвалась: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Обезвредь';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Взрыв на $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Щит';
  }

  @override
  String captionGhost(String player) {
    return '$player — призрак';
  }

  @override
  String get hintDetonate => 'Перетащи Взрыв на игрока, который получит бомбу';

  @override
  String get hintSteal => 'Перетащи Кражу на игрока, чей сейчас ход';

  @override
  String toastInvalidCard(int count) {
    return 'Неверная карта: теряешь жизнь и берёшь $count';
  }

  @override
  String get toastTimeOut => 'Время вышло';

  @override
  String toastShieldWindow(String duration) {
    return 'Щит в течение $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: кража твоего хода';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player отправил бомбу тебе';
  }

  @override
  String get toastNopeReturns => 'Нет! возвращает ход тебе';

  @override
  String get yourTurn => 'Твой ход';

  @override
  String onTurn(String player) {
    return 'Ходит: $player';
  }

  @override
  String deckCount(int count) {
    return 'Колода $count';
  }

  @override
  String ghostName(String name) {
    return '$name (призрак)';
  }

  @override
  String get ghostNope => 'Нет! призрака';

  @override
  String get startHelp =>
      'Брось карту того же цвета или номера через линию над колодой. Нет! и Щит тяни в сторону, Взрыв и Кражу — на игрока.';

  @override
  String get start => 'Начать';

  @override
  String get youWin => 'Ты победил';

  @override
  String get nobodySurvived => 'Никто не выжил';

  @override
  String playerWins(String player) {
    return '$player побеждает';
  }

  @override
  String get playAgain => 'Играть снова';

  @override
  String get copyReplay => 'Копировать повтор';

  @override
  String get gameSettings => 'Настройки игры';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Бомба, осталось $fuse хода',
      many: 'Бомба, осталось $fuse ходов',
      few: 'Бомба, осталось $fuse хода',
      one: 'Бомба, остался $fuse ход',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Продолжить';

  @override
  String get pause => 'Пауза';

  @override
  String get debug => 'Отладка';

  @override
  String get sectionTime => 'Время';

  @override
  String get step => 'Шаг';

  @override
  String gameClock(String duration, int round) {
    return 'Время игры $duration, раунд $round';
  }

  @override
  String get artificialLatency => 'Искусственная задержка';

  @override
  String get followTurn => 'Вид следует за игроком, чей ход';

  @override
  String get followTurnHint => 'Только места, которыми управляет человек';

  @override
  String get sectionForceCard => 'Навязать карту';

  @override
  String get number => 'Номер';

  @override
  String get giveToHand => 'Дать в руку';

  @override
  String get setAsTarget => 'Назначить целью';

  @override
  String get sectionBombAndLimit => 'Бомба и лимит хода';

  @override
  String get noBomb => 'Без бомбы';

  @override
  String fuseValue(int fuse) {
    return 'Фитиль $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Лимит в 1-м раунде (сейчас $duration)';
  }

  @override
  String get loadFromClipboard => 'Загрузить из буфера';

  @override
  String get sectionEvents => 'События';

  @override
  String get endGame => 'Завершить игру';

  @override
  String get removeLife => 'Отнять жизнь';

  @override
  String get addLife => 'Добавить жизнь';
}
