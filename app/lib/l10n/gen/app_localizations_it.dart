// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get tagline =>
      'Lancia la carta giusta prima che la miccia si consumi.';

  @override
  String get sectionPlayers => 'Giocatori';

  @override
  String get sectionRules => 'Regole';

  @override
  String get sectionScenarios => 'Scenari';

  @override
  String get ruleTurnLimit => 'Limite del turno nel 1° giro';

  @override
  String get ruleFastThrow => 'Lancio rapido senza pescare fino a';

  @override
  String get ruleSteal => 'Furto dopo un’esitazione di oltre';

  @override
  String get gameSpeed => 'Velocità di gioco';

  @override
  String get play => 'Gioca';

  @override
  String get loadReplayFromClipboard => 'Carica replay dagli appunti';

  @override
  String get noReplayInClipboard =>
      'Negli appunti non c’è un replay di Kittens';

  @override
  String get replayCopied => 'Replay copiato negli appunti';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Tu';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Umano';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pausa';

  @override
  String reactionFixed(String duration) {
    return 'Reazione $duration';
  }

  @override
  String get reactionRandom => 'Reazione casuale';

  @override
  String get botIqSmart => 'Gioca d’astuzia';

  @override
  String get botIqFirstValid => 'Prima valida';

  @override
  String get botIqSloppy => 'Sbaglia il 20%';

  @override
  String get colorRed => 'rosso';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'blu';

  @override
  String get colorYellow => 'giallo';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Base';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Disinnesca';

  @override
  String get cardDetonate => 'Innesca';

  @override
  String get cardNope => 'No!';

  @override
  String get cardShield => 'Scudo';

  @override
  String get cardSteal => 'Furto';

  @override
  String get cardTwist => 'Gira';

  @override
  String get cardBlind => 'Cieca';

  @override
  String get rejectNotYourTurn => 'Non è il tuo turno';

  @override
  String get rejectCardNotInHand => 'Non hai più questa carta';

  @override
  String get rejectInvalidTarget => 'Non si può su questo giocatore';

  @override
  String get rejectNotAReaction => 'Questa carta si lancia sul mazzo';

  @override
  String get rejectGhost => 'Un fantasma può giocare solo No!';

  @override
  String get rejectNotGhost => 'Solo un fantasma ha No! senza carta';

  @override
  String get rejectGhostNopeUsed =>
      'Il No! del fantasma è già stato usato in questo giro';

  @override
  String get rejectGhostNeedsCard => 'Il fantasma ha bisogno di una carta No!';

  @override
  String get rejectNothingToNope => 'Non c’è niente da annullare';

  @override
  String get rejectNoPendingLoss => 'Troppo tardi per lo Scudo';

  @override
  String get rejectOwnTurn => 'Non puoi rubare il tuo turno';

  @override
  String rejectTooEarly(String duration) {
    return 'Si può rubare solo dopo $duration di esitazione';
  }

  @override
  String get rejectGameOver => 'La partita è finita';

  @override
  String get rejectOther => 'Comando rifiutato';

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
    return '$player: $card in $duration, pesca $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card non vale';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: tempo scaduto';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: furto del turno ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: No! su $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: No! a vuoto';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'È uscita la bomba, miccia $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'La bomba è esplosa: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Disinnesca';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Innesca su $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Scudo';
  }

  @override
  String captionGhost(String player) {
    return '$player è un fantasma';
  }

  @override
  String get hintDetonate =>
      'Trascina Innesca sul giocatore che riceve la bomba';

  @override
  String get hintSteal => 'Trascina Furto sul giocatore di turno';

  @override
  String toastInvalidCard(int count) {
    return 'Carta non valida: perdi una vita e peschi $count';
  }

  @override
  String get toastTimeOut => 'Tempo scaduto';

  @override
  String toastShieldWindow(String duration) {
    return 'Scudo entro $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player ti ha rubato il turno';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ti ha passato la bomba';
  }

  @override
  String get toastNopeReturns => 'No! ti restituisce il turno';

  @override
  String get yourTurn => 'Tocca a te';

  @override
  String onTurn(String player) {
    return 'Di turno: $player';
  }

  @override
  String deckCount(int count) {
    return 'Mazzo $count';
  }

  @override
  String ghostName(String name) {
    return '$name (fantasma)';
  }

  @override
  String get ghostNope => 'No! del fantasma';

  @override
  String get startHelp =>
      'Lancia una carta dello stesso colore o numero oltre la linea sopra il mazzo. Trascina No! e Scudo di lato, Innesca e Furto su un giocatore.';

  @override
  String get start => 'Inizia';

  @override
  String get youWin => 'Hai vinto';

  @override
  String get nobodySurvived => 'Nessuno è sopravvissuto';

  @override
  String playerWins(String player) {
    return 'Vince $player';
  }

  @override
  String get playAgain => 'Gioca ancora';

  @override
  String get copyReplay => 'Copia replay';

  @override
  String get gameSettings => 'Impostazioni partita';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, mancano $fuse turni',
      one: 'Bomba, manca $fuse turno',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Riprendi';

  @override
  String get pause => 'Pausa';

  @override
  String get debug => 'Debug';

  @override
  String get sectionTime => 'Tempo';

  @override
  String get step => 'Passo';

  @override
  String gameClock(String duration, int round) {
    return 'Tempo di gioco $duration, giro $round';
  }

  @override
  String get artificialLatency => 'Latenza artificiale';

  @override
  String get followTurn => 'La vista segue il giocatore di turno';

  @override
  String get followTurnHint => 'Solo posti controllati da una persona';

  @override
  String get sectionForceCard => 'Forza una carta';

  @override
  String get number => 'Numero';

  @override
  String get giveToHand => 'Metti in mano';

  @override
  String get setAsTarget => 'Imposta come obiettivo';

  @override
  String get sectionBombAndLimit => 'Bomba e limite del turno';

  @override
  String get noBomb => 'Senza bomba';

  @override
  String fuseValue(int fuse) {
    return 'Miccia $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limite nel 1° giro (ora $duration)';
  }

  @override
  String get loadFromClipboard => 'Carica dagli appunti';

  @override
  String get sectionEvents => 'Eventi';

  @override
  String get endGame => 'Termina partita';

  @override
  String get removeLife => 'Togli una vita';

  @override
  String get addLife => 'Aggiungi una vita';
}
