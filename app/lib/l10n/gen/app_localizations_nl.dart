// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get tagline => 'Gooi de juiste kaart voordat de lont is opgebrand.';

  @override
  String get sectionPlayers => 'Spelers';

  @override
  String get sectionRules => 'Regels';

  @override
  String get sectionScenarios => 'Scenario’s';

  @override
  String get ruleTurnLimit => 'Beurtlimiet in ronde 1';

  @override
  String get ruleFastThrow => 'Snelle worp zonder trekken tot';

  @override
  String get ruleSteal => 'Stelen na aarzelen langer dan';

  @override
  String get gameSpeed => 'Spelsnelheid';

  @override
  String get play => 'Spelen';

  @override
  String get loadReplayFromClipboard => 'Replay van klembord laden';

  @override
  String get noReplayInClipboard => 'Geen Kittens-replay op het klembord';

  @override
  String get replayCopied => 'Replay naar klembord gekopieerd';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Jij';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Mens';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pauze';

  @override
  String reactionFixed(String duration) {
    return 'Reactie $duration';
  }

  @override
  String get reactionRandom => 'Willekeurige reactie';

  @override
  String get botIqSmart => 'Speelt slim';

  @override
  String get botIqFirstValid => 'Eerste geldige';

  @override
  String get botIqSloppy => 'Vergist zich 20%';

  @override
  String get colorRed => 'rood';

  @override
  String get colorGreen => 'groen';

  @override
  String get colorBlue => 'blauw';

  @override
  String get colorYellow => 'geel';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Basis';

  @override
  String get cardBomb => 'Bom';

  @override
  String get cardDefuse => 'Onschadelijk';

  @override
  String get cardDetonate => 'Ontsteek';

  @override
  String get cardNope => 'Nee!';

  @override
  String get cardShield => 'Schild';

  @override
  String get cardSteal => 'Steel';

  @override
  String get cardTwist => 'Draai';

  @override
  String get cardBlind => 'Blind';

  @override
  String get rejectNotYourTurn => 'Je bent niet aan de beurt';

  @override
  String get rejectCardNotInHand => 'Deze kaart heb je niet meer';

  @override
  String get rejectInvalidTarget => 'Dat kan niet bij deze speler';

  @override
  String get rejectNotAReaction => 'Deze kaart gooi je op de stapel';

  @override
  String get rejectGhost => 'Een geest kan alleen Nee! spelen';

  @override
  String get rejectNotGhost => 'Alleen een geest heeft Nee! zonder kaart';

  @override
  String get rejectGhostNopeUsed =>
      'Het Nee! van de geest is deze ronde al gebruikt';

  @override
  String get rejectGhostNeedsCard => 'De geest heeft een Nee!-kaart nodig';

  @override
  String get rejectNothingToNope => 'Er is niets om te annuleren';

  @override
  String get rejectNoPendingLoss => 'Te laat voor het Schild';

  @override
  String get rejectOwnTurn => 'Je eigen beurt kun je niet stelen';

  @override
  String rejectTooEarly(String duration) {
    return 'Stelen kan pas na $duration aarzelen';
  }

  @override
  String get rejectGameOver => 'Het spel is afgelopen';

  @override
  String get rejectOther => 'Opdracht geweigerd';

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
    return '$player: $card in $duration, trekt $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card telt niet';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: tijd is om';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: beurt gestolen ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nee! op $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nee! zonder effect';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'De bom is opgedoken, lont $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'De bom is ontploft: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Onschadelijk';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Ontsteek op $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Schild';
  }

  @override
  String captionGhost(String player) {
    return '$player is een geest';
  }

  @override
  String get hintDetonate => 'Sleep Ontsteek naar de speler die de bom krijgt';

  @override
  String get hintSteal => 'Sleep Steel naar de speler die aan de beurt is';

  @override
  String toastInvalidCard(int count) {
    return 'Ongeldige kaart: je verliest een leven en trekt $count';
  }

  @override
  String get toastTimeOut => 'Tijd is om';

  @override
  String toastShieldWindow(String duration) {
    return 'Schild binnen $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player heeft je beurt gestolen';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player heeft de bom op jou afgevuurd';
  }

  @override
  String get toastNopeReturns => 'Nee! geeft de beurt aan jou terug';

  @override
  String get yourTurn => 'Jouw beurt';

  @override
  String onTurn(String player) {
    return 'Aan de beurt: $player';
  }

  @override
  String deckCount(int count) {
    return 'Stapel $count';
  }

  @override
  String ghostName(String name) {
    return '$name (geest)';
  }

  @override
  String get ghostNope => 'Geesten-Nee!';

  @override
  String get startHelp =>
      'Gooi een kaart met dezelfde kleur of hetzelfde getal over de lijn boven de stapel. Veeg Nee! en Schild opzij, sleep Ontsteek en Steel naar een speler.';

  @override
  String get start => 'Beginnen';

  @override
  String get youWin => 'Je wint';

  @override
  String get nobodySurvived => 'Niemand heeft het overleefd';

  @override
  String playerWins(String player) {
    return '$player wint';
  }

  @override
  String get playAgain => 'Opnieuw spelen';

  @override
  String get copyReplay => 'Replay kopiëren';

  @override
  String get gameSettings => 'Spelinstellingen';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bom, nog $fuse beurten',
      one: 'Bom, nog $fuse beurt',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Hervatten';

  @override
  String get pause => 'Pauzeren';

  @override
  String get debug => 'Debug';

  @override
  String get sectionTime => 'Tijd';

  @override
  String get step => 'Stap';

  @override
  String gameClock(String duration, int round) {
    return 'Speltijd $duration, ronde $round';
  }

  @override
  String get artificialLatency => 'Kunstmatige latentie';

  @override
  String get followTurn => 'Weergave volgt de speler aan de beurt';

  @override
  String get followTurnHint => 'Alleen plaatsen die een mens bestuurt';

  @override
  String get sectionForceCard => 'Kaart forceren';

  @override
  String get number => 'Getal';

  @override
  String get giveToHand => 'In de hand geven';

  @override
  String get setAsTarget => 'Als doelkaart instellen';

  @override
  String get sectionBombAndLimit => 'Bom en beurtlimiet';

  @override
  String get noBomb => 'Geen bom';

  @override
  String fuseValue(int fuse) {
    return 'Lont $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limiet in ronde 1 (nu $duration)';
  }

  @override
  String get loadFromClipboard => 'Van klembord laden';

  @override
  String get sectionEvents => 'Gebeurtenissen';

  @override
  String get endGame => 'Spel beëindigen';

  @override
  String get removeLife => 'Leven afnemen';

  @override
  String get addLife => 'Leven toevoegen';
}
