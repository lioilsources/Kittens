// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get tagline => 'Dobd el a megfelelő kártyát, mielőtt leég a kanóc.';

  @override
  String get sectionPlayers => 'Játékosok';

  @override
  String get sectionRules => 'Szabályok';

  @override
  String get sectionScenarios => 'Forgatókönyvek';

  @override
  String get ruleTurnLimit => 'Lépéskorlát az 1. körben';

  @override
  String get ruleFastThrow => 'Gyors dobás húzás nélkül eddig:';

  @override
  String get ruleSteal => 'Lopás, ha a habozás hosszabb, mint';

  @override
  String get gameSpeed => 'Játéksebesség';

  @override
  String get play => 'Játék';

  @override
  String get loadReplayFromClipboard => 'Visszajátszás betöltése a vágólapról';

  @override
  String get noReplayInClipboard => 'A vágólapon nincs Kittens-visszajátszás';

  @override
  String get replayCopied => 'A visszajátszás a vágólapon van';

  @override
  String get replayTitle => 'Visszajátszás';

  @override
  String get seatYou => 'Te';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Ember';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Szünet';

  @override
  String reactionFixed(String duration) {
    return 'Reakció $duration';
  }

  @override
  String get reactionRandom => 'Véletlen reakció';

  @override
  String get botIqSmart => 'Okosan játszik';

  @override
  String get botIqFirstValid => 'Első érvényes';

  @override
  String get botIqSloppy => '20 %-ban téved';

  @override
  String get colorRed => 'piros';

  @override
  String get colorGreen => 'zöld';

  @override
  String get colorBlue => 'kék';

  @override
  String get colorYellow => 'sárga';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Alap';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Hatástalanít';

  @override
  String get cardDetonate => 'Felrobbant';

  @override
  String get cardNope => 'Nem!';

  @override
  String get cardShield => 'Pajzs';

  @override
  String get cardSteal => 'Lopás';

  @override
  String get cardTwist => 'Megfordít';

  @override
  String get cardBlind => 'Vak';

  @override
  String get rejectNotYourTurn => 'Nem te jössz';

  @override
  String get rejectCardNotInHand => 'Ez a kártya már nincs nálad';

  @override
  String get rejectInvalidTarget => 'Ezt a játékost nem lehet célozni';

  @override
  String get rejectNotAReaction => 'Ezt a kártyát a paklira dobják';

  @override
  String get rejectGhost => 'A szellem csak Nem!-et játszhat';

  @override
  String get rejectNotGhost => 'Kártya nélküli Nem!-je csak a szellemnek van';

  @override
  String get rejectGhostNopeUsed =>
      'A szellem Nem!-je már elfogyott ebben a körben';

  @override
  String get rejectGhostNeedsCard => 'A szellemnek Nem! kártya kell';

  @override
  String get rejectNothingToNope => 'Nincs mit visszavonni';

  @override
  String get rejectNoPendingLoss => 'A pajzshoz már késő';

  @override
  String get rejectOwnTurn => 'A saját lépésedet nem lophatod el';

  @override
  String rejectTooEarly(String duration) {
    return 'Lopni csak $duration habozás után lehet';
  }

  @override
  String get rejectGameOver => 'A játék véget ért';

  @override
  String get rejectOther => 'A parancs elutasítva';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $duration alatt';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $duration alatt, húz $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card nem érvényes';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: lejárt az idő';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: lépéslopás ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nem! erre: $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: a Nem! kudarcot vallott';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'A bomba felbukkant, kanóc $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'A bomba felrobbant: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Hatástalanít';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Felrobbant ide: $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Pajzs';
  }

  @override
  String captionGhost(String player) {
    return '$player szellem';
  }

  @override
  String get hintDetonate =>
      'A Felrobbant kártyát húzd arra, aki a bombát kapja';

  @override
  String get hintSteal => 'A Lopás kártyát húzd arra, aki éppen lép';

  @override
  String toastInvalidCard(int count) {
    return 'Érvénytelen kártya: elveszítesz egy életet és húzol $count-t';
  }

  @override
  String get toastTimeOut => 'Lejárt az idő';

  @override
  String toastShieldWindow(String duration) {
    return 'Pajzs $duration alatt!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: ellopta a lépésedet';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player rád küldte a bombát';
  }

  @override
  String get toastNopeReturns => 'A Nem! visszaadja neked a lépést';

  @override
  String get yourTurn => 'Te jössz';

  @override
  String onTurn(String player) {
    return 'Soron: $player';
  }

  @override
  String deckCount(int count) {
    return 'Pakli $count';
  }

  @override
  String ghostName(String name) {
    return '$name (szellem)';
  }

  @override
  String get ghostNope => 'Szellem Nem!';

  @override
  String get startHelp =>
      'Dobj azonos színű vagy számú kártyát a pakli feletti vonalon át. A Nem!-et és a Pajzsot húzd oldalra, a Felrobbant és a Lopás kártyát egy játékosra.';

  @override
  String get start => 'Kezdés';

  @override
  String get youWin => 'Nyersz';

  @override
  String get nobodySurvived => 'Senki sem élte túl';

  @override
  String playerWins(String player) {
    return '$player nyer';
  }

  @override
  String get playAgain => 'Újra';

  @override
  String get copyReplay => 'Visszajátszás másolása';

  @override
  String get gameSettings => 'Játékbeállítások';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, $fuse lépés van hátra',
      one: 'Bomba, $fuse lépés van hátra',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Folytatás';

  @override
  String get pause => 'Szünet';

  @override
  String get debug => 'Hibakeresés';

  @override
  String get sectionTime => 'Idő';

  @override
  String get step => 'Lépés';

  @override
  String gameClock(String duration, int round) {
    return 'Játékidő $duration, $round. kör';
  }

  @override
  String get artificialLatency => 'Mesterséges késleltetés';

  @override
  String get followTurn => 'A nézet a soron lévő játékost követi';

  @override
  String get followTurnHint => 'Csak az ember által vezérelt helyek';

  @override
  String get sectionForceCard => 'Kártya ráerőltetése';

  @override
  String get number => 'Szám';

  @override
  String get giveToHand => 'Kézbe adás';

  @override
  String get setAsTarget => 'Beállítás célpontnak';

  @override
  String get sectionBombAndLimit => 'Bomba és lépéskorlát';

  @override
  String get noBomb => 'Bomba nélkül';

  @override
  String fuseValue(int fuse) {
    return 'Kanóc $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Korlát az 1. körben (most $duration)';
  }

  @override
  String get loadFromClipboard => 'Betöltés a vágólapról';

  @override
  String get sectionEvents => 'Események';

  @override
  String get endGame => 'Játék befejezése';

  @override
  String get removeLife => 'Élet elvétele';

  @override
  String get addLife => 'Élet hozzáadása';
}
