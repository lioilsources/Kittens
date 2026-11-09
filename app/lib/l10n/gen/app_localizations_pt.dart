// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get tagline => 'Jogue a carta certa antes que o pavio queime todo.';

  @override
  String get sectionPlayers => 'Jogadores';

  @override
  String get sectionRules => 'Regras';

  @override
  String get sectionScenarios => 'Cenários';

  @override
  String get ruleTurnLimit => 'Limite da vez na 1ª rodada';

  @override
  String get ruleFastThrow => 'Jogada rápida sem comprar até';

  @override
  String get ruleSteal => 'Roubo após hesitar mais de';

  @override
  String get gameSpeed => 'Velocidade do jogo';

  @override
  String get play => 'Jogar';

  @override
  String get loadReplayFromClipboard =>
      'Carregar replay da área de transferência';

  @override
  String get noReplayInClipboard =>
      'Não há replay do Kittens na área de transferência';

  @override
  String get replayCopied => 'Replay copiado para a área de transferência';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Você';

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
    return 'Reação $duration';
  }

  @override
  String get reactionRandom => 'Reação aleatória';

  @override
  String get botIqSmart => 'Joga com esperteza';

  @override
  String get botIqFirstValid => 'Primeira válida';

  @override
  String get botIqSloppy => 'Erra 20%';

  @override
  String get colorRed => 'vermelho';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'azul';

  @override
  String get colorYellow => 'amarelo';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Básica';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Desarma';

  @override
  String get cardDetonate => 'Detona';

  @override
  String get cardNope => 'Não!';

  @override
  String get cardShield => 'Escudo';

  @override
  String get cardSteal => 'Roubo';

  @override
  String get cardTwist => 'Vira';

  @override
  String get cardBlind => 'Cega';

  @override
  String get rejectNotYourTurn => 'Não é a sua vez';

  @override
  String get rejectCardNotInHand => 'Você não tem mais esta carta';

  @override
  String get rejectInvalidTarget => 'Não dá para este jogador';

  @override
  String get rejectNotAReaction => 'Esta carta vai no monte';

  @override
  String get rejectGhost => 'Um fantasma só pode jogar Não!';

  @override
  String get rejectNotGhost => 'Só um fantasma tem Não! sem carta';

  @override
  String get rejectGhostNopeUsed =>
      'O Não! do fantasma já foi usado nesta rodada';

  @override
  String get rejectGhostNeedsCard => 'O fantasma precisa de uma carta Não!';

  @override
  String get rejectNothingToNope => 'Não há nada para cancelar';

  @override
  String get rejectNoPendingLoss => 'Tarde demais para o Escudo';

  @override
  String get rejectOwnTurn => 'Você não pode roubar a própria vez';

  @override
  String rejectTooEarly(String duration) {
    return 'Só dá para roubar após $duration de hesitação';
  }

  @override
  String get rejectGameOver => 'O jogo acabou';

  @override
  String get rejectOther => 'Comando recusado';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card em $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card em $duration, compra $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card não vale';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: o tempo acabou';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: roubou a vez ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Não! em $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Não! sem efeito';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'A bomba apareceu, pavio $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'A bomba explodiu: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Desarma';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Detona em $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Escudo';
  }

  @override
  String captionGhost(String player) {
    return '$player virou fantasma';
  }

  @override
  String get hintDetonate =>
      'Arraste Detona até o jogador que vai receber a bomba';

  @override
  String get hintSteal => 'Arraste Roubo até o jogador da vez';

  @override
  String toastInvalidCard(int count) {
    return 'Carta inválida: você perde uma vida e compra $count';
  }

  @override
  String get toastTimeOut => 'O tempo acabou';

  @override
  String toastShieldWindow(String duration) {
    return 'Escudo em até $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player roubou a sua vez';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player mandou a bomba para você';
  }

  @override
  String get toastNopeReturns => 'Não! devolve a vez para você';

  @override
  String get yourTurn => 'Sua vez';

  @override
  String onTurn(String player) {
    return 'Vez de: $player';
  }

  @override
  String deckCount(int count) {
    return 'Monte $count';
  }

  @override
  String ghostName(String name) {
    return '$name (fantasma)';
  }

  @override
  String get ghostNope => 'Não! do fantasma';

  @override
  String get startHelp =>
      'Jogue uma carta da mesma cor ou número por cima da linha acima do monte. Deslize Não! e Escudo para o lado, arraste Detona e Roubo até um jogador.';

  @override
  String get start => 'Começar';

  @override
  String get youWin => 'Você venceu';

  @override
  String get nobodySurvived => 'Ninguém sobreviveu';

  @override
  String playerWins(String player) {
    return '$player vence';
  }

  @override
  String get playAgain => 'Jogar de novo';

  @override
  String get copyReplay => 'Copiar replay';

  @override
  String get gameSettings => 'Configurações da partida';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, faltam $fuse vezes',
      one: 'Bomba, falta $fuse vez',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Continuar';

  @override
  String get pause => 'Pausar';

  @override
  String get debug => 'Depuração';

  @override
  String get sectionTime => 'Tempo';

  @override
  String get step => 'Passo';

  @override
  String gameClock(String duration, int round) {
    return 'Tempo de jogo $duration, rodada $round';
  }

  @override
  String get artificialLatency => 'Latência artificial';

  @override
  String get followTurn => 'A visão acompanha o jogador da vez';

  @override
  String get followTurnHint => 'Só lugares controlados por uma pessoa';

  @override
  String get sectionForceCard => 'Forçar carta';

  @override
  String get number => 'Número';

  @override
  String get giveToHand => 'Dar para a mão';

  @override
  String get setAsTarget => 'Definir como alvo';

  @override
  String get sectionBombAndLimit => 'Bomba e limite da vez';

  @override
  String get noBomb => 'Sem bomba';

  @override
  String fuseValue(int fuse) {
    return 'Pavio $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limite na 1ª rodada (agora $duration)';
  }

  @override
  String get loadFromClipboard => 'Carregar da área de transferência';

  @override
  String get sectionEvents => 'Eventos';

  @override
  String get endGame => 'Encerrar partida';

  @override
  String get removeLife => 'Tirar uma vida';

  @override
  String get addLife => 'Adicionar uma vida';
}

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

  @override
  String get tagline =>
      'Lança a carta certa antes que o rastilho arda até ao fim.';

  @override
  String get sectionPlayers => 'Jogadores';

  @override
  String get sectionRules => 'Regras';

  @override
  String get sectionScenarios => 'Cenários';

  @override
  String get ruleTurnLimit => 'Limite da jogada na 1.ª ronda';

  @override
  String get ruleFastThrow => 'Lançamento rápido sem comprar até';

  @override
  String get ruleSteal => 'Roubo após hesitar mais de';

  @override
  String get gameSpeed => 'Velocidade do jogo';

  @override
  String get play => 'Jogar';

  @override
  String get loadReplayFromClipboard =>
      'Carregar repetição da área de transferência';

  @override
  String get noReplayInClipboard =>
      'Não há nenhuma repetição do Kittens na área de transferência';

  @override
  String get replayCopied => 'Repetição copiada para a área de transferência';

  @override
  String get replayTitle => 'Repetição';

  @override
  String get seatYou => 'Tu';

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
    return 'Reação $duration';
  }

  @override
  String get reactionRandom => 'Reação aleatória';

  @override
  String get botIqSmart => 'Joga com astúcia';

  @override
  String get botIqFirstValid => 'Primeira válida';

  @override
  String get botIqSloppy => 'Erra 20 %';

  @override
  String get colorRed => 'vermelho';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'azul';

  @override
  String get colorYellow => 'amarelo';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Base';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Desarma';

  @override
  String get cardDetonate => 'Detona';

  @override
  String get cardNope => 'Não!';

  @override
  String get cardShield => 'Escudo';

  @override
  String get cardSteal => 'Roubo';

  @override
  String get cardTwist => 'Vira';

  @override
  String get cardBlind => 'Cega';

  @override
  String get rejectNotYourTurn => 'Não é a tua vez';

  @override
  String get rejectCardNotInHand => 'Já não tens esta carta';

  @override
  String get rejectInvalidTarget => 'Não dá para este jogador';

  @override
  String get rejectNotAReaction => 'Esta carta lança-se no baralho';

  @override
  String get rejectGhost => 'Um fantasma só pode jogar Não!';

  @override
  String get rejectNotGhost => 'Só um fantasma tem Não! sem carta';

  @override
  String get rejectGhostNopeUsed =>
      'O Não! do fantasma já foi usado nesta ronda';

  @override
  String get rejectGhostNeedsCard => 'O fantasma precisa de uma carta Não!';

  @override
  String get rejectNothingToNope => 'Não há nada para anular';

  @override
  String get rejectNoPendingLoss => 'Já é tarde para o Escudo';

  @override
  String get rejectOwnTurn => 'Não podes roubar a tua própria vez';

  @override
  String rejectTooEarly(String duration) {
    return 'Só se pode roubar após $duration de hesitação';
  }

  @override
  String get rejectGameOver => 'O jogo terminou';

  @override
  String get rejectOther => 'Comando recusado';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card em $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card em $duration, compra $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card não vale';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: o tempo acabou';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: roubo da vez ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Não! a $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Não! sem efeito';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'A bomba apareceu, rastilho $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'A bomba explodiu: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Desarma';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Detona em $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Escudo';
  }

  @override
  String captionGhost(String player) {
    return '$player é um fantasma';
  }

  @override
  String get hintDetonate => 'Arrasta Detona para o jogador que recebe a bomba';

  @override
  String get hintSteal => 'Arrasta Roubo para o jogador que está a jogar';

  @override
  String toastInvalidCard(int count) {
    return 'Carta inválida: perdes uma vida e compras $count';
  }

  @override
  String get toastTimeOut => 'O tempo acabou';

  @override
  String toastShieldWindow(String duration) {
    return 'Escudo em $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player roubou-te a vez';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player mandou-te a bomba';
  }

  @override
  String get toastNopeReturns => 'Não! devolve-te a vez';

  @override
  String get yourTurn => 'É a tua vez';

  @override
  String onTurn(String player) {
    return 'Vez de: $player';
  }

  @override
  String deckCount(int count) {
    return 'Baralho $count';
  }

  @override
  String ghostName(String name) {
    return '$name (fantasma)';
  }

  @override
  String get ghostNope => 'Não! do fantasma';

  @override
  String get startHelp =>
      'Lança uma carta da mesma cor ou número por cima da linha sobre o baralho. Desliza Não! e Escudo para o lado, arrasta Detona e Roubo para um jogador.';

  @override
  String get start => 'Começar';

  @override
  String get youWin => 'Ganhaste';

  @override
  String get nobodySurvived => 'Ninguém sobreviveu';

  @override
  String playerWins(String player) {
    return '$player ganha';
  }

  @override
  String get playAgain => 'Jogar outra vez';

  @override
  String get copyReplay => 'Copiar repetição';

  @override
  String get gameSettings => 'Definições do jogo';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, faltam $fuse jogadas',
      one: 'Bomba, falta $fuse jogada',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Continuar';

  @override
  String get pause => 'Pausar';

  @override
  String get debug => 'Depuração';

  @override
  String get sectionTime => 'Tempo';

  @override
  String get step => 'Passo';

  @override
  String gameClock(String duration, int round) {
    return 'Tempo de jogo $duration, ronda $round';
  }

  @override
  String get artificialLatency => 'Latência artificial';

  @override
  String get followTurn => 'A vista segue o jogador da vez';

  @override
  String get followTurnHint => 'Só lugares controlados por uma pessoa';

  @override
  String get sectionForceCard => 'Forçar carta';

  @override
  String get number => 'Número';

  @override
  String get giveToHand => 'Dar para a mão';

  @override
  String get setAsTarget => 'Definir como alvo';

  @override
  String get sectionBombAndLimit => 'Bomba e limite da jogada';

  @override
  String get noBomb => 'Sem bomba';

  @override
  String fuseValue(int fuse) {
    return 'Rastilho $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limite na 1.ª ronda (agora $duration)';
  }

  @override
  String get loadFromClipboard => 'Carregar da área de transferência';

  @override
  String get sectionEvents => 'Eventos';

  @override
  String get endGame => 'Terminar jogo';

  @override
  String get removeLife => 'Tirar uma vida';

  @override
  String get addLife => 'Adicionar uma vida';
}
