// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get tagline => 'Lance la bonne carte avant que la mèche ne brûle.';

  @override
  String get sectionPlayers => 'Joueurs';

  @override
  String get sectionRules => 'Règles';

  @override
  String get sectionScenarios => 'Scénarios';

  @override
  String get ruleTurnLimit => 'Limite de tour au 1er tour';

  @override
  String get ruleFastThrow => 'Lancer rapide sans pioche jusqu’à';

  @override
  String get ruleSteal => 'Vol après une hésitation de plus de';

  @override
  String get gameSpeed => 'Vitesse du jeu';

  @override
  String get play => 'Jouer';

  @override
  String get loadReplayFromClipboard =>
      'Charger le replay depuis le presse-papiers';

  @override
  String get noReplayInClipboard =>
      'Aucun replay Kittens dans le presse-papiers';

  @override
  String get replayCopied => 'Replay copié dans le presse-papiers';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Toi';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Humain';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pause';

  @override
  String reactionFixed(String duration) {
    return 'Réaction $duration';
  }

  @override
  String get reactionRandom => 'Réaction aléatoire';

  @override
  String get botIqSmart => 'Joue malin';

  @override
  String get botIqFirstValid => 'Première valide';

  @override
  String get botIqSloppy => 'Se trompe à 20 %';

  @override
  String get colorRed => 'rouge';

  @override
  String get colorGreen => 'vert';

  @override
  String get colorBlue => 'bleu';

  @override
  String get colorYellow => 'jaune';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Base';

  @override
  String get cardBomb => 'Bombe';

  @override
  String get cardDefuse => 'Désamorce';

  @override
  String get cardDetonate => 'Allume';

  @override
  String get cardNope => 'Non !';

  @override
  String get cardShield => 'Bouclier';

  @override
  String get cardSteal => 'Vol';

  @override
  String get cardTwist => 'Inverse';

  @override
  String get cardBlind => 'Aveugle';

  @override
  String get rejectNotYourTurn => 'Ce n’est pas ton tour';

  @override
  String get rejectCardNotInHand => 'Tu n’as plus cette carte';

  @override
  String get rejectInvalidTarget => 'Impossible sur ce joueur';

  @override
  String get rejectNotAReaction => 'Cette carte se lance sur la pioche';

  @override
  String get rejectGhost => 'Un fantôme ne peut jouer que Non !';

  @override
  String get rejectNotGhost => 'Seul un fantôme a un Non ! sans carte';

  @override
  String get rejectGhostNopeUsed =>
      'Le Non ! du fantôme est déjà utilisé ce tour-ci';

  @override
  String get rejectGhostNeedsCard => 'Le fantôme a besoin d’une carte Non !';

  @override
  String get rejectNothingToNope => 'Rien à annuler';

  @override
  String get rejectNoPendingLoss => 'Trop tard pour le Bouclier';

  @override
  String get rejectOwnTurn => 'Impossible de voler ton propre tour';

  @override
  String rejectTooEarly(String duration) {
    return 'Le vol n’est possible qu’après $duration d’hésitation';
  }

  @override
  String get rejectGameOver => 'La partie est terminée';

  @override
  String get rejectOther => 'Commande refusée';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player : $card en $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player : $card en $duration, pioche $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player : $card ne compte pas';
  }

  @override
  String captionTimedOut(String player) {
    return '$player : temps écoulé';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player : vol du tour ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player : Non ! sur $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player : Non ! sans effet';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'La bombe est sortie, mèche $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'La bombe a explosé : $player';
  }

  @override
  String captionDefused(String player) {
    return '$player : Désamorce';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player : Allume sur $target';
  }

  @override
  String captionShield(String player) {
    return '$player : Bouclier';
  }

  @override
  String captionGhost(String player) {
    return '$player est un fantôme';
  }

  @override
  String get hintDetonate =>
      'Fais glisser Allume sur le joueur qui reçoit la bombe';

  @override
  String get hintSteal => 'Fais glisser Vol sur le joueur dont c’est le tour';

  @override
  String toastInvalidCard(int count) {
    return 'Carte invalide : tu perds une vie et pioches $count';
  }

  @override
  String get toastTimeOut => 'Temps écoulé';

  @override
  String toastShieldWindow(String duration) {
    return 'Bouclier dans les $duration !';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player t’a volé ton tour';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player t’a envoyé la bombe';
  }

  @override
  String get toastNopeReturns => 'Non ! te rend le tour';

  @override
  String get yourTurn => 'À toi de jouer';

  @override
  String onTurn(String player) {
    return 'Au tour de : $player';
  }

  @override
  String deckCount(int count) {
    return 'Pioche $count';
  }

  @override
  String ghostName(String name) {
    return '$name (fantôme)';
  }

  @override
  String get ghostNope => 'Non ! du fantôme';

  @override
  String get startHelp =>
      'Lance une carte de même couleur ou de même chiffre au-delà de la ligne au-dessus de la pioche. Glisse Non ! et Bouclier sur le côté, Allume et Vol sur un joueur.';

  @override
  String get start => 'Commencer';

  @override
  String get youWin => 'Tu gagnes';

  @override
  String get nobodySurvived => 'Personne n’a survécu';

  @override
  String playerWins(String player) {
    return '$player gagne';
  }

  @override
  String get playAgain => 'Rejouer';

  @override
  String get copyReplay => 'Copier le replay';

  @override
  String get gameSettings => 'Réglages de la partie';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bombe, encore $fuse tours',
      one: 'Bombe, encore $fuse tour',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Reprendre';

  @override
  String get pause => 'Pause';

  @override
  String get debug => 'Débogage';

  @override
  String get sectionTime => 'Temps';

  @override
  String get step => 'Pas';

  @override
  String gameClock(String duration, int round) {
    return 'Temps de jeu $duration, tour $round';
  }

  @override
  String get artificialLatency => 'Latence artificielle';

  @override
  String get followTurn => 'La vue suit le joueur actif';

  @override
  String get followTurnHint => 'Seulement les places contrôlées par un humain';

  @override
  String get sectionForceCard => 'Imposer une carte';

  @override
  String get number => 'Chiffre';

  @override
  String get giveToHand => 'Mettre en main';

  @override
  String get setAsTarget => 'Définir comme cible';

  @override
  String get sectionBombAndLimit => 'Bombe et limite de tour';

  @override
  String get noBomb => 'Sans bombe';

  @override
  String fuseValue(int fuse) {
    return 'Mèche $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limite au 1er tour (actuellement $duration)';
  }

  @override
  String get loadFromClipboard => 'Charger depuis le presse-papiers';

  @override
  String get sectionEvents => 'Événements';

  @override
  String get endGame => 'Terminer la partie';

  @override
  String get removeLife => 'Retirer une vie';

  @override
  String get addLife => 'Ajouter une vie';
}
