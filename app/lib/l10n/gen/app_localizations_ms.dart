// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get tagline => 'Lempar kad yang betul sebelum sumbu habis terbakar.';

  @override
  String get sectionPlayers => 'Pemain';

  @override
  String get sectionRules => 'Peraturan';

  @override
  String get sectionScenarios => 'Senario';

  @override
  String get ruleTurnLimit => 'Had giliran pada pusingan 1';

  @override
  String get ruleFastThrow => 'Lontaran pantas tanpa ambil sehingga';

  @override
  String get ruleSteal => 'Curi selepas teragak-agak lebih daripada';

  @override
  String get gameSpeed => 'Kelajuan permainan';

  @override
  String get play => 'Main';

  @override
  String get loadReplayFromClipboard =>
      'Muat ulang tayang daripada papan keratan';

  @override
  String get noReplayInClipboard =>
      'Tiada ulang tayang Kittens dalam papan keratan';

  @override
  String get replayCopied => 'Ulang tayang ada dalam papan keratan';

  @override
  String get replayTitle => 'Ulang tayang';

  @override
  String get seatYou => 'Anda';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Manusia';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Dijeda';

  @override
  String reactionFixed(String duration) {
    return 'Reaksi $duration';
  }

  @override
  String get reactionRandom => 'Reaksi rawak';

  @override
  String get botIqSmart => 'Bermain bijak';

  @override
  String get botIqFirstValid => 'Yang pertama sah';

  @override
  String get botIqSloppy => 'Silap 20%';

  @override
  String get colorRed => 'merah';

  @override
  String get colorGreen => 'hijau';

  @override
  String get colorBlue => 'biru';

  @override
  String get colorYellow => 'kuning';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Asas';

  @override
  String get cardBomb => 'Bom';

  @override
  String get cardDefuse => 'Jinakkan';

  @override
  String get cardDetonate => 'Letupkan';

  @override
  String get cardNope => 'Tidak!';

  @override
  String get cardShield => 'Perisai';

  @override
  String get cardSteal => 'Curi';

  @override
  String get cardTwist => 'Terbalikkan';

  @override
  String get cardBlind => 'Buta';

  @override
  String get rejectNotYourTurn => 'Bukan giliran anda';

  @override
  String get rejectCardNotInHand => 'Anda tidak lagi memegang kad ini';

  @override
  String get rejectInvalidTarget => 'Pemain ini tidak boleh disasarkan';

  @override
  String get rejectNotAReaction => 'Kad ini dilontar ke atas dek';

  @override
  String get rejectGhost => 'Hantu hanya boleh bermain Tidak!';

  @override
  String get rejectNotGhost => 'Tidak! tanpa kad hanya milik hantu';

  @override
  String get rejectGhostNopeUsed =>
      'Tidak! hantu sudah digunakan pada pusingan ini';

  @override
  String get rejectGhostNeedsCard => 'Hantu perlukan kad Tidak!';

  @override
  String get rejectNothingToNope => 'Tiada apa untuk dibatalkan';

  @override
  String get rejectNoPendingLoss => 'Sudah terlambat untuk Perisai';

  @override
  String get rejectOwnTurn => 'Giliran sendiri tidak boleh dicuri';

  @override
  String rejectTooEarly(String duration) {
    return 'Mencuri hanya boleh selepas teragak-agak $duration';
  }

  @override
  String get rejectGameOver => 'Permainan tamat';

  @override
  String get rejectOther => 'Arahan ditolak';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card dalam $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card dalam $duration, ambil $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card tidak sah';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: masa tamat';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: curi giliran ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Tidak! pada $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Tidak! gagal';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bom muncul, sumbu $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bom meletup: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Jinakkan';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Letupkan ke $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Perisai';
  }

  @override
  String captionGhost(String player) {
    return '$player ialah hantu';
  }

  @override
  String get hintDetonate => 'Seret Letupkan ke pemain yang akan menerima bom';

  @override
  String get hintSteal => 'Seret Curi ke pemain yang sedang bergiliran';

  @override
  String toastInvalidCard(int count) {
    return 'Kad tidak sah: anda hilang satu nyawa dan ambil $count';
  }

  @override
  String get toastTimeOut => 'Masa tamat';

  @override
  String toastShieldWindow(String duration) {
    return 'Perisai dalam $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: mencuri giliran anda';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player menghantar bom kepada anda';
  }

  @override
  String get toastNopeReturns => 'Tidak! memulangkan giliran kepada anda';

  @override
  String get yourTurn => 'Giliran anda';

  @override
  String onTurn(String player) {
    return 'Giliran: $player';
  }

  @override
  String deckCount(int count) {
    return 'Dek $count';
  }

  @override
  String ghostName(String name) {
    return '$name (hantu)';
  }

  @override
  String get ghostNope => 'Tidak! hantu';

  @override
  String get startHelp =>
      'Lontar kad yang sama warna atau nombor merentasi garisan di atas dek. Leret Tidak! dan Perisai ke tepi, seret Letupkan dan Curi ke pemain.';

  @override
  String get start => 'Mula';

  @override
  String get youWin => 'Anda menang';

  @override
  String get nobodySurvived => 'Tiada yang terselamat';

  @override
  String playerWins(String player) {
    return '$player menang';
  }

  @override
  String get playAgain => 'Main lagi';

  @override
  String get copyReplay => 'Salin ulang tayang';

  @override
  String get gameSettings => 'Tetapan permainan';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bom, tinggal $fuse giliran',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Sambung';

  @override
  String get pause => 'Jeda';

  @override
  String get debug => 'Nyahpepijat';

  @override
  String get sectionTime => 'Masa';

  @override
  String get step => 'Langkah';

  @override
  String gameClock(String duration, int round) {
    return 'Masa permainan $duration, pusingan $round';
  }

  @override
  String get artificialLatency => 'Kependaman buatan';

  @override
  String get followTurn => 'Paparan mengikuti pemain yang bergiliran';

  @override
  String get followTurnHint => 'Hanya tempat yang dikawal manusia';

  @override
  String get sectionForceCard => 'Paksa kad';

  @override
  String get number => 'Nombor';

  @override
  String get giveToHand => 'Beri ke tangan';

  @override
  String get setAsTarget => 'Tetapkan sebagai sasaran';

  @override
  String get sectionBombAndLimit => 'Bom dan had giliran';

  @override
  String get noBomb => 'Tanpa bom';

  @override
  String fuseValue(int fuse) {
    return 'Sumbu $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Had pada pusingan 1 (kini $duration)';
  }

  @override
  String get loadFromClipboard => 'Muat daripada papan keratan';

  @override
  String get sectionEvents => 'Peristiwa';

  @override
  String get endGame => 'Tamatkan permainan';

  @override
  String get removeLife => 'Kurangkan nyawa';

  @override
  String get addLife => 'Tambah nyawa';
}
