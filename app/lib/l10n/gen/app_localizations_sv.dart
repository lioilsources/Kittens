// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get tagline => 'Kasta rätt kort innan stubinen brunnit ut.';

  @override
  String get sectionPlayers => 'Spelare';

  @override
  String get sectionRules => 'Regler';

  @override
  String get sectionScenarios => 'Scenarier';

  @override
  String get ruleTurnLimit => 'Draggräns i omgång 1';

  @override
  String get ruleFastThrow => 'Snabbt kast utan att dra upp till';

  @override
  String get ruleSteal => 'Stöld efter tvekan längre än';

  @override
  String get gameSpeed => 'Spelhastighet';

  @override
  String get play => 'Spela';

  @override
  String get loadReplayFromClipboard => 'Läs in replay från urklipp';

  @override
  String get noReplayInClipboard => 'Det finns ingen Kittens-replay i urklipp';

  @override
  String get replayCopied => 'Replay kopierad till urklipp';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Du';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Människa';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Paus';

  @override
  String reactionFixed(String duration) {
    return 'Reaktion $duration';
  }

  @override
  String get reactionRandom => 'Slumpmässig reaktion';

  @override
  String get botIqSmart => 'Spelar smart';

  @override
  String get botIqFirstValid => 'Första giltiga';

  @override
  String get botIqSloppy => 'Gör fel 20 %';

  @override
  String get colorRed => 'röd';

  @override
  String get colorGreen => 'grön';

  @override
  String get colorBlue => 'blå';

  @override
  String get colorYellow => 'gul';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Bas';

  @override
  String get cardBomb => 'Bomb';

  @override
  String get cardDefuse => 'Desarmera';

  @override
  String get cardDetonate => 'Tänd';

  @override
  String get cardNope => 'Nej!';

  @override
  String get cardShield => 'Sköld';

  @override
  String get cardSteal => 'Stöld';

  @override
  String get cardTwist => 'Vänd';

  @override
  String get cardBlind => 'Blind';

  @override
  String get rejectNotYourTurn => 'Det är inte din tur';

  @override
  String get rejectCardNotInHand => 'Du har inte det här kortet längre';

  @override
  String get rejectInvalidTarget => 'Det går inte på den här spelaren';

  @override
  String get rejectNotAReaction => 'Det här kortet kastas på högen';

  @override
  String get rejectGhost => 'Ett spöke kan bara spela Nej!';

  @override
  String get rejectNotGhost => 'Bara ett spöke har Nej! utan kort';

  @override
  String get rejectGhostNopeUsed =>
      'Spökets Nej! är redan använt den här omgången';

  @override
  String get rejectGhostNeedsCard => 'Spöket behöver ett Nej!-kort';

  @override
  String get rejectNothingToNope => 'Det finns inget att avbryta';

  @override
  String get rejectNoPendingLoss => 'För sent för Sköld';

  @override
  String get rejectOwnTurn => 'Du kan inte stjäla din egen tur';

  @override
  String rejectTooEarly(String duration) {
    return 'Stöld går först efter $duration tvekan';
  }

  @override
  String get rejectGameOver => 'Spelet är slut';

  @override
  String get rejectOther => 'Kommandot avvisades';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card på $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card på $duration, drar $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card gäller inte';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: tiden är ute';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: stal turen ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nej! på $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nej! utan verkan';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomben har dykt upp, stubin $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomben exploderade: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Desarmera';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Tänd på $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Sköld';
  }

  @override
  String captionGhost(String player) {
    return '$player är ett spöke';
  }

  @override
  String get hintDetonate => 'Dra Tänd till spelaren som får bomben';

  @override
  String get hintSteal => 'Dra Stöld till spelaren som har turen';

  @override
  String toastInvalidCard(int count) {
    return 'Ogiltigt kort: du förlorar ett liv och drar $count';
  }

  @override
  String get toastTimeOut => 'Tiden är ute';

  @override
  String toastShieldWindow(String duration) {
    return 'Sköld inom $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player stal din tur';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player skickade bomben till dig';
  }

  @override
  String get toastNopeReturns => 'Nej! ger dig tillbaka turen';

  @override
  String get yourTurn => 'Din tur';

  @override
  String onTurn(String player) {
    return 'Tur: $player';
  }

  @override
  String deckCount(int count) {
    return 'Hög $count';
  }

  @override
  String ghostName(String name) {
    return '$name (spöke)';
  }

  @override
  String get ghostNope => 'Spökets Nej!';

  @override
  String get startHelp =>
      'Kasta ett kort med samma färg eller siffra över linjen ovanför högen. Svep Nej! och Sköld åt sidan, dra Tänd och Stöld till en spelare.';

  @override
  String get start => 'Starta';

  @override
  String get youWin => 'Du vinner';

  @override
  String get nobodySurvived => 'Ingen överlevde';

  @override
  String playerWins(String player) {
    return '$player vinner';
  }

  @override
  String get playAgain => 'Spela igen';

  @override
  String get copyReplay => 'Kopiera replay';

  @override
  String get gameSettings => 'Spelinställningar';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomb, $fuse turer kvar',
      one: 'Bomb, $fuse tur kvar',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Fortsätt';

  @override
  String get pause => 'Pausa';

  @override
  String get debug => 'Felsökning';

  @override
  String get sectionTime => 'Tid';

  @override
  String get step => 'Steg';

  @override
  String gameClock(String duration, int round) {
    return 'Speltid $duration, omgång $round';
  }

  @override
  String get artificialLatency => 'Konstgjord latens';

  @override
  String get followTurn => 'Vyn följer spelaren som har turen';

  @override
  String get followTurnHint => 'Bara platser som styrs av en människa';

  @override
  String get sectionForceCard => 'Tvinga fram kort';

  @override
  String get number => 'Siffra';

  @override
  String get giveToHand => 'Ge till handen';

  @override
  String get setAsTarget => 'Ange som mål';

  @override
  String get sectionBombAndLimit => 'Bomb och draggräns';

  @override
  String get noBomb => 'Ingen bomb';

  @override
  String fuseValue(int fuse) {
    return 'Stubin $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Gräns i omgång 1 (nu $duration)';
  }

  @override
  String get loadFromClipboard => 'Läs in från urklipp';

  @override
  String get sectionEvents => 'Händelser';

  @override
  String get endGame => 'Avsluta spelet';

  @override
  String get removeLife => 'Ta bort ett liv';

  @override
  String get addLife => 'Lägg till ett liv';
}
