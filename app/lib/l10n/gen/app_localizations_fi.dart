// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get tagline =>
      'Heitä oikea kortti ennen kuin sytytyslanka palaa loppuun.';

  @override
  String get sectionPlayers => 'Pelaajat';

  @override
  String get sectionRules => 'Säännöt';

  @override
  String get sectionScenarios => 'Skenaariot';

  @override
  String get ruleTurnLimit => 'Vuoron aikaraja 1. kierroksella';

  @override
  String get ruleFastThrow => 'Nopea heitto ilman nostoa enintään';

  @override
  String get ruleSteal => 'Varkaus, kun epäröinti kestää yli';

  @override
  String get gameSpeed => 'Pelin nopeus';

  @override
  String get play => 'Pelaa';

  @override
  String get loadReplayFromClipboard => 'Lataa uusinta leikepöydältä';

  @override
  String get noReplayInClipboard => 'Leikepöydällä ei ole Kittens-uusintaa';

  @override
  String get replayCopied => 'Uusinta kopioitu leikepöydälle';

  @override
  String get replayTitle => 'Uusinta';

  @override
  String get seatYou => 'Sinä';

  @override
  String botName(int number) {
    return 'Botti $number';
  }

  @override
  String get seatModeHuman => 'Ihminen';

  @override
  String get seatModeBot => 'Botti';

  @override
  String get seatModePaused => 'Tauko';

  @override
  String reactionFixed(String duration) {
    return 'Reaktio $duration';
  }

  @override
  String get reactionRandom => 'Satunnainen reaktio';

  @override
  String get botIqSmart => 'Pelaa fiksusti';

  @override
  String get botIqFirstValid => 'Ensimmäinen kelpaava';

  @override
  String get botIqSloppy => 'Erehtyy 20 %';

  @override
  String get colorRed => 'punainen';

  @override
  String get colorGreen => 'vihreä';

  @override
  String get colorBlue => 'sininen';

  @override
  String get colorYellow => 'keltainen';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Perus';

  @override
  String get cardBomb => 'Pommi';

  @override
  String get cardDefuse => 'Purku';

  @override
  String get cardDetonate => 'Sytytys';

  @override
  String get cardNope => 'Ei!';

  @override
  String get cardShield => 'Kilpi';

  @override
  String get cardSteal => 'Varkaus';

  @override
  String get cardTwist => 'Käännä';

  @override
  String get cardBlind => 'Sokea';

  @override
  String get rejectNotYourTurn => 'Ei ole sinun vuorosi';

  @override
  String get rejectCardNotInHand => 'Sinulla ei ole enää tätä korttia';

  @override
  String get rejectInvalidTarget => 'Tähän pelaajaan se ei käy';

  @override
  String get rejectNotAReaction => 'Tämä kortti heitetään pakkaan';

  @override
  String get rejectGhost => 'Haamu voi pelata vain Ei!-kortin';

  @override
  String get rejectNotGhost => 'Vain haamulla on Ei! ilman korttia';

  @override
  String get rejectGhostNopeUsed =>
      'Haamun Ei! on jo käytetty tällä kierroksella';

  @override
  String get rejectGhostNeedsCard => 'Haamu tarvitsee Ei!-kortin';

  @override
  String get rejectNothingToNope => 'Ei mitään peruttavaa';

  @override
  String get rejectNoPendingLoss => 'Liian myöhäistä Kilvelle';

  @override
  String get rejectOwnTurn => 'Omaa vuoroa ei voi varastaa';

  @override
  String rejectTooEarly(String duration) {
    return 'Varastaa voi vasta $duration epäröinnin jälkeen';
  }

  @override
  String get rejectGameOver => 'Peli on päättynyt';

  @override
  String get rejectOther => 'Komento hylättiin';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card ajassa $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card ajassa $duration, nostaa $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card ei kelpaa';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: aika loppui';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: varasti vuoron ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Ei! kortille $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Ei! raukesi';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Pommi tuli esiin, sytytyslanka $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Pommi räjähti: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Purku';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Sytytys pelaajalle $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Kilpi';
  }

  @override
  String captionGhost(String player) {
    return '$player on haamu';
  }

  @override
  String get hintDetonate => 'Vedä Sytytys pelaajalle, joka saa pommin';

  @override
  String get hintSteal => 'Vedä Varkaus pelaajalle, jonka vuoro on';

  @override
  String toastInvalidCard(int count) {
    return 'Virheellinen kortti: menetät elämän ja nostat $count';
  }

  @override
  String get toastTimeOut => 'Aika loppui';

  @override
  String toastShieldWindow(String duration) {
    return 'Kilpi $duration sisällä!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player varasti vuorosi';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player sytytti pommin sinulle';
  }

  @override
  String get toastNopeReturns => 'Ei! palauttaa vuoron sinulle';

  @override
  String get yourTurn => 'Sinun vuorosi';

  @override
  String onTurn(String player) {
    return 'Vuorossa: $player';
  }

  @override
  String deckCount(int count) {
    return 'Pakka $count';
  }

  @override
  String ghostName(String name) {
    return '$name (haamu)';
  }

  @override
  String get ghostNope => 'Haamun Ei!';

  @override
  String get startHelp =>
      'Heitä samanvärinen tai samanlukuinen kortti pakan yläpuolella olevan viivan yli. Pyyhkäise Ei! ja Kilpi sivuun, vedä Sytytys ja Varkaus pelaajalle.';

  @override
  String get start => 'Aloita';

  @override
  String get youWin => 'Voitit';

  @override
  String get nobodySurvived => 'Kukaan ei selvinnyt';

  @override
  String playerWins(String player) {
    return '$player voittaa';
  }

  @override
  String get playAgain => 'Pelaa uudelleen';

  @override
  String get copyReplay => 'Kopioi uusinta';

  @override
  String get gameSettings => 'Pelin asetukset';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Pommi, $fuse vuoroa jäljellä',
      one: 'Pommi, $fuse vuoro jäljellä',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Jatka';

  @override
  String get pause => 'Tauko';

  @override
  String get debug => 'Virheenjäljitys';

  @override
  String get sectionTime => 'Aika';

  @override
  String get step => 'Askel';

  @override
  String gameClock(String duration, int round) {
    return 'Peliaika $duration, kierros $round';
  }

  @override
  String get artificialLatency => 'Keinotekoinen viive';

  @override
  String get followTurn => 'Näkymä seuraa vuorossa olevaa pelaajaa';

  @override
  String get followTurnHint => 'Vain ihmisen ohjaamat paikat';

  @override
  String get sectionForceCard => 'Pakota kortti';

  @override
  String get number => 'Numero';

  @override
  String get giveToHand => 'Anna käteen';

  @override
  String get setAsTarget => 'Aseta kohteeksi';

  @override
  String get sectionBombAndLimit => 'Pommi ja vuoron aikaraja';

  @override
  String get noBomb => 'Ei pommia';

  @override
  String fuseValue(int fuse) {
    return 'Sytytyslanka $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Aikaraja 1. kierroksella (nyt $duration)';
  }

  @override
  String get loadFromClipboard => 'Lataa leikepöydältä';

  @override
  String get sectionEvents => 'Tapahtumat';

  @override
  String get endGame => 'Lopeta peli';

  @override
  String get removeLife => 'Vähennä elämä';

  @override
  String get addLife => 'Lisää elämä';
}
