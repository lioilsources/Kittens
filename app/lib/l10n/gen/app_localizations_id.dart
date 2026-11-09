// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get tagline =>
      'Lempar kartu yang tepat sebelum sumbunya habis terbakar.';

  @override
  String get sectionPlayers => 'Pemain';

  @override
  String get sectionRules => 'Aturan';

  @override
  String get sectionScenarios => 'Skenario';

  @override
  String get ruleTurnLimit => 'Batas giliran di ronde 1';

  @override
  String get ruleFastThrow => 'Lempar cepat tanpa ambil kartu hingga';

  @override
  String get ruleSteal => 'Curi setelah ragu lebih dari';

  @override
  String get gameSpeed => 'Kecepatan permainan';

  @override
  String get play => 'Main';

  @override
  String get loadReplayFromClipboard => 'Muat replay dari papan klip';

  @override
  String get noReplayInClipboard => 'Tidak ada replay Kittens di papan klip';

  @override
  String get replayCopied => 'Replay ada di papan klip';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'Kamu';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Manusia';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Jeda';

  @override
  String reactionFixed(String duration) {
    return 'Reaksi $duration';
  }

  @override
  String get reactionRandom => 'Reaksi acak';

  @override
  String get botIqSmart => 'Bermain cerdik';

  @override
  String get botIqFirstValid => 'Yang pertama sah';

  @override
  String get botIqSloppy => 'Salah 20%';

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
  String get cardNumber => 'Dasar';

  @override
  String get cardBomb => 'Bom';

  @override
  String get cardDefuse => 'Jinakkan';

  @override
  String get cardDetonate => 'Ledakkan';

  @override
  String get cardNope => 'Tidak!';

  @override
  String get cardShield => 'Perisai';

  @override
  String get cardSteal => 'Curi';

  @override
  String get cardTwist => 'Balik';

  @override
  String get cardBlind => 'Buta';

  @override
  String get rejectNotYourTurn => 'Bukan giliranmu';

  @override
  String get rejectCardNotInHand => 'Kartu ini sudah tidak ada di tanganmu';

  @override
  String get rejectInvalidTarget => 'Pemain ini tidak bisa dijadikan target';

  @override
  String get rejectNotAReaction => 'Kartu ini dilempar ke tumpukan';

  @override
  String get rejectGhost => 'Hantu hanya boleh memainkan Tidak!';

  @override
  String get rejectNotGhost => 'Tidak! tanpa kartu hanya milik hantu';

  @override
  String get rejectGhostNopeUsed =>
      'Tidak! milik hantu sudah terpakai di ronde ini';

  @override
  String get rejectGhostNeedsCard => 'Hantu membutuhkan kartu Tidak!';

  @override
  String get rejectNothingToNope => 'Tidak ada yang bisa dibatalkan';

  @override
  String get rejectNoPendingLoss => 'Terlambat untuk Perisai';

  @override
  String get rejectOwnTurn => 'Giliran sendiri tidak bisa dicuri';

  @override
  String rejectTooEarly(String duration) {
    return 'Mencuri baru bisa setelah ragu $duration';
  }

  @override
  String get rejectGameOver => 'Permainan selesai';

  @override
  String get rejectOther => 'Perintah ditolak';

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
    return '$player: waktu habis';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: mencuri giliran ($victim)';
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
    return 'Bom meledak: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Jinakkan';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Ledakkan ke $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Perisai';
  }

  @override
  String captionGhost(String player) {
    return '$player adalah hantu';
  }

  @override
  String get hintDetonate => 'Seret Ledakkan ke pemain yang akan menerima bom';

  @override
  String get hintSteal => 'Seret Curi ke pemain yang sedang giliran';

  @override
  String toastInvalidCard(int count) {
    return 'Kartu tidak sah: kamu kehilangan satu nyawa dan ambil $count';
  }

  @override
  String get toastTimeOut => 'Waktu habis';

  @override
  String toastShieldWindow(String duration) {
    return 'Perisai dalam $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: mencuri giliranmu';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player mengirim bom ke kamu';
  }

  @override
  String get toastNopeReturns => 'Tidak! mengembalikan giliran kepadamu';

  @override
  String get yourTurn => 'Giliranmu';

  @override
  String onTurn(String player) {
    return 'Giliran: $player';
  }

  @override
  String deckCount(int count) {
    return 'Tumpukan $count';
  }

  @override
  String ghostName(String name) {
    return '$name (hantu)';
  }

  @override
  String get ghostNope => 'Tidak! hantu';

  @override
  String get startHelp =>
      'Lempar kartu dengan warna atau angka yang sama melewati garis di atas tumpukan. Geser Tidak! dan Perisai ke samping, seret Ledakkan dan Curi ke pemain.';

  @override
  String get start => 'Mulai';

  @override
  String get youWin => 'Kamu menang';

  @override
  String get nobodySurvived => 'Tidak ada yang selamat';

  @override
  String playerWins(String player) {
    return '$player menang';
  }

  @override
  String get playAgain => 'Main lagi';

  @override
  String get copyReplay => 'Salin replay';

  @override
  String get gameSettings => 'Pengaturan permainan';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bom, sisa $fuse giliran',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Lanjutkan';

  @override
  String get pause => 'Jeda';

  @override
  String get debug => 'Debug';

  @override
  String get sectionTime => 'Waktu';

  @override
  String get step => 'Langkah';

  @override
  String gameClock(String duration, int round) {
    return 'Waktu permainan $duration, ronde $round';
  }

  @override
  String get artificialLatency => 'Latensi buatan';

  @override
  String get followTurn => 'Tampilan mengikuti pemain yang sedang giliran';

  @override
  String get followTurnHint => 'Hanya kursi yang dikendalikan manusia';

  @override
  String get sectionForceCard => 'Paksa kartu';

  @override
  String get number => 'Angka';

  @override
  String get giveToHand => 'Beri ke tangan';

  @override
  String get setAsTarget => 'Jadikan target';

  @override
  String get sectionBombAndLimit => 'Bom dan batas giliran';

  @override
  String get noBomb => 'Tanpa bom';

  @override
  String fuseValue(int fuse) {
    return 'Sumbu $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Batas di ronde 1 (sekarang $duration)';
  }

  @override
  String get loadFromClipboard => 'Muat dari papan klip';

  @override
  String get sectionEvents => 'Peristiwa';

  @override
  String get endGame => 'Akhiri permainan';

  @override
  String get removeLife => 'Kurangi nyawa';

  @override
  String get addLife => 'Tambah nyawa';
}
