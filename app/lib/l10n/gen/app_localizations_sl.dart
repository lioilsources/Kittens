// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get tagline => 'Vrzi pravo karto, preden vžigalna vrvica pogori.';

  @override
  String get sectionPlayers => 'Igralci';

  @override
  String get sectionRules => 'Pravila';

  @override
  String get sectionScenarios => 'Scenariji';

  @override
  String get ruleTurnLimit => 'Omejitev poteze v 1. krogu';

  @override
  String get ruleFastThrow => 'Hiter met brez vlečenja do';

  @override
  String get ruleSteal => 'Kraja po oklevanju, daljšem od';

  @override
  String get gameSpeed => 'Hitrost igre';

  @override
  String get play => 'Igraj';

  @override
  String get loadReplayFromClipboard => 'Naloži posnetek iz odložišča';

  @override
  String get noReplayInClipboard => 'V odložišču ni posnetka Kittens';

  @override
  String get replayCopied => 'Posnetek je kopiran v odložišče';

  @override
  String get replayTitle => 'Posnetek';

  @override
  String get seatYou => 'Ti';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Človek';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Premor';

  @override
  String reactionFixed(String duration) {
    return 'Odziv $duration';
  }

  @override
  String get reactionRandom => 'Naključen odziv';

  @override
  String get botIqSmart => 'Igra pametno';

  @override
  String get botIqFirstValid => 'Prva veljavna';

  @override
  String get botIqSloppy => 'Dela napake v 20 %';

  @override
  String get colorRed => 'rdeča';

  @override
  String get colorGreen => 'zelena';

  @override
  String get colorBlue => 'modra';

  @override
  String get colorYellow => 'rumena';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Osnovna';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Razoroži';

  @override
  String get cardDetonate => 'Sproži';

  @override
  String get cardNope => 'Ne!';

  @override
  String get cardShield => 'Ščit';

  @override
  String get cardSteal => 'Kraja';

  @override
  String get cardTwist => 'Obrni';

  @override
  String get cardBlind => 'Slepa';

  @override
  String get rejectNotYourTurn => 'Nisi na vrsti';

  @override
  String get rejectCardNotInHand => 'Te karte nimaš več';

  @override
  String get rejectInvalidTarget => 'Tega igralca ni mogoče izbrati';

  @override
  String get rejectNotAReaction => 'Ta karta se vrže na kupček';

  @override
  String get rejectGhost => 'Duh lahko igra le Ne!';

  @override
  String get rejectNotGhost => 'Ne! brez karte ima samo duh';

  @override
  String get rejectGhostNopeUsed => 'Duhov Ne! je v tem krogu že porabljen';

  @override
  String get rejectGhostNeedsCard => 'Duh potrebuje karto Ne!';

  @override
  String get rejectNothingToNope => 'Ni česa preklicati';

  @override
  String get rejectNoPendingLoss => 'Za ščit je prepozno';

  @override
  String get rejectOwnTurn => 'Lastne poteze ni mogoče ukrasti';

  @override
  String rejectTooEarly(String duration) {
    return 'Krasti je mogoče šele po $duration oklevanja';
  }

  @override
  String get rejectGameOver => 'Igra je končana';

  @override
  String get rejectOther => 'Ukaz zavrnjen';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card v $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card v $duration, vleče $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card ne velja';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: čas je potekel';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: kraja poteze ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Ne! na $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Ne! ni uspel';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomba se je pojavila, vrvica $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomba je eksplodirala: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Razoroži';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Sproži na $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Ščit';
  }

  @override
  String captionGhost(String player) {
    return '$player je duh';
  }

  @override
  String get hintDetonate => 'Povleci Sproži na igralca, ki dobi bombo';

  @override
  String get hintSteal => 'Povleci Krajo na igralca, ki je na potezi';

  @override
  String toastInvalidCard(int count) {
    return 'Neveljavna karta: izgubiš življenje in vlečeš $count';
  }

  @override
  String get toastTimeOut => 'Čas je potekel';

  @override
  String toastShieldWindow(String duration) {
    return 'Ščit v $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: kraja tvoje poteze';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ti je poslal bombo';
  }

  @override
  String get toastNopeReturns => 'Ne! vrne potezo tebi';

  @override
  String get yourTurn => 'Tvoja poteza';

  @override
  String onTurn(String player) {
    return 'Na potezi: $player';
  }

  @override
  String deckCount(int count) {
    return 'Kupček $count';
  }

  @override
  String ghostName(String name) {
    return '$name (duh)';
  }

  @override
  String get ghostNope => 'Duhov Ne!';

  @override
  String get startHelp =>
      'Vrzi karto iste barve ali številke čez črto nad kupčkom. Ne! in Ščit povleci vstran, Sproži in Krajo na igralca.';

  @override
  String get start => 'Začni';

  @override
  String get youWin => 'Zmagaš';

  @override
  String get nobodySurvived => 'Nihče ni preživel';

  @override
  String playerWins(String player) {
    return '$player zmaga';
  }

  @override
  String get playAgain => 'Igraj znova';

  @override
  String get copyReplay => 'Kopiraj posnetek';

  @override
  String get gameSettings => 'Nastavitve igre';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, ostalo je $fuse potez',
      few: 'Bomba, ostale so $fuse poteze',
      two: 'Bomba, ostali sta $fuse potezi',
      one: 'Bomba, ostala je $fuse poteza',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Nadaljuj';

  @override
  String get pause => 'Premor';

  @override
  String get debug => 'Razhroščevanje';

  @override
  String get sectionTime => 'Čas';

  @override
  String get step => 'Korak';

  @override
  String gameClock(String duration, int round) {
    return 'Čas igre $duration, krog $round';
  }

  @override
  String get artificialLatency => 'Umetna zakasnitev';

  @override
  String get followTurn => 'Pogled sledi igralcu na potezi';

  @override
  String get followTurnHint => 'Samo mesta, ki jih nadzoruje človek';

  @override
  String get sectionForceCard => 'Vsili karto';

  @override
  String get number => 'Številka';

  @override
  String get giveToHand => 'Daj v roko';

  @override
  String get setAsTarget => 'Nastavi kot cilj';

  @override
  String get sectionBombAndLimit => 'Bomba in omejitev poteze';

  @override
  String get noBomb => 'Brez bombe';

  @override
  String fuseValue(int fuse) {
    return 'Vrvica $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Omejitev v 1. krogu (zdaj $duration)';
  }

  @override
  String get loadFromClipboard => 'Naloži iz odložišča';

  @override
  String get sectionEvents => 'Dogodki';

  @override
  String get endGame => 'Končaj igro';

  @override
  String get removeLife => 'Odvzemi življenje';

  @override
  String get addLife => 'Dodaj življenje';
}
