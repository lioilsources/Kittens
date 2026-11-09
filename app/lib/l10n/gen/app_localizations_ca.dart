// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get tagline =>
      'Llança la carta correcta abans que la metxa es consumeixi.';

  @override
  String get sectionPlayers => 'Jugadors';

  @override
  String get sectionRules => 'Regles';

  @override
  String get sectionScenarios => 'Escenaris';

  @override
  String get ruleTurnLimit => 'Límit de torn a la ronda 1';

  @override
  String get ruleFastThrow => 'Tirada ràpida sense robar fins a';

  @override
  String get ruleSteal => 'Robatori després de dubtar més de';

  @override
  String get gameSpeed => 'Velocitat del joc';

  @override
  String get play => 'Jugar';

  @override
  String get loadReplayFromClipboard =>
      'Carrega la repetició del porta-retalls';

  @override
  String get noReplayInClipboard =>
      'No hi ha cap repetició de Kittens al porta-retalls';

  @override
  String get replayCopied => 'Repetició copiada al porta-retalls';

  @override
  String get replayTitle => 'Repetició';

  @override
  String get seatYou => 'Tu';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Humà';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pausa';

  @override
  String reactionFixed(String duration) {
    return 'Reacció $duration';
  }

  @override
  String get reactionRandom => 'Reacció aleatòria';

  @override
  String get botIqSmart => 'Juga amb astúcia';

  @override
  String get botIqFirstValid => 'Primera vàlida';

  @override
  String get botIqSloppy => 'S’equivoca un 20 %';

  @override
  String get colorRed => 'vermell';

  @override
  String get colorGreen => 'verd';

  @override
  String get colorBlue => 'blau';

  @override
  String get colorYellow => 'groc';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Bàsica';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Desactiva';

  @override
  String get cardDetonate => 'Detona';

  @override
  String get cardNope => 'No!';

  @override
  String get cardShield => 'Escut';

  @override
  String get cardSteal => 'Robatori';

  @override
  String get cardTwist => 'Gira';

  @override
  String get cardBlind => 'Cega';

  @override
  String get rejectNotYourTurn => 'No és el teu torn';

  @override
  String get rejectCardNotInHand => 'Ja no tens aquesta carta';

  @override
  String get rejectInvalidTarget => 'No es pot amb aquest jugador';

  @override
  String get rejectNotAReaction => 'Aquesta carta es llança al munt';

  @override
  String get rejectGhost => 'Un fantasma només pot jugar No!';

  @override
  String get rejectNotGhost => 'Només un fantasma té No! sense carta';

  @override
  String get rejectGhostNopeUsed =>
      'El No! del fantasma ja s’ha fet servir aquesta ronda';

  @override
  String get rejectGhostNeedsCard => 'El fantasma necessita una carta No!';

  @override
  String get rejectNothingToNope => 'No hi ha res a anul·lar';

  @override
  String get rejectNoPendingLoss => 'Ja no arribes a temps amb l’Escut';

  @override
  String get rejectOwnTurn => 'No pots robar el teu propi torn';

  @override
  String rejectTooEarly(String duration) {
    return 'Només es pot robar després de $duration de dubte';
  }

  @override
  String get rejectGameOver => 'La partida ha acabat';

  @override
  String get rejectOther => 'Ordre rebutjada';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card en $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card en $duration, roba $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card no val';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: s’ha acabat el temps';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: robatori del torn ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: No! a $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: No! sense efecte';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Ha sortit la bomba, metxa $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'La bomba ha explotat: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Desactiva';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Detona a $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Escut';
  }

  @override
  String captionGhost(String player) {
    return '$player és un fantasma';
  }

  @override
  String get hintDetonate => 'Arrossega Detona al jugador que rep la bomba';

  @override
  String get hintSteal => 'Arrossega Robatori al jugador que té el torn';

  @override
  String toastInvalidCard(int count) {
    return 'Carta no vàlida: perds una vida i robes $count';
  }

  @override
  String get toastTimeOut => 'S’ha acabat el temps';

  @override
  String toastShieldWindow(String duration) {
    return 'Escut en $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player t’ha robat el torn';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player t’ha enviat la bomba';
  }

  @override
  String get toastNopeReturns => 'No! et torna el torn';

  @override
  String get yourTurn => 'El teu torn';

  @override
  String onTurn(String player) {
    return 'Torn de: $player';
  }

  @override
  String deckCount(int count) {
    return 'Munt $count';
  }

  @override
  String ghostName(String name) {
    return '$name (fantasma)';
  }

  @override
  String get ghostNope => 'No! del fantasma';

  @override
  String get startHelp =>
      'Llança una carta del mateix color o número per sobre de la línia damunt del munt. Llisca No! i Escut cap a un costat, i arrossega Detona i Robatori a un jugador.';

  @override
  String get start => 'Comença';

  @override
  String get youWin => 'Guanyes';

  @override
  String get nobodySurvived => 'No ha sobreviscut ningú';

  @override
  String playerWins(String player) {
    return '$player guanya';
  }

  @override
  String get playAgain => 'Torna a jugar';

  @override
  String get copyReplay => 'Copia la repetició';

  @override
  String get gameSettings => 'Configuració de la partida';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, queden $fuse torns',
      one: 'Bomba, queda $fuse torn',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Continua';

  @override
  String get pause => 'Pausa';

  @override
  String get debug => 'Depuració';

  @override
  String get sectionTime => 'Temps';

  @override
  String get step => 'Pas';

  @override
  String gameClock(String duration, int round) {
    return 'Temps de joc $duration, ronda $round';
  }

  @override
  String get artificialLatency => 'Latència artificial';

  @override
  String get followTurn => 'La vista segueix el jugador en torn';

  @override
  String get followTurnHint => 'Només llocs controlats per una persona';

  @override
  String get sectionForceCard => 'Força una carta';

  @override
  String get number => 'Número';

  @override
  String get giveToHand => 'Dona a la mà';

  @override
  String get setAsTarget => 'Posa com a objectiu';

  @override
  String get sectionBombAndLimit => 'Bomba i límit de torn';

  @override
  String get noBomb => 'Sense bomba';

  @override
  String fuseValue(int fuse) {
    return 'Metxa $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Límit a la ronda 1 (ara $duration)';
  }

  @override
  String get loadFromClipboard => 'Carrega del porta-retalls';

  @override
  String get sectionEvents => 'Esdeveniments';

  @override
  String get endGame => 'Acaba la partida';

  @override
  String get removeLife => 'Treu una vida';

  @override
  String get addLife => 'Afegeix una vida';
}
