// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get tagline => 'Fitil bitmeden doğru kartı at.';

  @override
  String get sectionPlayers => 'Oyuncular';

  @override
  String get sectionRules => 'Kurallar';

  @override
  String get sectionScenarios => 'Senaryolar';

  @override
  String get ruleTurnLimit => '1. turda hamle sınırı';

  @override
  String get ruleFastThrow => 'Çekmeden hızlı atış, şu süreye kadar';

  @override
  String get ruleSteal => 'Şundan uzun tereddütten sonra çalma';

  @override
  String get gameSpeed => 'Oyun hızı';

  @override
  String get play => 'Oyna';

  @override
  String get loadReplayFromClipboard => 'Tekrarı panodan yükle';

  @override
  String get noReplayInClipboard => 'Panoda Kittens tekrarı yok';

  @override
  String get replayCopied => 'Tekrar panoda';

  @override
  String get replayTitle => 'Tekrar';

  @override
  String get seatYou => 'Sen';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'İnsan';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Duraklatıldı';

  @override
  String reactionFixed(String duration) {
    return 'Tepki $duration';
  }

  @override
  String get reactionRandom => 'Rastgele tepki';

  @override
  String get botIqSmart => 'Akıllı oynar';

  @override
  String get botIqFirstValid => 'İlk geçerli';

  @override
  String get botIqSloppy => '%20 hata yapar';

  @override
  String get colorRed => 'kırmızı';

  @override
  String get colorGreen => 'yeşil';

  @override
  String get colorBlue => 'mavi';

  @override
  String get colorYellow => 'sarı';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Temel';

  @override
  String get cardBomb => 'Bomba';

  @override
  String get cardDefuse => 'Etkisizleştir';

  @override
  String get cardDetonate => 'Patlat';

  @override
  String get cardNope => 'Hayır!';

  @override
  String get cardShield => 'Kalkan';

  @override
  String get cardSteal => 'Çalma';

  @override
  String get cardTwist => 'Ters çevir';

  @override
  String get cardBlind => 'Kör';

  @override
  String get rejectNotYourTurn => 'Sıra sende değil';

  @override
  String get rejectCardNotInHand => 'Bu kart artık sende yok';

  @override
  String get rejectInvalidTarget => 'Bu oyuncu hedef alınamaz';

  @override
  String get rejectNotAReaction => 'Bu kart desteye atılır';

  @override
  String get rejectGhost => 'Hayalet yalnızca Hayır! oynayabilir';

  @override
  String get rejectNotGhost => 'Kartsız Hayır! yalnızca hayalette var';

  @override
  String get rejectGhostNopeUsed => 'Hayaletin Hayır!’ı bu turda kullanıldı';

  @override
  String get rejectGhostNeedsCard => 'Hayaletin Hayır! kartına ihtiyacı var';

  @override
  String get rejectNothingToNope => 'İptal edilecek bir şey yok';

  @override
  String get rejectNoPendingLoss => 'Kalkan için artık çok geç';

  @override
  String get rejectOwnTurn => 'Kendi hamleni çalamazsın';

  @override
  String rejectTooEarly(String duration) {
    return 'Çalma ancak $duration tereddütten sonra mümkün';
  }

  @override
  String get rejectGameOver => 'Oyun bitti';

  @override
  String get rejectOther => 'Komut reddedildi';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $duration içinde';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $duration içinde, $count çeker';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card geçersiz';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: süre doldu';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: hamle çalma ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card üzerine Hayır!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Hayır! boşa çıktı';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'Bomba yüzeye çıktı, fitil $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'Bomba patladı: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Etkisizleştir';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target üzerine Patlat';
  }

  @override
  String captionShield(String player) {
    return '$player: Kalkan';
  }

  @override
  String captionGhost(String player) {
    return '$player hayalet';
  }

  @override
  String get hintDetonate =>
      'Patlat’ı bombayı alacak oyuncunun üzerine sürükle';

  @override
  String get hintSteal => 'Çalma’yı sırası olan oyuncunun üzerine sürükle';

  @override
  String toastInvalidCard(int count) {
    return 'Geçersiz kart: bir can kaybeder ve $count çekersin';
  }

  @override
  String get toastTimeOut => 'Süre doldu';

  @override
  String toastShieldWindow(String duration) {
    return '$duration içinde Kalkan!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: hamleni çaldı';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player bombayı sana yolladı';
  }

  @override
  String get toastNopeReturns => 'Hayır! hamleyi sana geri verir';

  @override
  String get yourTurn => 'Sıra sende';

  @override
  String onTurn(String player) {
    return 'Sıra: $player';
  }

  @override
  String deckCount(int count) {
    return 'Deste $count';
  }

  @override
  String ghostName(String name) {
    return '$name (hayalet)';
  }

  @override
  String get ghostNope => 'Hayaletin Hayır!’ı';

  @override
  String get startHelp =>
      'Destenin üstündeki çizgiden aynı renkte veya numarada bir kart at. Hayır! ve Kalkan’ı yana, Patlat ve Çalma’yı bir oyuncunun üzerine sürükle.';

  @override
  String get start => 'Başla';

  @override
  String get youWin => 'Kazandın';

  @override
  String get nobodySurvived => 'Kimse hayatta kalmadı';

  @override
  String playerWins(String player) {
    return '$player kazandı';
  }

  @override
  String get playAgain => 'Tekrar oyna';

  @override
  String get copyReplay => 'Tekrarı kopyala';

  @override
  String get gameSettings => 'Oyun ayarları';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomba, $fuse hamle kaldı',
      one: 'Bomba, $fuse hamle kaldı',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Devam et';

  @override
  String get pause => 'Duraklat';

  @override
  String get debug => 'Hata ayıklama';

  @override
  String get sectionTime => 'Süre';

  @override
  String get step => 'Adım';

  @override
  String gameClock(String duration, int round) {
    return 'Oyun süresi $duration, tur $round';
  }

  @override
  String get artificialLatency => 'Yapay gecikme';

  @override
  String get followTurn => 'Görünüm sırası olan oyuncuyu izler';

  @override
  String get followTurnHint => 'Yalnızca insanın kontrol ettiği koltuklar';

  @override
  String get sectionForceCard => 'Kart dayat';

  @override
  String get number => 'Numara';

  @override
  String get giveToHand => 'Ele ver';

  @override
  String get setAsTarget => 'Hedef olarak ayarla';

  @override
  String get sectionBombAndLimit => 'Bomba ve hamle sınırı';

  @override
  String get noBomb => 'Bombasız';

  @override
  String fuseValue(int fuse) {
    return 'Fitil $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '1. turda sınır (şimdi $duration)';
  }

  @override
  String get loadFromClipboard => 'Panodan yükle';

  @override
  String get sectionEvents => 'Olaylar';

  @override
  String get endGame => 'Oyunu bitir';

  @override
  String get removeLife => 'Can al';

  @override
  String get addLife => 'Can ekle';
}
