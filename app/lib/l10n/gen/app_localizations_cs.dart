// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get tagline => 'Hoď správnou kartu dřív, než dohoří doutnák.';

  @override
  String get sectionPlayers => 'Hráči';

  @override
  String get sectionRules => 'Pravidla';

  @override
  String get sectionScenarios => 'Scénáře';

  @override
  String get ruleTurnLimit => 'Limit tahu v 1. kole';

  @override
  String get ruleFastThrow => 'Rychlý hod bez dobírání do';

  @override
  String get ruleSteal => 'Kradež po váhání delším než';

  @override
  String get gameSpeed => 'Rychlost hry';

  @override
  String get play => 'Hrát';

  @override
  String get loadReplayFromClipboard => 'Načíst replay ze schránky';

  @override
  String get noReplayInClipboard => 'Ve schránce není replay Kittens';

  @override
  String get replayCopied => 'Replay je ve schránce';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Ty';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Člověk';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pauza';

  @override
  String reactionFixed(String duration) {
    return 'Reakce $duration';
  }

  @override
  String get reactionRandom => 'Reakce náhodně';

  @override
  String get botIqSmart => 'Hraje chytře';

  @override
  String get botIqFirstValid => 'První platná';

  @override
  String get botIqSloppy => 'Chybuje 20 %';

  @override
  String get colorRed => 'červená';

  @override
  String get colorGreen => 'zelená';

  @override
  String get colorBlue => 'modrá';

  @override
  String get colorYellow => 'žlutá';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Základ';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Zneškodni';

  @override
  String get cardDetonate => 'Odpal';

  @override
  String get cardNope => 'Ne!';

  @override
  String get cardShield => 'Štít';

  @override
  String get cardSteal => 'Kradež';

  @override
  String get cardTwist => 'Otoč';

  @override
  String get cardBlind => 'Slepá';

  @override
  String get rejectNotYourTurn => 'Nejsi na tahu';

  @override
  String get rejectCardNotInHand => 'Tuhle kartu už nemáš';

  @override
  String get rejectInvalidTarget => 'Na tohoto hráče to nejde';

  @override
  String get rejectNotAReaction => 'Tahle karta se hází na balíček';

  @override
  String get rejectGhost => 'Duch může hrát jen Ne!';

  @override
  String get rejectNotGhost => 'Ne! bez karty má jen duch';

  @override
  String get rejectGhostNopeUsed => 'Ne! ducha už v tomhle kole padlo';

  @override
  String get rejectGhostNeedsCard => 'Duch potřebuje kartu Ne!';

  @override
  String get rejectNothingToNope => 'Není co zrušit';

  @override
  String get rejectNoPendingLoss => 'Štít už nestihneš';

  @override
  String get rejectOwnTurn => 'Svůj vlastní tah ukrást nejde';

  @override
  String rejectTooEarly(String duration) {
    return 'Krást jde až po $duration váhání';
  }

  @override
  String get rejectGameOver => 'Hra skončila';

  @override
  String get rejectOther => 'Příkaz odmítnut';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card za $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card za $duration, bere $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card neplatí';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: čas vypršel';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: Kradež tahu ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Ne! na $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Ne! propadlo';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomba se vynořila, doutnák $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomba vybuchla: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Zneškodni';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Odpal na $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Štít';
  }

  @override
  String captionGhost(String player) {
    return '$player je duch';
  }

  @override
  String get hintDetonate => 'Odpal přetáhni na hráče, který dostane bombu';

  @override
  String get hintSteal => 'Kradež přetáhni na hráče, který je na tahu';

  @override
  String toastInvalidCard(int count) {
    return 'Neplatná karta: přijdeš o život a bereš $count';
  }

  @override
  String get toastTimeOut => 'Čas vypršel';

  @override
  String toastShieldWindow(String duration) {
    return 'Štít do $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: Kradež tvého tahu';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player na tebe odpálil bombu';
  }

  @override
  String get toastNopeReturns => 'Ne! vrací tah k tobě';

  @override
  String get yourTurn => 'Tvůj tah';

  @override
  String onTurn(String player) {
    return 'Na tahu: $player';
  }

  @override
  String deckCount(int count) {
    return 'Balíček $count';
  }

  @override
  String ghostName(String name) {
    return '$name (duch)';
  }

  @override
  String get ghostNope => 'Ne! ducha';

  @override
  String get startHelp =>
      'Hoď kartu stejné barvy nebo čísla přes čáru nad balíčkem. Ne! a Štít táhni do strany, Odpal a Kradež na hráče.';

  @override
  String get start => 'Začít';

  @override
  String get youWin => 'Vyhráváš';

  @override
  String get nobodySurvived => 'Nikdo nepřežil';

  @override
  String playerWins(String player) {
    return '$player vyhrává';
  }

  @override
  String get playAgain => 'Hrát znovu';

  @override
  String get copyReplay => 'Kopírovat replay';

  @override
  String get gameSettings => 'Nastavení hry';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, zbývá $fuse tahů',
      many: 'Bomba, zbývá $fuse tahu',
      few: 'Bomba, zbývají $fuse tahy',
      one: 'Bomba, zbývá $fuse tah',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Pokračovat';

  @override
  String get pause => 'Pozastavit';

  @override
  String get debug => 'Ladění';

  @override
  String get sectionTime => 'Čas';

  @override
  String get step => 'Krok';

  @override
  String gameClock(String duration, int round) {
    return 'Herní čas $duration, kolo $round';
  }

  @override
  String get artificialLatency => 'Umělá latence';

  @override
  String get followTurn => 'Pohled sleduje hráče na tahu';

  @override
  String get followTurnHint => 'Jen místa ovládaná člověkem';

  @override
  String get sectionForceCard => 'Vnutit kartu';

  @override
  String get number => 'Číslo';

  @override
  String get giveToHand => 'Dát do ruky';

  @override
  String get setAsTarget => 'Nastavit jako cíl';

  @override
  String get sectionBombAndLimit => 'Bomba a limit tahu';

  @override
  String get noBomb => 'Bez bomby';

  @override
  String fuseValue(int fuse) {
    return 'Doutnák $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limit v 1. kole (teď $duration)';
  }

  @override
  String get loadFromClipboard => 'Načíst ze schránky';

  @override
  String get sectionEvents => 'Události';

  @override
  String get endGame => 'Ukončit hru';

  @override
  String get removeLife => 'Ubrat život';

  @override
  String get addLife => 'Přidat život';
}
