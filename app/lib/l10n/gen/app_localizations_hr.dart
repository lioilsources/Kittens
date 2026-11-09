// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get tagline => 'Baci pravu kartu prije nego fitilj izgori.';

  @override
  String get sectionPlayers => 'Igrači';

  @override
  String get sectionRules => 'Pravila';

  @override
  String get sectionScenarios => 'Scenariji';

  @override
  String get ruleTurnLimit => 'Ograničenje poteza u 1. rundi';

  @override
  String get ruleFastThrow => 'Brzo bacanje bez vučenja do';

  @override
  String get ruleSteal => 'Krađa nakon oklijevanja duljeg od';

  @override
  String get gameSpeed => 'Brzina igre';

  @override
  String get play => 'Igraj';

  @override
  String get loadReplayFromClipboard => 'Učitaj snimku iz međuspremnika';

  @override
  String get noReplayInClipboard => 'U međuspremniku nema snimke Kittens';

  @override
  String get replayCopied => 'Snimka je kopirana u međuspremnik';

  @override
  String get replayTitle => 'Snimka';

  @override
  String get seatYou => 'Ti';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Čovjek';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pauza';

  @override
  String reactionFixed(String duration) {
    return 'Reakcija $duration';
  }

  @override
  String get reactionRandom => 'Nasumična reakcija';

  @override
  String get botIqSmart => 'Igra pametno';

  @override
  String get botIqFirstValid => 'Prva valjana';

  @override
  String get botIqSloppy => 'Griješi 20 %';

  @override
  String get colorRed => 'crvena';

  @override
  String get colorGreen => 'zelena';

  @override
  String get colorBlue => 'plava';

  @override
  String get colorYellow => 'žuta';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Osnovna';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Deaktiviraj';

  @override
  String get cardDetonate => 'Aktiviraj';

  @override
  String get cardNope => 'Ne!';

  @override
  String get cardShield => 'Štit';

  @override
  String get cardSteal => 'Krađa';

  @override
  String get cardTwist => 'Preokreni';

  @override
  String get cardBlind => 'Slijepa';

  @override
  String get rejectNotYourTurn => 'Nisi na redu';

  @override
  String get rejectCardNotInHand => 'Ovu kartu više nemaš';

  @override
  String get rejectInvalidTarget => 'Taj se igrač ne može odabrati';

  @override
  String get rejectNotAReaction => 'Ova se karta baca na špil';

  @override
  String get rejectGhost => 'Duh smije igrati samo Ne!';

  @override
  String get rejectNotGhost => 'Ne! bez karte ima samo duh';

  @override
  String get rejectGhostNopeUsed =>
      'Duhovo Ne! već je iskorišteno u ovoj rundi';

  @override
  String get rejectGhostNeedsCard => 'Duhu treba karta Ne!';

  @override
  String get rejectNothingToNope => 'Nema što poništiti';

  @override
  String get rejectNoPendingLoss => 'Štit više ne stižeš';

  @override
  String get rejectOwnTurn => 'Vlastiti potez ne možeš ukrasti';

  @override
  String rejectTooEarly(String duration) {
    return 'Krasti se može tek nakon $duration oklijevanja';
  }

  @override
  String get rejectGameOver => 'Igra je gotova';

  @override
  String get rejectOther => 'Naredba odbijena';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card za $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card za $duration, vuče $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card ne vrijedi';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: vrijeme je isteklo';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: krađa poteza ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Ne! na $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Ne! nije uspjelo';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomba se pojavila, fitilj $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomba je eksplodirala: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Deaktiviraj';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Aktiviraj na $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Štit';
  }

  @override
  String captionGhost(String player) {
    return '$player je duh';
  }

  @override
  String get hintDetonate => 'Povuci Aktiviraj na igrača koji dobiva bombu';

  @override
  String get hintSteal => 'Povuci Krađu na igrača koji je na potezu';

  @override
  String toastInvalidCard(int count) {
    return 'Nevaljana karta: gubiš život i vučeš $count';
  }

  @override
  String get toastTimeOut => 'Vrijeme je isteklo';

  @override
  String toastShieldWindow(String duration) {
    return 'Štit unutar $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: krađa tvog poteza';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ti je poslao bombu';
  }

  @override
  String get toastNopeReturns => 'Ne! vraća potez tebi';

  @override
  String get yourTurn => 'Tvoj potez';

  @override
  String onTurn(String player) {
    return 'Na potezu: $player';
  }

  @override
  String deckCount(int count) {
    return 'Špil $count';
  }

  @override
  String ghostName(String name) {
    return '$name (duh)';
  }

  @override
  String get ghostNope => 'Duhovo Ne!';

  @override
  String get startHelp =>
      'Baci kartu iste boje ili broja preko crte iznad špila. Ne! i Štit povuci u stranu, Aktiviraj i Krađu na igrača.';

  @override
  String get start => 'Počni';

  @override
  String get youWin => 'Pobjeđuješ';

  @override
  String get nobodySurvived => 'Nitko nije preživio';

  @override
  String playerWins(String player) {
    return '$player pobjeđuje';
  }

  @override
  String get playAgain => 'Igraj ponovno';

  @override
  String get copyReplay => 'Kopiraj snimku';

  @override
  String get gameSettings => 'Postavke igre';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, ostalo je $fuse poteza',
      few: 'Bomba, ostala su $fuse poteza',
      one: 'Bomba, ostao je $fuse potez',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Nastavi';

  @override
  String get pause => 'Pauziraj';

  @override
  String get debug => 'Otklanjanje pogrešaka';

  @override
  String get sectionTime => 'Vrijeme';

  @override
  String get step => 'Korak';

  @override
  String gameClock(String duration, int round) {
    return 'Vrijeme igre $duration, runda $round';
  }

  @override
  String get artificialLatency => 'Umjetna latencija';

  @override
  String get followTurn => 'Prikaz prati igrača na potezu';

  @override
  String get followTurnHint => 'Samo mjesta koja kontrolira čovjek';

  @override
  String get sectionForceCard => 'Nametni kartu';

  @override
  String get number => 'Broj';

  @override
  String get giveToHand => 'Daj u ruku';

  @override
  String get setAsTarget => 'Postavi kao cilj';

  @override
  String get sectionBombAndLimit => 'Bomba i ograničenje poteza';

  @override
  String get noBomb => 'Bez bombe';

  @override
  String fuseValue(int fuse) {
    return 'Fitilj $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Ograničenje u 1. rundi (sada $duration)';
  }

  @override
  String get loadFromClipboard => 'Učitaj iz međuspremnika';

  @override
  String get sectionEvents => 'Događaji';

  @override
  String get endGame => 'Završi igru';

  @override
  String get removeLife => 'Oduzmi život';

  @override
  String get addLife => 'Dodaj život';
}
