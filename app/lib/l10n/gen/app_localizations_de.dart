// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get tagline => 'Wirf die richtige Karte, bevor die Lunte abbrennt.';

  @override
  String get sectionPlayers => 'Spieler';

  @override
  String get sectionRules => 'Regeln';

  @override
  String get sectionScenarios => 'Szenarien';

  @override
  String get ruleTurnLimit => 'Zuglimit in Runde 1';

  @override
  String get ruleFastThrow => 'Schneller Wurf ohne Nachziehen bis';

  @override
  String get ruleSteal => 'Klauen nach Zögern länger als';

  @override
  String get gameSpeed => 'Spieltempo';

  @override
  String get play => 'Spielen';

  @override
  String get loadReplayFromClipboard => 'Replay aus der Zwischenablage laden';

  @override
  String get noReplayInClipboard => 'Kein Kittens-Replay in der Zwischenablage';

  @override
  String get replayCopied => 'Replay in die Zwischenablage kopiert';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Du';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Mensch';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pause';

  @override
  String reactionFixed(String duration) {
    return 'Reaktion $duration';
  }

  @override
  String get reactionRandom => 'Zufällige Reaktion';

  @override
  String get botIqSmart => 'Spielt clever';

  @override
  String get botIqFirstValid => 'Erste gültige';

  @override
  String get botIqSloppy => 'Irrt sich zu 20 %';

  @override
  String get colorRed => 'Rot';

  @override
  String get colorGreen => 'Grün';

  @override
  String get colorBlue => 'Blau';

  @override
  String get colorYellow => 'Gelb';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Basis';

  @override
  String get cardBomb => 'Bombe';

  @override
  String get cardDefuse => 'Entschärfen';

  @override
  String get cardDetonate => 'Zünden';

  @override
  String get cardNope => 'Nö!';

  @override
  String get cardShield => 'Schild';

  @override
  String get cardSteal => 'Klauen';

  @override
  String get cardTwist => 'Drehen';

  @override
  String get cardBlind => 'Blind';

  @override
  String get rejectNotYourTurn => 'Du bist nicht am Zug';

  @override
  String get rejectCardNotInHand => 'Diese Karte hast du nicht mehr';

  @override
  String get rejectInvalidTarget => 'Bei diesem Spieler geht das nicht';

  @override
  String get rejectNotAReaction => 'Diese Karte wird auf den Stapel geworfen';

  @override
  String get rejectGhost => 'Ein Geist kann nur Nö! spielen';

  @override
  String get rejectNotGhost => 'Nö! ohne Karte hat nur ein Geist';

  @override
  String get rejectGhostNopeUsed =>
      'Das Nö! des Geistes ist in dieser Runde schon verbraucht';

  @override
  String get rejectGhostNeedsCard => 'Der Geist braucht eine Nö!-Karte';

  @override
  String get rejectNothingToNope => 'Nichts zum Aufheben';

  @override
  String get rejectNoPendingLoss => 'Für den Schild ist es zu spät';

  @override
  String get rejectOwnTurn => 'Den eigenen Zug kannst du nicht klauen';

  @override
  String rejectTooEarly(String duration) {
    return 'Klauen geht erst nach $duration Zögern';
  }

  @override
  String get rejectGameOver => 'Das Spiel ist vorbei';

  @override
  String get rejectOther => 'Befehl abgelehnt';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card in $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card in $duration, zieht $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card zählt nicht';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: Zeit abgelaufen';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: Zug geklaut ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nö! auf $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nö! verpufft';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Die Bombe ist aufgetaucht, Lunte $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Die Bombe ist explodiert: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Entschärfen';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Zünden auf $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Schild';
  }

  @override
  String captionGhost(String player) {
    return '$player ist ein Geist';
  }

  @override
  String get hintDetonate =>
      'Zieh Zünden auf den Spieler, der die Bombe bekommt';

  @override
  String get hintSteal => 'Zieh Klauen auf den Spieler, der am Zug ist';

  @override
  String toastInvalidCard(int count) {
    return 'Ungültige Karte: Du verlierst ein Leben und ziehst $count';
  }

  @override
  String get toastTimeOut => 'Zeit abgelaufen';

  @override
  String toastShieldWindow(String duration) {
    return 'Schild innerhalb von $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player hat deinen Zug geklaut';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player hat die Bombe auf dich gezündet';
  }

  @override
  String get toastNopeReturns => 'Nö! gibt dir den Zug zurück';

  @override
  String get yourTurn => 'Du bist am Zug';

  @override
  String onTurn(String player) {
    return 'Am Zug: $player';
  }

  @override
  String deckCount(int count) {
    return 'Stapel $count';
  }

  @override
  String ghostName(String name) {
    return '$name (Geist)';
  }

  @override
  String get ghostNope => 'Geister-Nö!';

  @override
  String get startHelp =>
      'Wirf eine Karte mit gleicher Farbe oder Zahl über die Linie über dem Stapel. Wische Nö! und Schild zur Seite, zieh Zünden und Klauen auf einen Spieler.';

  @override
  String get start => 'Los';

  @override
  String get youWin => 'Du gewinnst';

  @override
  String get nobodySurvived => 'Niemand hat überlebt';

  @override
  String playerWins(String player) {
    return '$player gewinnt';
  }

  @override
  String get playAgain => 'Nochmal spielen';

  @override
  String get copyReplay => 'Replay kopieren';

  @override
  String get gameSettings => 'Spieleinstellungen';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bombe, noch $fuse Züge',
      one: 'Bombe, noch $fuse Zug',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Fortsetzen';

  @override
  String get pause => 'Pausieren';

  @override
  String get debug => 'Debug';

  @override
  String get sectionTime => 'Zeit';

  @override
  String get step => 'Schritt';

  @override
  String gameClock(String duration, int round) {
    return 'Spielzeit $duration, Runde $round';
  }

  @override
  String get artificialLatency => 'Künstliche Latenz';

  @override
  String get followTurn => 'Ansicht folgt dem Spieler am Zug';

  @override
  String get followTurnHint => 'Nur von Menschen gesteuerte Plätze';

  @override
  String get sectionForceCard => 'Karte erzwingen';

  @override
  String get number => 'Zahl';

  @override
  String get giveToHand => 'Auf die Hand geben';

  @override
  String get setAsTarget => 'Als Zielkarte setzen';

  @override
  String get sectionBombAndLimit => 'Bombe und Zuglimit';

  @override
  String get noBomb => 'Keine Bombe';

  @override
  String fuseValue(int fuse) {
    return 'Lunte $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limit in Runde 1 (jetzt $duration)';
  }

  @override
  String get loadFromClipboard => 'Aus der Zwischenablage laden';

  @override
  String get sectionEvents => 'Ereignisse';

  @override
  String get endGame => 'Spiel beenden';

  @override
  String get removeLife => 'Leben abziehen';

  @override
  String get addLife => 'Leben hinzufügen';
}
