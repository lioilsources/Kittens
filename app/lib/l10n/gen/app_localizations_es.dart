// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get tagline =>
      'Lanza la carta correcta antes de que se consuma la mecha.';

  @override
  String get sectionPlayers => 'Jugadores';

  @override
  String get sectionRules => 'Reglas';

  @override
  String get sectionScenarios => 'Escenarios';

  @override
  String get ruleTurnLimit => 'Límite de turno en la ronda 1';

  @override
  String get ruleFastThrow => 'Tirada rápida sin robar hasta';

  @override
  String get ruleSteal => 'Robo tras dudar más de';

  @override
  String get gameSpeed => 'Velocidad del juego';

  @override
  String get play => 'Jugar';

  @override
  String get loadReplayFromClipboard => 'Cargar repetición del portapapeles';

  @override
  String get noReplayInClipboard =>
      'No hay ninguna repetición de Kittens en el portapapeles';

  @override
  String get replayCopied => 'Repetición copiada al portapapeles';

  @override
  String get replayTitle => 'Repetición';

  @override
  String get seatYou => 'Tú';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Humano';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pausa';

  @override
  String reactionFixed(String duration) {
    return 'Reacción $duration';
  }

  @override
  String get reactionRandom => 'Reacción aleatoria';

  @override
  String get botIqSmart => 'Juega con astucia';

  @override
  String get botIqFirstValid => 'Primera válida';

  @override
  String get botIqSloppy => 'Falla un 20 %';

  @override
  String get colorRed => 'rojo';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'azul';

  @override
  String get colorYellow => 'amarillo';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Básica';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Desactiva';

  @override
  String get cardDetonate => 'Detona';

  @override
  String get cardNope => '¡No!';

  @override
  String get cardShield => 'Escudo';

  @override
  String get cardSteal => 'Robo';

  @override
  String get cardTwist => 'Gira';

  @override
  String get cardBlind => 'Ciega';

  @override
  String get rejectNotYourTurn => 'No es tu turno';

  @override
  String get rejectCardNotInHand => 'Ya no tienes esta carta';

  @override
  String get rejectInvalidTarget => 'No se puede con este jugador';

  @override
  String get rejectNotAReaction => 'Esta carta se lanza al mazo';

  @override
  String get rejectGhost => 'Un fantasma solo puede jugar ¡No!';

  @override
  String get rejectNotGhost => 'Solo un fantasma tiene ¡No! sin carta';

  @override
  String get rejectGhostNopeUsed =>
      'El ¡No! del fantasma ya se usó en esta ronda';

  @override
  String get rejectGhostNeedsCard => 'El fantasma necesita una carta ¡No!';

  @override
  String get rejectNothingToNope => 'No hay nada que anular';

  @override
  String get rejectNoPendingLoss => 'Ya no llegas con el Escudo';

  @override
  String get rejectOwnTurn => 'No puedes robar tu propio turno';

  @override
  String rejectTooEarly(String duration) {
    return 'Solo se puede robar tras $duration de duda';
  }

  @override
  String get rejectGameOver => 'La partida ha terminado';

  @override
  String get rejectOther => 'Orden rechazada';

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
    return '$player: $card no vale';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: se acabó el tiempo';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: robo de turno ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: ¡No! a $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: ¡No! sin efecto';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Ha salido la bomba, mecha $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'La bomba explotó: $player';
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
    return '$player: Escudo';
  }

  @override
  String captionGhost(String player) {
    return '$player es un fantasma';
  }

  @override
  String get hintDetonate => 'Arrastra Detona al jugador que recibe la bomba';

  @override
  String get hintSteal => 'Arrastra Robo al jugador que tiene el turno';

  @override
  String toastInvalidCard(int count) {
    return 'Carta no válida: pierdes una vida y robas $count';
  }

  @override
  String get toastTimeOut => 'Se acabó el tiempo';

  @override
  String toastShieldWindow(String duration) {
    return '¡Escudo en $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player te robó el turno';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player te mandó la bomba';
  }

  @override
  String get toastNopeReturns => '¡No! te devuelve el turno';

  @override
  String get yourTurn => 'Tu turno';

  @override
  String onTurn(String player) {
    return 'Turno de: $player';
  }

  @override
  String deckCount(int count) {
    return 'Mazo $count';
  }

  @override
  String ghostName(String name) {
    return '$name (fantasma)';
  }

  @override
  String get ghostNope => '¡No! del fantasma';

  @override
  String get startHelp =>
      'Lanza una carta del mismo color o número por encima de la línea sobre el mazo. Desliza ¡No! y Escudo hacia un lado, y arrastra Detona y Robo a un jugador.';

  @override
  String get start => 'Empezar';

  @override
  String get youWin => 'Ganas';

  @override
  String get nobodySurvived => 'Nadie sobrevivió';

  @override
  String playerWins(String player) {
    return '$player gana';
  }

  @override
  String get playAgain => 'Jugar otra vez';

  @override
  String get copyReplay => 'Copiar repetición';

  @override
  String get gameSettings => 'Ajustes de la partida';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, quedan $fuse turnos',
      one: 'Bomba, queda $fuse turno',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Continuar';

  @override
  String get pause => 'Pausar';

  @override
  String get debug => 'Depuración';

  @override
  String get sectionTime => 'Tiempo';

  @override
  String get step => 'Paso';

  @override
  String gameClock(String duration, int round) {
    return 'Tiempo de juego $duration, ronda $round';
  }

  @override
  String get artificialLatency => 'Latencia artificial';

  @override
  String get followTurn => 'La vista sigue al jugador en turno';

  @override
  String get followTurnHint => 'Solo puestos controlados por una persona';

  @override
  String get sectionForceCard => 'Forzar carta';

  @override
  String get number => 'Número';

  @override
  String get giveToHand => 'Dar a la mano';

  @override
  String get setAsTarget => 'Poner como objetivo';

  @override
  String get sectionBombAndLimit => 'Bomba y límite de turno';

  @override
  String get noBomb => 'Sin bomba';

  @override
  String fuseValue(int fuse) {
    return 'Mecha $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Límite en la ronda 1 (ahora $duration)';
  }

  @override
  String get loadFromClipboard => 'Cargar del portapapeles';

  @override
  String get sectionEvents => 'Eventos';

  @override
  String get endGame => 'Terminar partida';

  @override
  String get removeLife => 'Quitar una vida';

  @override
  String get addLife => 'Añadir una vida';
}
