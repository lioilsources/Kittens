// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get tagline => 'Kast det rigtige kort, før lunten brænder ud.';

  @override
  String get sectionPlayers => 'Spillere';

  @override
  String get sectionRules => 'Regler';

  @override
  String get sectionScenarios => 'Scenarier';

  @override
  String get ruleTurnLimit => 'Turgrænse i runde 1';

  @override
  String get ruleFastThrow => 'Hurtigt kast uden at trække op til';

  @override
  String get ruleSteal => 'Tyveri efter tøven længere end';

  @override
  String get gameSpeed => 'Spilhastighed';

  @override
  String get play => 'Spil';

  @override
  String get loadReplayFromClipboard => 'Indlæs replay fra udklipsholderen';

  @override
  String get noReplayInClipboard =>
      'Der er ingen Kittens-replay i udklipsholderen';

  @override
  String get replayCopied => 'Replay kopieret til udklipsholderen';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Dig';

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
    return 'Reaktion $duration';
  }

  @override
  String get reactionRandom => 'Tilfældig reaktion';

  @override
  String get botIqSmart => 'Spiller klogt';

  @override
  String get botIqFirstValid => 'Første gyldige';

  @override
  String get botIqSloppy => 'Fejler 20 %';

  @override
  String get colorRed => 'rød';

  @override
  String get colorGreen => 'grøn';

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
  String get cardDefuse => 'Desarmér';

  @override
  String get cardDetonate => 'Antænd';

  @override
  String get cardNope => 'Nej!';

  @override
  String get cardShield => 'Skjold';

  @override
  String get cardSteal => 'Tyveri';

  @override
  String get cardTwist => 'Vend';

  @override
  String get cardBlind => 'Blind';

  @override
  String get rejectNotYourTurn => 'Det er ikke din tur';

  @override
  String get rejectCardNotInHand => 'Du har ikke længere dette kort';

  @override
  String get rejectInvalidTarget => 'Det går ikke på denne spiller';

  @override
  String get rejectNotAReaction => 'Dette kort kastes på bunken';

  @override
  String get rejectGhost => 'Et spøgelse kan kun spille Nej!';

  @override
  String get rejectNotGhost => 'Kun et spøgelse har Nej! uden kort';

  @override
  String get rejectGhostNopeUsed =>
      'Spøgelsets Nej! er allerede brugt i denne runde';

  @override
  String get rejectGhostNeedsCard => 'Spøgelset skal bruge et Nej!-kort';

  @override
  String get rejectNothingToNope => 'Der er intet at annullere';

  @override
  String get rejectNoPendingLoss => 'For sent til Skjold';

  @override
  String get rejectOwnTurn => 'Du kan ikke stjæle din egen tur';

  @override
  String rejectTooEarly(String duration) {
    return 'Tyveri virker først efter $duration tøven';
  }

  @override
  String get rejectGameOver => 'Spillet er slut';

  @override
  String get rejectOther => 'Kommando afvist';

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
    return '$player: $card på $duration, trækker $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card gælder ikke';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: tiden er gået';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: stjal turen ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nej! på $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nej! uden virkning';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomben er dukket op, lunte $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomben eksploderede: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Desarmér';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Antænd på $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Skjold';
  }

  @override
  String captionGhost(String player) {
    return '$player er et spøgelse';
  }

  @override
  String get hintDetonate => 'Træk Antænd hen på den spiller, der får bomben';

  @override
  String get hintSteal => 'Træk Tyveri hen på den spiller, der har turen';

  @override
  String toastInvalidCard(int count) {
    return 'Ugyldigt kort: du mister et liv og trækker $count';
  }

  @override
  String get toastTimeOut => 'Tiden er gået';

  @override
  String toastShieldWindow(String duration) {
    return 'Skjold inden for $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player stjal din tur';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player sendte bomben til dig';
  }

  @override
  String get toastNopeReturns => 'Nej! giver dig turen tilbage';

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
    return '$name (spøgelse)';
  }

  @override
  String get ghostNope => 'Spøgelsets Nej!';

  @override
  String get startHelp =>
      'Kast et kort med samme farve eller tal over stregen over bunken. Stryg Nej! og Skjold til siden, træk Antænd og Tyveri hen på en spiller.';

  @override
  String get start => 'Start';

  @override
  String get youWin => 'Du vinder';

  @override
  String get nobodySurvived => 'Ingen overlevede';

  @override
  String playerWins(String player) {
    return '$player vinder';
  }

  @override
  String get playAgain => 'Spil igen';

  @override
  String get copyReplay => 'Kopiér replay';

  @override
  String get gameSettings => 'Spilindstillinger';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bombe, $fuse ture tilbage',
      one: 'Bombe, $fuse tur tilbage',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Fortsæt';

  @override
  String get pause => 'Sæt på pause';

  @override
  String get debug => 'Fejlfinding';

  @override
  String get sectionTime => 'Tid';

  @override
  String get step => 'Trin';

  @override
  String gameClock(String duration, int round) {
    return 'Spiltid $duration, runde $round';
  }

  @override
  String get artificialLatency => 'Kunstig latens';

  @override
  String get followTurn => 'Visningen følger spilleren, der har turen';

  @override
  String get followTurnHint => 'Kun pladser styret af et menneske';

  @override
  String get sectionForceCard => 'Gennemtving kort';

  @override
  String get number => 'Tal';

  @override
  String get giveToHand => 'Giv på hånden';

  @override
  String get setAsTarget => 'Sæt som mål';

  @override
  String get sectionBombAndLimit => 'Bombe og turgrænse';

  @override
  String get noBomb => 'Ingen bombe';

  @override
  String fuseValue(int fuse) {
    return 'Lunte $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Grænse i runde 1 (nu $duration)';
  }

  @override
  String get loadFromClipboard => 'Indlæs fra udklipsholderen';

  @override
  String get sectionEvents => 'Hændelser';

  @override
  String get endGame => 'Afslut spil';

  @override
  String get removeLife => 'Fjern et liv';

  @override
  String get addLife => 'Tilføj et liv';
}
