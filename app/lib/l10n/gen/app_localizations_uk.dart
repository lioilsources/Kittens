// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get tagline => 'Кинь потрібну карту, поки не догорів гніт.';

  @override
  String get sectionPlayers => 'Гравці';

  @override
  String get sectionRules => 'Правила';

  @override
  String get sectionScenarios => 'Сценарії';

  @override
  String get ruleTurnLimit => 'Ліміт ходу в 1-му раунді';

  @override
  String get ruleFastThrow => 'Швидкий кидок без добору до';

  @override
  String get ruleSteal => 'Крадіжка після вагання довшого за';

  @override
  String get gameSpeed => 'Швидкість гри';

  @override
  String get play => 'Грати';

  @override
  String get loadReplayFromClipboard => 'Завантажити повтор з буфера';

  @override
  String get noReplayInClipboard => 'У буфері немає повтору Kittens';

  @override
  String get replayCopied => 'Повтор скопійовано в буфер';

  @override
  String get replayTitle => 'Повтор';

  @override
  String get seatYou => 'Ти';

  @override
  String botName(int number) {
    return 'Бот $number';
  }

  @override
  String get seatModeHuman => 'Людина';

  @override
  String get seatModeBot => 'Бот';

  @override
  String get seatModePaused => 'Пауза';

  @override
  String reactionFixed(String duration) {
    return 'Реакція $duration';
  }

  @override
  String get reactionRandom => 'Випадкова реакція';

  @override
  String get botIqSmart => 'Грає розумно';

  @override
  String get botIqFirstValid => 'Перша придатна';

  @override
  String get botIqSloppy => 'Помиляється у 20 %';

  @override
  String get colorRed => 'червона';

  @override
  String get colorGreen => 'зелена';

  @override
  String get colorBlue => 'синя';

  @override
  String get colorYellow => 'жовта';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Звичайна';

  @override
  String get cardBomb => 'Бомба';

  @override
  String get cardDefuse => 'Знешкодь';

  @override
  String get cardDetonate => 'Вибух';

  @override
  String get cardNope => 'Ні!';

  @override
  String get cardShield => 'Щит';

  @override
  String get cardSteal => 'Крадіжка';

  @override
  String get cardTwist => 'Розворот';

  @override
  String get cardBlind => 'Сліпа';

  @override
  String get rejectNotYourTurn => 'Зараз не твій хід';

  @override
  String get rejectCardNotInHand => 'У тебе вже немає цієї карти';

  @override
  String get rejectInvalidTarget => 'Цього гравця не можна вибрати';

  @override
  String get rejectNotAReaction => 'Цю карту кидають на колоду';

  @override
  String get rejectGhost => 'Привид може грати лише Ні!';

  @override
  String get rejectNotGhost => 'Ні! без карти є лише в привида';

  @override
  String get rejectGhostNopeUsed =>
      'Ні! привида вже використано в цьому раунді';

  @override
  String get rejectGhostNeedsCard => 'Привиду потрібна карта Ні!';

  @override
  String get rejectNothingToNope => 'Нічого скасовувати';

  @override
  String get rejectNoPendingLoss => 'Щит уже не встигнути';

  @override
  String get rejectOwnTurn => 'Власний хід украсти не можна';

  @override
  String rejectTooEarly(String duration) {
    return 'Красти можна лише після вагання в $duration';
  }

  @override
  String get rejectGameOver => 'Гру закінчено';

  @override
  String get rejectOther => 'Команду відхилено';

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
    return '$player: $card за $duration, бере $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card не підходить';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: час вийшов';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: крадіжка ходу ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Ні! на $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Ні! не спрацювало';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Бомба сплила, гніт $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Бомба вибухнула: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Знешкодь';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Вибух на $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Щит';
  }

  @override
  String captionGhost(String player) {
    return '$player — привид';
  }

  @override
  String get hintDetonate => 'Перетягни Вибух на гравця, який отримає бомбу';

  @override
  String get hintSteal => 'Перетягни Крадіжку на гравця, чий зараз хід';

  @override
  String toastInvalidCard(int count) {
    return 'Неправильна карта: втрачаєш життя й береш $count';
  }

  @override
  String get toastTimeOut => 'Час вийшов';

  @override
  String toastShieldWindow(String duration) {
    return 'Щит протягом $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: крадіжка твого ходу';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player відправив бомбу тобі';
  }

  @override
  String get toastNopeReturns => 'Ні! повертає хід тобі';

  @override
  String get yourTurn => 'Твій хід';

  @override
  String onTurn(String player) {
    return 'Ходить: $player';
  }

  @override
  String deckCount(int count) {
    return 'Колода $count';
  }

  @override
  String ghostName(String name) {
    return '$name (привид)';
  }

  @override
  String get ghostNope => 'Ні! привида';

  @override
  String get startHelp =>
      'Кинь карту того самого кольору чи номера через лінію над колодою. Ні! та Щит тягни вбік, Вибух і Крадіжку — на гравця.';

  @override
  String get start => 'Почати';

  @override
  String get youWin => 'Ти переміг';

  @override
  String get nobodySurvived => 'Ніхто не вижив';

  @override
  String playerWins(String player) {
    return '$player перемагає';
  }

  @override
  String get playAgain => 'Грати знову';

  @override
  String get copyReplay => 'Копіювати повтор';

  @override
  String get gameSettings => 'Налаштування гри';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Бомба, залишиться $fuse ходу',
      many: 'Бомба, залишилося $fuse ходів',
      few: 'Бомба, залишилося $fuse ходи',
      one: 'Бомба, залишився $fuse хід',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Продовжити';

  @override
  String get pause => 'Пауза';

  @override
  String get debug => 'Налагодження';

  @override
  String get sectionTime => 'Час';

  @override
  String get step => 'Крок';

  @override
  String gameClock(String duration, int round) {
    return 'Час гри $duration, раунд $round';
  }

  @override
  String get artificialLatency => 'Штучна затримка';

  @override
  String get followTurn => 'Вигляд слідує за гравцем, чий хід';

  @override
  String get followTurnHint => 'Лише місця, якими керує людина';

  @override
  String get sectionForceCard => 'Нав’язати карту';

  @override
  String get number => 'Номер';

  @override
  String get giveToHand => 'Дати в руку';

  @override
  String get setAsTarget => 'Призначити ціллю';

  @override
  String get sectionBombAndLimit => 'Бомба й ліміт ходу';

  @override
  String get noBomb => 'Без бомби';

  @override
  String fuseValue(int fuse) {
    return 'Гніт $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Ліміт у 1-му раунді (зараз $duration)';
  }

  @override
  String get loadFromClipboard => 'Завантажити з буфера';

  @override
  String get sectionEvents => 'Події';

  @override
  String get endGame => 'Завершити гру';

  @override
  String get removeLife => 'Забрати життя';

  @override
  String get addLife => 'Додати життя';
}
