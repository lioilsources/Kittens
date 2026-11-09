// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get tagline => 'Hoď správnu kartu skôr, než dohorí knôt.';

  @override
  String get sectionPlayers => 'Hráči';

  @override
  String get sectionRules => 'Pravidlá';

  @override
  String get sectionScenarios => 'Scenáre';

  @override
  String get ruleTurnLimit => 'Limit ťahu v 1. kole';

  @override
  String get ruleFastThrow => 'Rýchly hod bez ťahania do';

  @override
  String get ruleSteal => 'Krádež po váhaní dlhšom ako';

  @override
  String get gameSpeed => 'Rýchlosť hry';

  @override
  String get play => 'Hrať';

  @override
  String get loadReplayFromClipboard => 'Načítať záznam zo schránky';

  @override
  String get noReplayInClipboard => 'V schránke nie je záznam Kittens';

  @override
  String get replayCopied => 'Záznam je v schránke';

  @override
  String get replayTitle => 'Záznam';

  @override
  String get seatYou => 'Ty';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Človek';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pauza';

  @override
  String reactionFixed(String duration) {
    return 'Reakcia $duration';
  }

  @override
  String get reactionRandom => 'Reakcia náhodne';

  @override
  String get botIqSmart => 'Hrá múdro';

  @override
  String get botIqFirstValid => 'Prvá platná';

  @override
  String get botIqSloppy => 'Chybuje 20 %';

  @override
  String get colorRed => 'červená';

  @override
  String get colorGreen => 'zelená';

  @override
  String get colorBlue => 'modrá';

  @override
  String get colorYellow => 'žltá';

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
  String get cardDetonate => 'Odpáľ';

  @override
  String get cardNope => 'Nie!';

  @override
  String get cardShield => 'Štít';

  @override
  String get cardSteal => 'Krádež';

  @override
  String get cardTwist => 'Otoč';

  @override
  String get cardBlind => 'Slepá';

  @override
  String get rejectNotYourTurn => 'Nie si na ťahu';

  @override
  String get rejectCardNotInHand => 'Túto kartu už nemáš';

  @override
  String get rejectInvalidTarget => 'Na tohto hráča to nejde';

  @override
  String get rejectNotAReaction => 'Táto karta sa hádže na balíček';

  @override
  String get rejectGhost => 'Duch môže hrať len Nie!';

  @override
  String get rejectNotGhost => 'Nie! bez karty má len duch';

  @override
  String get rejectGhostNopeUsed => 'Nie! ducha už v tomto kole padlo';

  @override
  String get rejectGhostNeedsCard => 'Duch potrebuje kartu Nie!';

  @override
  String get rejectNothingToNope => 'Nie je čo zrušiť';

  @override
  String get rejectNoPendingLoss => 'Štít už nestihneš';

  @override
  String get rejectOwnTurn => 'Svoj vlastný ťah ukradnúť nejde';

  @override
  String rejectTooEarly(String duration) {
    return 'Kradnúť ide až po $duration váhania';
  }

  @override
  String get rejectGameOver => 'Hra skončila';

  @override
  String get rejectOther => 'Príkaz odmietnutý';

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
    return '$player: $card za $duration, berie $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card neplatí';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: čas vypršal';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: Krádež ťahu ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nie! na $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nie! zlyhalo';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomba sa vynorila, knôt $fuse';
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
    return '$player: Odpáľ na $target';
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
  String get hintDetonate => 'Odpáľ presuň na hráča, ktorý dostane bombu';

  @override
  String get hintSteal => 'Krádež presuň na hráča, ktorý je na ťahu';

  @override
  String toastInvalidCard(int count) {
    return 'Neplatná karta: prídeš o život a berieš $count';
  }

  @override
  String get toastTimeOut => 'Čas vypršal';

  @override
  String toastShieldWindow(String duration) {
    return 'Štít do $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: Krádež tvojho ťahu';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player na teba odpálil bombu';
  }

  @override
  String get toastNopeReturns => 'Nie! vracia ťah k tebe';

  @override
  String get yourTurn => 'Tvoj ťah';

  @override
  String onTurn(String player) {
    return 'Na ťahu: $player';
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
  String get ghostNope => 'Nie! ducha';

  @override
  String get startHelp =>
      'Hoď kartu rovnakej farby alebo čísla cez čiaru nad balíčkom. Nie! a Štít ťahaj nabok, Odpáľ a Krádež na hráča.';

  @override
  String get start => 'Začať';

  @override
  String get youWin => 'Vyhrávaš';

  @override
  String get nobodySurvived => 'Nikto neprežil';

  @override
  String playerWins(String player) {
    return '$player vyhráva';
  }

  @override
  String get playAgain => 'Hrať znova';

  @override
  String get copyReplay => 'Kopírovať záznam';

  @override
  String get gameSettings => 'Nastavenia hry';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, ostáva $fuse ťahov',
      many: 'Bomba, ostáva $fuse ťahu',
      few: 'Bomba, ostávajú $fuse ťahy',
      one: 'Bomba, ostáva $fuse ťah',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Pokračovať';

  @override
  String get pause => 'Pozastaviť';

  @override
  String get debug => 'Ladenie';

  @override
  String get sectionTime => 'Čas';

  @override
  String get step => 'Krok';

  @override
  String gameClock(String duration, int round) {
    return 'Herný čas $duration, kolo $round';
  }

  @override
  String get artificialLatency => 'Umelá latencia';

  @override
  String get followTurn => 'Pohľad sleduje hráča na ťahu';

  @override
  String get followTurnHint => 'Iba miesta ovládané človekom';

  @override
  String get sectionForceCard => 'Vnútiť kartu';

  @override
  String get number => 'Číslo';

  @override
  String get giveToHand => 'Dať do ruky';

  @override
  String get setAsTarget => 'Nastaviť ako cieľ';

  @override
  String get sectionBombAndLimit => 'Bomba a limit ťahu';

  @override
  String get noBomb => 'Bez bomby';

  @override
  String fuseValue(int fuse) {
    return 'Knôt $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limit v 1. kole (teraz $duration)';
  }

  @override
  String get loadFromClipboard => 'Načítať zo schránky';

  @override
  String get sectionEvents => 'Udalosti';

  @override
  String get endGame => 'Ukončiť hru';

  @override
  String get removeLife => 'Uberať život';

  @override
  String get addLife => 'Pridať život';
}
