// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get tagline =>
      'Aruncă cartea potrivită înainte să se consume fitilul.';

  @override
  String get sectionPlayers => 'Jucători';

  @override
  String get sectionRules => 'Reguli';

  @override
  String get sectionScenarios => 'Scenarii';

  @override
  String get ruleTurnLimit => 'Limita mutării în runda 1';

  @override
  String get ruleFastThrow => 'Aruncare rapidă fără tragere până la';

  @override
  String get ruleSteal => 'Furt după ezitare mai lungă de';

  @override
  String get gameSpeed => 'Viteza jocului';

  @override
  String get play => 'Joacă';

  @override
  String get loadReplayFromClipboard => 'Încarcă reluarea din clipboard';

  @override
  String get noReplayInClipboard =>
      'Nu există nicio reluare Kittens în clipboard';

  @override
  String get replayCopied => 'Reluarea e în clipboard';

  @override
  String get replayTitle => 'Reluare';

  @override
  String get seatYou => 'Tu';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Om';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Pauză';

  @override
  String reactionFixed(String duration) {
    return 'Reacție $duration';
  }

  @override
  String get reactionRandom => 'Reacție aleatorie';

  @override
  String get botIqSmart => 'Joacă inteligent';

  @override
  String get botIqFirstValid => 'Prima validă';

  @override
  String get botIqSloppy => 'Greșește 20 %';

  @override
  String get colorRed => 'roșie';

  @override
  String get colorGreen => 'verde';

  @override
  String get colorBlue => 'albastră';

  @override
  String get colorYellow => 'galbenă';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Simplă';

  @override
  String get cardBomb => 'Bombă';

  @override
  String get cardDefuse => 'Dezamorsează';

  @override
  String get cardDetonate => 'Detonează';

  @override
  String get cardNope => 'Nu!';

  @override
  String get cardShield => 'Scut';

  @override
  String get cardSteal => 'Furt';

  @override
  String get cardTwist => 'Răstoarnă';

  @override
  String get cardBlind => 'Oarbă';

  @override
  String get rejectNotYourTurn => 'Nu e rândul tău';

  @override
  String get rejectCardNotInHand => 'Nu mai ai această carte';

  @override
  String get rejectInvalidTarget => 'Nu poți alege acest jucător';

  @override
  String get rejectNotAReaction => 'Această carte se aruncă pe pachet';

  @override
  String get rejectGhost => 'Fantoma poate juca doar Nu!';

  @override
  String get rejectNotGhost => 'Nu! fără carte are doar fantoma';

  @override
  String get rejectGhostNopeUsed =>
      'Nu!-ul fantomei a fost deja folosit în runda asta';

  @override
  String get rejectGhostNeedsCard => 'Fantoma are nevoie de o carte Nu!';

  @override
  String get rejectNothingToNope => 'Nu e nimic de anulat';

  @override
  String get rejectNoPendingLoss => 'E prea târziu pentru Scut';

  @override
  String get rejectOwnTurn => 'Nu-ți poți fura propria mutare';

  @override
  String rejectTooEarly(String duration) {
    return 'Poți fura abia după $duration de ezitare';
  }

  @override
  String get rejectGameOver => 'Jocul s-a terminat';

  @override
  String get rejectOther => 'Comandă respinsă';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card în $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card în $duration, trage $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card nu e validă';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: timpul a expirat';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: Furt de mutare ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nu! pe $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nu! a eșuat';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomba a ieșit la suprafață, fitil $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomba a explodat: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Dezamorsează';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Detonează pe $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Scut';
  }

  @override
  String captionGhost(String player) {
    return '$player e fantomă';
  }

  @override
  String get hintDetonate => 'Trage Detonează pe jucătorul care primește bomba';

  @override
  String get hintSteal => 'Trage Furt pe jucătorul al cărui rând este';

  @override
  String toastInvalidCard(int count) {
    return 'Carte nevalidă: pierzi o viață și tragi $count';
  }

  @override
  String get toastTimeOut => 'Timpul a expirat';

  @override
  String toastShieldWindow(String duration) {
    return 'Scut în $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: Furt al mutării tale';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ți-a trimis bomba';
  }

  @override
  String get toastNopeReturns => 'Nu! îți returnează mutarea';

  @override
  String get yourTurn => 'Rândul tău';

  @override
  String onTurn(String player) {
    return 'La rând: $player';
  }

  @override
  String deckCount(int count) {
    return 'Pachet $count';
  }

  @override
  String ghostName(String name) {
    return '$name (fantomă)';
  }

  @override
  String get ghostNope => 'Nu!-ul fantomei';

  @override
  String get startHelp =>
      'Aruncă o carte de aceeași culoare sau număr peste linia de deasupra pachetului. Trage Nu! și Scut într-o parte, Detonează și Furt pe un jucător.';

  @override
  String get start => 'Începe';

  @override
  String get youWin => 'Câștigi';

  @override
  String get nobodySurvived => 'Nimeni nu a supraviețuit';

  @override
  String playerWins(String player) {
    return '$player câștigă';
  }

  @override
  String get playAgain => 'Joacă din nou';

  @override
  String get copyReplay => 'Copiază reluarea';

  @override
  String get gameSettings => 'Setările jocului';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bombă, au rămas $fuse de mutări',
      few: 'Bombă, au rămas $fuse mutări',
      one: 'Bombă, a rămas $fuse mutare',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Continuă';

  @override
  String get pause => 'Pauză';

  @override
  String get debug => 'Depanare';

  @override
  String get sectionTime => 'Timp';

  @override
  String get step => 'Pas';

  @override
  String gameClock(String duration, int round) {
    return 'Timp de joc $duration, runda $round';
  }

  @override
  String get artificialLatency => 'Latență artificială';

  @override
  String get followTurn => 'Vederea urmărește jucătorul la rând';

  @override
  String get followTurnHint => 'Doar locurile controlate de un om';

  @override
  String get sectionForceCard => 'Impune o carte';

  @override
  String get number => 'Număr';

  @override
  String get giveToHand => 'Pune în mână';

  @override
  String get setAsTarget => 'Setează ca țintă';

  @override
  String get sectionBombAndLimit => 'Bombă și limită de mutare';

  @override
  String get noBomb => 'Fără bombă';

  @override
  String fuseValue(int fuse) {
    return 'Fitil $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Limită în runda 1 (acum $duration)';
  }

  @override
  String get loadFromClipboard => 'Încarcă din clipboard';

  @override
  String get sectionEvents => 'Evenimente';

  @override
  String get endGame => 'Încheie jocul';

  @override
  String get removeLife => 'Ia o viață';

  @override
  String get addLife => 'Adaugă o viață';
}
