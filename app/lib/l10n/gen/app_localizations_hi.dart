// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get tagline => 'फ़्यूज़ जलने से पहले सही पत्ता फेंको।';

  @override
  String get sectionPlayers => 'खिलाड़ी';

  @override
  String get sectionRules => 'नियम';

  @override
  String get sectionScenarios => 'परिदृश्य';

  @override
  String get ruleTurnLimit => 'पहले राउंड में चाल की सीमा';

  @override
  String get ruleFastThrow => 'बिना उठाए तेज़ फेंक, सीमा तक';

  @override
  String get ruleSteal => 'इससे लंबी झिझक पर चोरी';

  @override
  String get gameSpeed => 'खेल की गति';

  @override
  String get play => 'खेलें';

  @override
  String get loadReplayFromClipboard => 'क्लिपबोर्ड से रीप्ले लोड करें';

  @override
  String get noReplayInClipboard => 'क्लिपबोर्ड में Kittens का रीप्ले नहीं है';

  @override
  String get replayCopied => 'रीप्ले क्लिपबोर्ड में है';

  @override
  String get replayTitle => 'रीप्ले';

  @override
  String get seatYou => 'आप';

  @override
  String botName(int number) {
    return 'बॉट $number';
  }

  @override
  String get seatModeHuman => 'इंसान';

  @override
  String get seatModeBot => 'बॉट';

  @override
  String get seatModePaused => 'रुका हुआ';

  @override
  String reactionFixed(String duration) {
    return 'प्रतिक्रिया $duration';
  }

  @override
  String get reactionRandom => 'यादृच्छिक प्रतिक्रिया';

  @override
  String get botIqSmart => 'समझदारी से खेलता है';

  @override
  String get botIqFirstValid => 'पहला वैध पत्ता';

  @override
  String get botIqSloppy => '20% गलती करता है';

  @override
  String get colorRed => 'लाल';

  @override
  String get colorGreen => 'हरा';

  @override
  String get colorBlue => 'नीला';

  @override
  String get colorYellow => 'पीला';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'बुनियादी';

  @override
  String get cardBomb => 'बम';

  @override
  String get cardDefuse => 'निष्क्रिय करो';

  @override
  String get cardDetonate => 'विस्फोट';

  @override
  String get cardNope => 'नहीं!';

  @override
  String get cardShield => 'ढाल';

  @override
  String get cardSteal => 'चोरी';

  @override
  String get cardTwist => 'पलटो';

  @override
  String get cardBlind => 'अंधा';

  @override
  String get rejectNotYourTurn => 'आपकी बारी नहीं है';

  @override
  String get rejectCardNotInHand => 'यह पत्ता अब आपके पास नहीं है';

  @override
  String get rejectInvalidTarget => 'इस खिलाड़ी को निशाना नहीं बना सकते';

  @override
  String get rejectNotAReaction => 'यह पत्ता डेक पर फेंका जाता है';

  @override
  String get rejectGhost => 'भूत सिर्फ़ नहीं! खेल सकता है';

  @override
  String get rejectNotGhost => 'बिना पत्ते के नहीं! सिर्फ़ भूत के पास है';

  @override
  String get rejectGhostNopeUsed =>
      'भूत का नहीं! इस राउंड में इस्तेमाल हो चुका है';

  @override
  String get rejectGhostNeedsCard => 'भूत को नहीं! का पत्ता चाहिए';

  @override
  String get rejectNothingToNope => 'रद्द करने को कुछ नहीं है';

  @override
  String get rejectNoPendingLoss => 'ढाल के लिए अब देर हो चुकी है';

  @override
  String get rejectOwnTurn => 'अपनी ही बारी नहीं चुरा सकते';

  @override
  String rejectTooEarly(String duration) {
    return 'चोरी सिर्फ़ $duration की झिझक के बाद हो सकती है';
  }

  @override
  String get rejectGameOver => 'खेल ख़त्म हो गया';

  @override
  String get rejectOther => 'आदेश अस्वीकृत';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $duration में';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $duration में, $count उठाता है';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card मान्य नहीं';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: समय समाप्त';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: बारी की चोरी ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card पर नहीं!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: नहीं! विफल रहा';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'बम उभर आया, फ़्यूज़ $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'बम फट गया: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: निष्क्रिय करो';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target पर विस्फोट';
  }

  @override
  String captionShield(String player) {
    return '$player: ढाल';
  }

  @override
  String captionGhost(String player) {
    return '$player भूत है';
  }

  @override
  String get hintDetonate => 'विस्फोट को उस खिलाड़ी पर खींचें जिसे बम मिलेगा';

  @override
  String get hintSteal => 'चोरी को उस खिलाड़ी पर खींचें जिसकी बारी है';

  @override
  String toastInvalidCard(int count) {
    return 'अमान्य पत्ता: एक जान जाती है और $count उठाने पड़ते हैं';
  }

  @override
  String get toastTimeOut => 'समय समाप्त';

  @override
  String toastShieldWindow(String duration) {
    return '$duration के भीतर ढाल!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: ने आपकी बारी चुरा ली';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player ने आप पर बम भेज दिया';
  }

  @override
  String get toastNopeReturns => 'नहीं! बारी आपको लौटा देता है';

  @override
  String get yourTurn => 'आपकी बारी';

  @override
  String onTurn(String player) {
    return 'बारी: $player';
  }

  @override
  String deckCount(int count) {
    return 'डेक $count';
  }

  @override
  String ghostName(String name) {
    return '$name (भूत)';
  }

  @override
  String get ghostNope => 'भूत का नहीं!';

  @override
  String get startHelp =>
      'डेक के ऊपर की रेखा के पार उसी रंग या नंबर का पत्ता फेंकें। नहीं! और ढाल को किनारे की ओर स्वाइप करें, विस्फोट और चोरी को खिलाड़ी पर खींचें।';

  @override
  String get start => 'शुरू करें';

  @override
  String get youWin => 'आप जीत गए';

  @override
  String get nobodySurvived => 'कोई नहीं बचा';

  @override
  String playerWins(String player) {
    return '$player जीता';
  }

  @override
  String get playAgain => 'फिर खेलें';

  @override
  String get copyReplay => 'रीप्ले कॉपी करें';

  @override
  String get gameSettings => 'खेल सेटिंग';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'बम, $fuse चालें बाकी',
      one: 'बम, $fuse चाल बाकी',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'जारी रखें';

  @override
  String get pause => 'रोकें';

  @override
  String get debug => 'डीबग';

  @override
  String get sectionTime => 'समय';

  @override
  String get step => 'क़दम';

  @override
  String gameClock(String duration, int round) {
    return 'खेल का समय $duration, राउंड $round';
  }

  @override
  String get artificialLatency => 'कृत्रिम विलंब';

  @override
  String get followTurn => 'दृश्य बारी वाले खिलाड़ी का पीछा करता है';

  @override
  String get followTurnHint => 'सिर्फ़ इंसान द्वारा नियंत्रित सीटें';

  @override
  String get sectionForceCard => 'पत्ता थोपें';

  @override
  String get number => 'संख्या';

  @override
  String get giveToHand => 'हाथ में दें';

  @override
  String get setAsTarget => 'लक्ष्य बनाएँ';

  @override
  String get sectionBombAndLimit => 'बम और चाल की सीमा';

  @override
  String get noBomb => 'बिना बम';

  @override
  String fuseValue(int fuse) {
    return 'फ़्यूज़ $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'पहले राउंड में सीमा (अभी $duration)';
  }

  @override
  String get loadFromClipboard => 'क्लिपबोर्ड से लोड करें';

  @override
  String get sectionEvents => 'घटनाएँ';

  @override
  String get endGame => 'खेल समाप्त करें';

  @override
  String get removeLife => 'जान घटाएँ';

  @override
  String get addLife => 'जान बढ़ाएँ';
}
