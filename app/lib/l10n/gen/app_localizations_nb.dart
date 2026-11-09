// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get tagline => 'Kast riktig kort før lunten har brent ned.';

  @override
  String get sectionPlayers => 'Spillere';

  @override
  String get sectionRules => 'Regler';

  @override
  String get sectionScenarios => 'Scenarier';

  @override
  String get ruleTurnLimit => 'Turgrense i runde 1';

  @override
  String get ruleFastThrow => 'Raskt kast uten å trekke opptil';

  @override
  String get ruleSteal => 'Tyveri etter nøling lenger enn';

  @override
  String get gameSpeed => 'Spillhastighet';

  @override
  String get play => 'Spill';

  @override
  String get loadReplayFromClipboard => 'Last inn replay fra utklippstavlen';

  @override
  String get noReplayInClipboard =>
      'Det finnes ingen Kittens-replay på utklippstavlen';

  @override
  String get replayCopied => 'Replay kopiert til utklippstavlen';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Deg';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Menneske';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pause';

  @override
  String reactionFixed(String duration) {
    return 'Reaksjon $duration';
  }

  @override
  String get reactionRandom => 'Tilfeldig reaksjon';

  @override
  String get botIqSmart => 'Spiller smart';

  @override
  String get botIqFirstValid => 'Første gyldige';

  @override
  String get botIqSloppy => 'Feiler 20 %';

  @override
  String get colorRed => 'rød';

  @override
  String get colorGreen => 'grønn';

  @override
  String get colorBlue => 'blå';

  @override
  String get colorYellow => 'gul';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Basis';

  @override
  String get cardBomb => 'Bombe';

  @override
  String get cardDefuse => 'Desarmer';

  @override
  String get cardDetonate => 'Tenn';

  @override
  String get cardNope => 'Nei!';

  @override
  String get cardShield => 'Skjold';

  @override
  String get cardSteal => 'Tyveri';

  @override
  String get cardTwist => 'Snu';

  @override
  String get cardBlind => 'Blind';

  @override
  String get rejectNotYourTurn => 'Det er ikke din tur';

  @override
  String get rejectCardNotInHand => 'Du har ikke dette kortet lenger';

  @override
  String get rejectInvalidTarget => 'Det går ikke på denne spilleren';

  @override
  String get rejectNotAReaction => 'Dette kortet kastes på bunken';

  @override
  String get rejectGhost => 'Et spøkelse kan bare spille Nei!';

  @override
  String get rejectNotGhost => 'Bare et spøkelse har Nei! uten kort';

  @override
  String get rejectGhostNopeUsed =>
      'Spøkelsets Nei! er allerede brukt denne runden';

  @override
  String get rejectGhostNeedsCard => 'Spøkelset trenger et Nei!-kort';

  @override
  String get rejectNothingToNope => 'Det er ingenting å avbryte';

  @override
  String get rejectNoPendingLoss => 'For sent for Skjold';

  @override
  String get rejectOwnTurn => 'Du kan ikke stjele din egen tur';

  @override
  String rejectTooEarly(String duration) {
    return 'Tyveri går først etter $duration nøling';
  }

  @override
  String get rejectGameOver => 'Spillet er over';

  @override
  String get rejectOther => 'Kommandoen ble avvist';

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
    return '$player: $card på $duration, trekker $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card gjelder ikke';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: tiden er ute';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: stjal turen ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nei! på $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nei! uten virkning';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomben har dukket opp, lunte $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomben eksploderte: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Desarmer';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Tenn på $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Skjold';
  }

  @override
  String captionGhost(String player) {
    return '$player er et spøkelse';
  }

  @override
  String get hintDetonate => 'Dra Tenn til spilleren som får bomben';

  @override
  String get hintSteal => 'Dra Tyveri til spilleren som har turen';

  @override
  String toastInvalidCard(int count) {
    return 'Ugyldig kort: du mister et liv og trekker $count';
  }

  @override
  String get toastTimeOut => 'Tiden er ute';

  @override
  String toastShieldWindow(String duration) {
    return 'Skjold innen $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player stjal turen din';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player sendte bomben til deg';
  }

  @override
  String get toastNopeReturns => 'Nei! gir deg turen tilbake';

  @override
  String get yourTurn => 'Din tur';

  @override
  String onTurn(String player) {
    return 'Tur: $player';
  }

  @override
  String deckCount(int count) {
    return 'Bunke $count';
  }

  @override
  String ghostName(String name) {
    return '$name (spøkelse)';
  }

  @override
  String get ghostNope => 'Spøkelsets Nei!';

  @override
  String get startHelp =>
      'Kast et kort med samme farge eller tall over streken over bunken. Sveip Nei! og Skjold til siden, dra Tenn og Tyveri til en spiller.';

  @override
  String get start => 'Start';

  @override
  String get youWin => 'Du vinner';

  @override
  String get nobodySurvived => 'Ingen overlevde';

  @override
  String playerWins(String player) {
    return '$player vinner';
  }

  @override
  String get playAgain => 'Spill igjen';

  @override
  String get copyReplay => 'Kopier replay';

  @override
  String get gameSettings => 'Spillinnstillinger';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bombe, $fuse turer igjen',
      one: 'Bombe, $fuse tur igjen',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Fortsett';

  @override
  String get pause => 'Sett på pause';

  @override
  String get debug => 'Feilsøking';

  @override
  String get sectionTime => 'Tid';

  @override
  String get step => 'Steg';

  @override
  String gameClock(String duration, int round) {
    return 'Spilltid $duration, runde $round';
  }

  @override
  String get artificialLatency => 'Kunstig latens';

  @override
  String get followTurn => 'Visningen følger spilleren som har turen';

  @override
  String get followTurnHint => 'Bare plasser styrt av et menneske';

  @override
  String get sectionForceCard => 'Tving frem kort';

  @override
  String get number => 'Tall';

  @override
  String get giveToHand => 'Gi til hånden';

  @override
  String get setAsTarget => 'Angi som mål';

  @override
  String get sectionBombAndLimit => 'Bombe og turgrense';

  @override
  String get noBomb => 'Ingen bombe';

  @override
  String fuseValue(int fuse) {
    return 'Lunte $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Grense i runde 1 (nå $duration)';
  }

  @override
  String get loadFromClipboard => 'Last inn fra utklippstavlen';

  @override
  String get sectionEvents => 'Hendelser';

  @override
  String get endGame => 'Avslutt spillet';

  @override
  String get removeLife => 'Fjern et liv';

  @override
  String get addLife => 'Legg til et liv';
}
