// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get tagline => 'Rzuć właściwą kartę, zanim lont się wypali.';

  @override
  String get sectionPlayers => 'Gracze';

  @override
  String get sectionRules => 'Zasady';

  @override
  String get sectionScenarios => 'Scenariusze';

  @override
  String get ruleTurnLimit => 'Limit ruchu w 1. rundzie';

  @override
  String get ruleFastThrow => 'Szybki rzut bez dobierania do';

  @override
  String get ruleSteal => 'Kradzież po wahaniu dłuższym niż';

  @override
  String get gameSpeed => 'Szybkość gry';

  @override
  String get play => 'Graj';

  @override
  String get loadReplayFromClipboard => 'Wczytaj powtórkę ze schowka';

  @override
  String get noReplayInClipboard => 'W schowku nie ma powtórki Kittens';

  @override
  String get replayCopied => 'Powtórka skopiowana do schowka';

  @override
  String get replayTitle => 'Powtórka';

  @override
  String get seatYou => 'Ty';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Człowiek';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pauza';

  @override
  String reactionFixed(String duration) {
    return 'Reakcja $duration';
  }

  @override
  String get reactionRandom => 'Reakcja losowa';

  @override
  String get botIqSmart => 'Gra mądrze';

  @override
  String get botIqFirstValid => 'Pierwsza pasująca';

  @override
  String get botIqSloppy => 'Myli się w 20 %';

  @override
  String get colorRed => 'czerwona';

  @override
  String get colorGreen => 'zielona';

  @override
  String get colorBlue => 'niebieska';

  @override
  String get colorYellow => 'żółta';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Podstawowa';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Rozbrój';

  @override
  String get cardDetonate => 'Odpal';

  @override
  String get cardNope => 'Nie!';

  @override
  String get cardShield => 'Tarcza';

  @override
  String get cardSteal => 'Kradzież';

  @override
  String get cardTwist => 'Odwróć';

  @override
  String get cardBlind => 'Ślepa';

  @override
  String get rejectNotYourTurn => 'To nie twój ruch';

  @override
  String get rejectCardNotInHand => 'Nie masz już tej karty';

  @override
  String get rejectInvalidTarget => 'Nie można wybrać tego gracza';

  @override
  String get rejectNotAReaction => 'Tę kartę rzuca się na talię';

  @override
  String get rejectGhost => 'Duch może zagrać tylko Nie!';

  @override
  String get rejectNotGhost => 'Nie! bez karty ma tylko duch';

  @override
  String get rejectGhostNopeUsed =>
      'Nie! ducha zostało już użyte w tej rundzie';

  @override
  String get rejectGhostNeedsCard => 'Duch potrzebuje karty Nie!';

  @override
  String get rejectNothingToNope => 'Nie ma czego anulować';

  @override
  String get rejectNoPendingLoss => 'Na tarczę jest już za późno';

  @override
  String get rejectOwnTurn => 'Nie można ukraść własnego ruchu';

  @override
  String rejectTooEarly(String duration) {
    return 'Kraść można dopiero po $duration wahania';
  }

  @override
  String get rejectGameOver => 'Gra się skończyła';

  @override
  String get rejectOther => 'Polecenie odrzucone';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card w $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card w $duration, dobiera $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card nie pasuje';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: czas minął';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: kradzież ruchu ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nie! na $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nie! nie zadziałało';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomba się wynurzyła, lont $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomba wybuchła: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Rozbrój';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Odpal na $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Tarcza';
  }

  @override
  String captionGhost(String player) {
    return '$player jest duchem';
  }

  @override
  String get hintDetonate =>
      'Przeciągnij Odpal na gracza, który dostanie bombę';

  @override
  String get hintSteal => 'Przeciągnij Kradzież na gracza, który ma ruch';

  @override
  String toastInvalidCard(int count) {
    return 'Zła karta: tracisz życie i dobierasz $count';
  }

  @override
  String get toastTimeOut => 'Czas minął';

  @override
  String toastShieldWindow(String duration) {
    return 'Tarcza w ciągu $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: kradzież twojego ruchu';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player odpalił na ciebie bombę';
  }

  @override
  String get toastNopeReturns => 'Nie! zwraca ruch tobie';

  @override
  String get yourTurn => 'Twój ruch';

  @override
  String onTurn(String player) {
    return 'Ruch: $player';
  }

  @override
  String deckCount(int count) {
    return 'Talia $count';
  }

  @override
  String ghostName(String name) {
    return '$name (duch)';
  }

  @override
  String get ghostNope => 'Nie! ducha';

  @override
  String get startHelp =>
      'Rzuć kartę tego samego koloru lub numeru przez linię nad talią. Nie! i Tarczę przeciągnij w bok, Odpal i Kradzież na gracza.';

  @override
  String get start => 'Zacznij';

  @override
  String get youWin => 'Wygrywasz';

  @override
  String get nobodySurvived => 'Nikt nie przeżył';

  @override
  String playerWins(String player) {
    return '$player wygrywa';
  }

  @override
  String get playAgain => 'Zagraj ponownie';

  @override
  String get copyReplay => 'Kopiuj powtórkę';

  @override
  String get gameSettings => 'Ustawienia gry';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, zostanie $fuse ruchu',
      many: 'Bomba, zostało $fuse ruchów',
      few: 'Bomba, zostały $fuse ruchy',
      one: 'Bomba, został $fuse ruch',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Wznów';

  @override
  String get pause => 'Wstrzymaj';

  @override
  String get debug => 'Debugowanie';

  @override
  String get sectionTime => 'Czas';

  @override
  String get step => 'Krok';

  @override
  String gameClock(String duration, int round) {
    return 'Czas gry $duration, runda $round';
  }

  @override
  String get artificialLatency => 'Sztuczne opóźnienie';

  @override
  String get followTurn => 'Widok śledzi gracza, który ma ruch';

  @override
  String get followTurnHint => 'Tylko miejsca sterowane przez człowieka';

  @override
  String get sectionForceCard => 'Wymuś kartę';

  @override
  String get number => 'Numer';

  @override
  String get giveToHand => 'Daj do ręki';

  @override
  String get setAsTarget => 'Ustaw jako cel';

  @override
  String get sectionBombAndLimit => 'Bomba i limit ruchu';

  @override
  String get noBomb => 'Bez bomby';

  @override
  String fuseValue(int fuse) {
    return 'Lont $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limit w 1. rundzie (teraz $duration)';
  }

  @override
  String get loadFromClipboard => 'Wczytaj ze schowka';

  @override
  String get sectionEvents => 'Zdarzenia';

  @override
  String get endGame => 'Zakończ grę';

  @override
  String get removeLife => 'Zabierz życie';

  @override
  String get addLife => 'Dodaj życie';
}
