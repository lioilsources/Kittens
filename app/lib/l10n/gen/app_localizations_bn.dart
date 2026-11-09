// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get tagline => 'পলতে পুড়ে শেষ হওয়ার আগেই সঠিক কার্ডটি ছুঁড়ুন।';

  @override
  String get sectionPlayers => 'খেলোয়াড়';

  @override
  String get sectionRules => 'নিয়ম';

  @override
  String get sectionScenarios => 'পরিস্থিতি';

  @override
  String get ruleTurnLimit => '১ম রাউন্ডে চালের সীমা';

  @override
  String get ruleFastThrow => 'না তুলে দ্রুত ছোঁড়া, সীমা';

  @override
  String get ruleSteal => 'এর চেয়ে বেশি দ্বিধায় চুরি';

  @override
  String get gameSpeed => 'খেলার গতি';

  @override
  String get play => 'খেলুন';

  @override
  String get loadReplayFromClipboard => 'ক্লিপবোর্ড থেকে রিপ্লে লোড করুন';

  @override
  String get noReplayInClipboard => 'ক্লিপবোর্ডে Kittens রিপ্লে নেই';

  @override
  String get replayCopied => 'রিপ্লে ক্লিপবোর্ডে আছে';

  @override
  String get replayTitle => 'রিপ্লে';

  @override
  String get seatYou => 'আপনি';

  @override
  String botName(int number) {
    return 'বট $number';
  }

  @override
  String get seatModeHuman => 'মানুষ';

  @override
  String get seatModeBot => 'বট';

  @override
  String get seatModePaused => 'থামানো';

  @override
  String reactionFixed(String duration) {
    return 'প্রতিক্রিয়া $duration';
  }

  @override
  String get reactionRandom => 'এলোমেলো প্রতিক্রিয়া';

  @override
  String get botIqSmart => 'বুদ্ধিমানের মতো খেলে';

  @override
  String get botIqFirstValid => 'প্রথম বৈধ কার্ড';

  @override
  String get botIqSloppy => '২০% ভুল করে';

  @override
  String get colorRed => 'লাল';

  @override
  String get colorGreen => 'সবুজ';

  @override
  String get colorBlue => 'নীল';

  @override
  String get colorYellow => 'হলুদ';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'মৌলিক';

  @override
  String get cardBomb => 'বোমা';

  @override
  String get cardDefuse => 'নিষ্ক্রিয় করুন';

  @override
  String get cardDetonate => 'বিস্ফোরণ';

  @override
  String get cardNope => 'না!';

  @override
  String get cardShield => 'ঢাল';

  @override
  String get cardSteal => 'চুরি';

  @override
  String get cardTwist => 'উল্টে দিন';

  @override
  String get cardBlind => 'অন্ধ';

  @override
  String get rejectNotYourTurn => 'এটা আপনার পালা নয়';

  @override
  String get rejectCardNotInHand => 'এই কার্ডটি আর আপনার কাছে নেই';

  @override
  String get rejectInvalidTarget => 'এই খেলোয়াড়কে লক্ষ্য করা যাবে না';

  @override
  String get rejectNotAReaction => 'এই কার্ড ডেকের ওপর ছুঁড়তে হয়';

  @override
  String get rejectGhost => 'ভূত শুধু না! খেলতে পারে';

  @override
  String get rejectNotGhost => 'কার্ড ছাড়া না! শুধু ভূতের আছে';

  @override
  String get rejectGhostNopeUsed => 'ভূতের না! এই রাউন্ডে ব্যবহৃত হয়ে গেছে';

  @override
  String get rejectGhostNeedsCard => 'ভূতের একটি না! কার্ড দরকার';

  @override
  String get rejectNothingToNope => 'বাতিল করার কিছু নেই';

  @override
  String get rejectNoPendingLoss => 'ঢালের জন্য আর দেরি হয়ে গেছে';

  @override
  String get rejectOwnTurn => 'নিজের পালা চুরি করা যায় না';

  @override
  String rejectTooEarly(String duration) {
    return '$duration দ্বিধার পরেই চুরি করা যায়';
  }

  @override
  String get rejectGameOver => 'খেলা শেষ';

  @override
  String get rejectOther => 'নির্দেশ প্রত্যাখ্যাত';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $duration-এ';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $duration-এ, $count তোলে';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card বৈধ নয়';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: সময় শেষ';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: পালা চুরি ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card-এ না!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: না! কাজ করেনি';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'বোমা ভেসে উঠেছে, পলতে $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'বোমা ফেটেছে: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: নিষ্ক্রিয় করুন';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target-এর ওপর বিস্ফোরণ';
  }

  @override
  String captionShield(String player) {
    return '$player: ঢাল';
  }

  @override
  String captionGhost(String player) {
    return '$player এখন ভূত';
  }

  @override
  String get hintDetonate =>
      'যে খেলোয়াড় বোমা পাবে তার ওপর বিস্ফোরণ টেনে আনুন';

  @override
  String get hintSteal => 'যার পালা তার ওপর চুরি টেনে আনুন';

  @override
  String toastInvalidCard(int count) {
    return 'অবৈধ কার্ড: একটি প্রাণ হারান এবং $count তোলেন';
  }

  @override
  String get toastTimeOut => 'সময় শেষ';

  @override
  String toastShieldWindow(String duration) {
    return '$duration-এর মধ্যে ঢাল!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: আপনার পালা চুরি করেছে';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player আপনার দিকে বোমা পাঠিয়েছে';
  }

  @override
  String get toastNopeReturns => 'না! পালা আপনাকে ফিরিয়ে দেয়';

  @override
  String get yourTurn => 'আপনার পালা';

  @override
  String onTurn(String player) {
    return 'পালা: $player';
  }

  @override
  String deckCount(int count) {
    return 'ডেক $count';
  }

  @override
  String ghostName(String name) {
    return '$name (ভূত)';
  }

  @override
  String get ghostNope => 'ভূতের না!';

  @override
  String get startHelp =>
      'ডেকের ওপরের রেখা পার করে একই রং বা সংখ্যার কার্ড ছুঁড়ুন। না! ও ঢাল পাশে সরান, বিস্ফোরণ ও চুরি খেলোয়াড়ের ওপর টেনে আনুন।';

  @override
  String get start => 'শুরু করুন';

  @override
  String get youWin => 'আপনি জিতেছেন';

  @override
  String get nobodySurvived => 'কেউ বাঁচেনি';

  @override
  String playerWins(String player) {
    return '$player জিতেছে';
  }

  @override
  String get playAgain => 'আবার খেলুন';

  @override
  String get copyReplay => 'রিপ্লে কপি করুন';

  @override
  String get gameSettings => 'খেলার সেটিংস';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'বোমা, $fuseটি চাল বাকি',
      one: 'বোমা, $fuseটি চাল বাকি',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'চালিয়ে যান';

  @override
  String get pause => 'বিরতি';

  @override
  String get debug => 'ডিবাগ';

  @override
  String get sectionTime => 'সময়';

  @override
  String get step => 'ধাপ';

  @override
  String gameClock(String duration, int round) {
    return 'খেলার সময় $duration, রাউন্ড $round';
  }

  @override
  String get artificialLatency => 'কৃত্রিম বিলম্ব';

  @override
  String get followTurn => 'দৃশ্য পালার খেলোয়াড়কে অনুসরণ করে';

  @override
  String get followTurnHint => 'শুধু মানুষ-নিয়ন্ত্রিত আসন';

  @override
  String get sectionForceCard => 'কার্ড চাপিয়ে দিন';

  @override
  String get number => 'সংখ্যা';

  @override
  String get giveToHand => 'হাতে দিন';

  @override
  String get setAsTarget => 'লক্ষ্য হিসেবে সেট করুন';

  @override
  String get sectionBombAndLimit => 'বোমা ও চালের সীমা';

  @override
  String get noBomb => 'বোমা ছাড়া';

  @override
  String fuseValue(int fuse) {
    return 'পলতে $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return '১ম রাউন্ডের সীমা (এখন $duration)';
  }

  @override
  String get loadFromClipboard => 'ক্লিপবোর্ড থেকে লোড করুন';

  @override
  String get sectionEvents => 'ঘটনা';

  @override
  String get endGame => 'খেলা শেষ করুন';

  @override
  String get removeLife => 'প্রাণ কমান';

  @override
  String get addLife => 'প্রাণ বাড়ান';
}
