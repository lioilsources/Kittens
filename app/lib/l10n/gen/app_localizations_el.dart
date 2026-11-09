// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get tagline => 'Ρίξε τη σωστή κάρτα πριν καεί το φυτίλι.';

  @override
  String get sectionPlayers => 'Παίκτες';

  @override
  String get sectionRules => 'Κανόνες';

  @override
  String get sectionScenarios => 'Σενάρια';

  @override
  String get ruleTurnLimit => 'Όριο κίνησης στον 1ο γύρο';

  @override
  String get ruleFastThrow => 'Γρήγορη ρίψη χωρίς τράβηγμα μέχρι';

  @override
  String get ruleSteal => 'Κλοπή μετά από δισταγμό μεγαλύτερο από';

  @override
  String get gameSpeed => 'Ταχύτητα παιχνιδιού';

  @override
  String get play => 'Παίξε';

  @override
  String get loadReplayFromClipboard => 'Φόρτωση επανάληψης από το πρόχειρο';

  @override
  String get noReplayInClipboard =>
      'Δεν υπάρχει επανάληψη Kittens στο πρόχειρο';

  @override
  String get replayCopied => 'Η επανάληψη είναι στο πρόχειρο';

  @override
  String get replayTitle => 'Επανάληψη';

  @override
  String get seatYou => 'Εσύ';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Άνθρωπος';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Παύση';

  @override
  String reactionFixed(String duration) {
    return 'Αντίδραση $duration';
  }

  @override
  String get reactionRandom => 'Τυχαία αντίδραση';

  @override
  String get botIqSmart => 'Παίζει έξυπνα';

  @override
  String get botIqFirstValid => 'Πρώτη έγκυρη';

  @override
  String get botIqSloppy => 'Κάνει λάθη 20 %';

  @override
  String get colorRed => 'κόκκινη';

  @override
  String get colorGreen => 'πράσινη';

  @override
  String get colorBlue => 'μπλε';

  @override
  String get colorYellow => 'κίτρινη';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Βασική';

  @override
  String get cardBomb => 'Βόμβα';

  @override
  String get cardDefuse => 'Εξουδετέρωση';

  @override
  String get cardDetonate => 'Πυροδότηση';

  @override
  String get cardNope => 'Όχι!';

  @override
  String get cardShield => 'Ασπίδα';

  @override
  String get cardSteal => 'Κλοπή';

  @override
  String get cardTwist => 'Αντιστροφή';

  @override
  String get cardBlind => 'Τυφλή';

  @override
  String get rejectNotYourTurn => 'Δεν είναι η σειρά σου';

  @override
  String get rejectCardNotInHand => 'Δεν έχεις πια αυτήν την κάρτα';

  @override
  String get rejectInvalidTarget =>
      'Δεν μπορείς να στοχεύσεις αυτόν τον παίκτη';

  @override
  String get rejectNotAReaction => 'Αυτή η κάρτα ρίχνεται στην τράπουλα';

  @override
  String get rejectGhost => 'Το φάντασμα μπορεί να παίξει μόνο Όχι!';

  @override
  String get rejectNotGhost => 'Όχι! χωρίς κάρτα έχει μόνο το φάντασμα';

  @override
  String get rejectGhostNopeUsed =>
      'Το Όχι! του φαντάσματος χρησιμοποιήθηκε ήδη αυτόν τον γύρο';

  @override
  String get rejectGhostNeedsCard => 'Το φάντασμα χρειάζεται κάρτα Όχι!';

  @override
  String get rejectNothingToNope => 'Δεν υπάρχει τίποτα να ακυρωθεί';

  @override
  String get rejectNoPendingLoss => 'Είναι πολύ αργά για Ασπίδα';

  @override
  String get rejectOwnTurn => 'Δεν μπορείς να κλέψεις τη δική σου κίνηση';

  @override
  String rejectTooEarly(String duration) {
    return 'Η κλοπή επιτρέπεται μόνο μετά από $duration δισταγμού';
  }

  @override
  String get rejectGameOver => 'Το παιχνίδι τελείωσε';

  @override
  String get rejectOther => 'Η εντολή απορρίφθηκε';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card σε $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card σε $duration, τραβά $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: η $card δεν ισχύει';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: τελείωσε ο χρόνος';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: κλοπή κίνησης ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Όχι! στην $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: το Όχι! απέτυχε';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Η βόμβα ανέβηκε στην επιφάνεια, φυτίλι $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Η βόμβα εξερράγη: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Εξουδετέρωση';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Πυροδότηση σε $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Ασπίδα';
  }

  @override
  String captionGhost(String player) {
    return 'ο/η $player είναι φάντασμα';
  }

  @override
  String get hintDetonate =>
      'Σύρε την Πυροδότηση στον παίκτη που θα πάρει τη βόμβα';

  @override
  String get hintSteal => 'Σύρε την Κλοπή στον παίκτη που έχει τη σειρά';

  @override
  String toastInvalidCard(int count) {
    return 'Άκυρη κάρτα: χάνεις μια ζωή και τραβάς $count';
  }

  @override
  String get toastTimeOut => 'Τελείωσε ο χρόνος';

  @override
  String toastShieldWindow(String duration) {
    return 'Ασπίδα μέσα σε $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: έκλεψε την κίνησή σου';
  }

  @override
  String toastBombOnYou(String player) {
    return 'ο/η $player σου έστειλε τη βόμβα';
  }

  @override
  String get toastNopeReturns => 'Το Όχι! σου γυρίζει την κίνηση';

  @override
  String get yourTurn => 'Η σειρά σου';

  @override
  String onTurn(String player) {
    return 'Σειρά: $player';
  }

  @override
  String deckCount(int count) {
    return 'Τράπουλα $count';
  }

  @override
  String ghostName(String name) {
    return '$name (φάντασμα)';
  }

  @override
  String get ghostNope => 'Όχι! φαντάσματος';

  @override
  String get startHelp =>
      'Ρίξε κάρτα ίδιου χρώματος ή αριθμού πάνω από τη γραμμή πάνω από την τράπουλα. Σύρε Όχι! και Ασπίδα στο πλάι, Πυροδότηση και Κλοπή σε παίκτη.';

  @override
  String get start => 'Έναρξη';

  @override
  String get youWin => 'Κερδίζεις';

  @override
  String get nobodySurvived => 'Κανείς δεν επέζησε';

  @override
  String playerWins(String player) {
    return 'Κερδίζει ο/η $player';
  }

  @override
  String get playAgain => 'Παίξε ξανά';

  @override
  String get copyReplay => 'Αντιγραφή επανάληψης';

  @override
  String get gameSettings => 'Ρυθμίσεις παιχνιδιού';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Βόμβα, απομένουν $fuse κινήσεις',
      one: 'Βόμβα, απομένει $fuse κίνηση',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Συνέχεια';

  @override
  String get pause => 'Παύση';

  @override
  String get debug => 'Εντοπισμός σφαλμάτων';

  @override
  String get sectionTime => 'Χρόνος';

  @override
  String get step => 'Βήμα';

  @override
  String gameClock(String duration, int round) {
    return 'Χρόνος παιχνιδιού $duration, γύρος $round';
  }

  @override
  String get artificialLatency => 'Τεχνητή καθυστέρηση';

  @override
  String get followTurn => 'Η προβολή ακολουθεί τον παίκτη που έχει τη σειρά';

  @override
  String get followTurnHint => 'Μόνο θέσεις που ελέγχει άνθρωπος';

  @override
  String get sectionForceCard => 'Επιβολή κάρτας';

  @override
  String get number => 'Αριθμός';

  @override
  String get giveToHand => 'Δώσε στο χέρι';

  @override
  String get setAsTarget => 'Ορισμός ως στόχου';

  @override
  String get sectionBombAndLimit => 'Βόμβα και όριο κίνησης';

  @override
  String get noBomb => 'Χωρίς βόμβα';

  @override
  String fuseValue(int fuse) {
    return 'Φυτίλι $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Όριο στον 1ο γύρο (τώρα $duration)';
  }

  @override
  String get loadFromClipboard => 'Φόρτωση από το πρόχειρο';

  @override
  String get sectionEvents => 'Συμβάντα';

  @override
  String get endGame => 'Τέλος παιχνιδιού';

  @override
  String get removeLife => 'Αφαίρεση ζωής';

  @override
  String get addLife => 'Προσθήκη ζωής';
}
