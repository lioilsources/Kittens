// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get tagline => 'തിരി എരിഞ്ഞുതീരും മുമ്പ് ശരിയായ കാർഡ് എറിയൂ.';

  @override
  String get sectionPlayers => 'കളിക്കാർ';

  @override
  String get sectionRules => 'നിയമങ്ങൾ';

  @override
  String get sectionScenarios => 'സാഹചര്യങ്ങൾ';

  @override
  String get ruleTurnLimit => 'ഒന്നാം റൗണ്ടിലെ നീക്കപരിധി';

  @override
  String get ruleFastThrow => 'എടുക്കാതെ വേഗത്തിലുള്ള ഏറ്, പരമാവധി';

  @override
  String get ruleSteal => 'ഇതിലും കൂടുതൽ മടിച്ചാൽ മോഷണം';

  @override
  String get gameSpeed => 'കളിയുടെ വേഗത';

  @override
  String get play => 'കളിക്കൂ';

  @override
  String get loadReplayFromClipboard =>
      'ക്ലിപ്ബോർഡിൽ നിന്ന് റീപ്ലേ ലോഡ് ചെയ്യൂ';

  @override
  String get noReplayInClipboard => 'ക്ലിപ്ബോർഡിൽ Kittens റീപ്ലേ ഇല്ല';

  @override
  String get replayCopied => 'റീപ്ലേ ക്ലിപ്ബോർഡിലുണ്ട്';

  @override
  String get replayTitle => 'റീപ്ലേ';

  @override
  String get seatYou => 'നിങ്ങൾ';

  @override
  String botName(int number) {
    return 'ബോട്ട് $number';
  }

  @override
  String get seatModeHuman => 'മനുഷ്യൻ';

  @override
  String get seatModeBot => 'ബോട്ട്';

  @override
  String get seatModePaused => 'താൽക്കാലികമായി നിർത്തി';

  @override
  String reactionFixed(String duration) {
    return 'പ്രതികരണം $duration';
  }

  @override
  String get reactionRandom => 'ക്രമരഹിത പ്രതികരണം';

  @override
  String get botIqSmart => 'ബുദ്ധിപൂർവം കളിക്കുന്നു';

  @override
  String get botIqFirstValid => 'ആദ്യത്തെ സാധുവായത്';

  @override
  String get botIqSloppy => '20% തെറ്റുവരുത്തുന്നു';

  @override
  String get colorRed => 'ചുവപ്പ്';

  @override
  String get colorGreen => 'പച്ച';

  @override
  String get colorBlue => 'നീല';

  @override
  String get colorYellow => 'മഞ്ഞ';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'അടിസ്ഥാനം';

  @override
  String get cardBomb => 'ബോംബ്';

  @override
  String get cardDefuse => 'നിർവീര്യമാക്കൂ';

  @override
  String get cardDetonate => 'പൊട്ടിക്കൂ';

  @override
  String get cardNope => 'ഇല്ല!';

  @override
  String get cardShield => 'പരിച';

  @override
  String get cardSteal => 'മോഷണം';

  @override
  String get cardTwist => 'തിരിക്കൂ';

  @override
  String get cardBlind => 'അന്ധം';

  @override
  String get rejectNotYourTurn => 'നിങ്ങളുടെ ഊഴമല്ല';

  @override
  String get rejectCardNotInHand => 'ഈ കാർഡ് ഇനി നിങ്ങളുടെ കയ്യിലില്ല';

  @override
  String get rejectInvalidTarget => 'ഈ കളിക്കാരനെ ലക്ഷ്യമിടാനാവില്ല';

  @override
  String get rejectNotAReaction => 'ഈ കാർഡ് ഡെക്കിലേക്ക് എറിയണം';

  @override
  String get rejectGhost => 'പ്രേതത്തിന് ഇല്ല! മാത്രമേ കളിക്കാനാകൂ';

  @override
  String get rejectNotGhost => 'കാർഡില്ലാത്ത ഇല്ല! പ്രേതത്തിന് മാത്രം';

  @override
  String get rejectGhostNopeUsed =>
      'പ്രേതത്തിന്റെ ഇല്ല! ഈ റൗണ്ടിൽ ഉപയോഗിച്ചുകഴിഞ്ഞു';

  @override
  String get rejectGhostNeedsCard => 'പ്രേതത്തിന് ഇല്ല! കാർഡ് വേണം';

  @override
  String get rejectNothingToNope => 'റദ്ദാക്കാൻ ഒന്നുമില്ല';

  @override
  String get rejectNoPendingLoss => 'പരിചയ്ക്ക് ഇനി വൈകി';

  @override
  String get rejectOwnTurn => 'സ്വന്തം ഊഴം മോഷ്ടിക്കാനാവില്ല';

  @override
  String rejectTooEarly(String duration) {
    return '$duration മടിച്ചശേഷം മാത്രമേ മോഷ്ടിക്കാനാകൂ';
  }

  @override
  String get rejectGameOver => 'കളി കഴിഞ്ഞു';

  @override
  String get rejectOther => 'കമാൻഡ് നിരസിച്ചു';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $durationൽ';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $durationൽ, $count എടുക്കുന്നു';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card സാധുവല്ല';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: സമയം കഴിഞ്ഞു';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: ഊഴം മോഷ്ടിച്ചു ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $cardൽ ഇല്ല!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: ഇല്ല! ഫലിച്ചില്ല';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'ബോംബ് പൊങ്ങിവന്നു, തിരി $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'ബോംബ് പൊട്ടി: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: നിർവീര്യമാക്കൂ';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $targetലേക്ക് പൊട്ടിക്കൂ';
  }

  @override
  String captionShield(String player) {
    return '$player: പരിച';
  }

  @override
  String captionGhost(String player) {
    return '$player പ്രേതമാണ്';
  }

  @override
  String get hintDetonate =>
      'ബോംബ് കിട്ടേണ്ട കളിക്കാരന്റെ മേൽ പൊട്ടിക്കൂ വലിച്ചിടൂ';

  @override
  String get hintSteal => 'ഊഴമുള്ള കളിക്കാരന്റെ മേൽ മോഷണം വലിച്ചിടൂ';

  @override
  String toastInvalidCard(int count) {
    return 'അസാധുവായ കാർഡ്: ഒരു ജീവൻ നഷ്ടപ്പെടും, $count എടുക്കണം';
  }

  @override
  String get toastTimeOut => 'സമയം കഴിഞ്ഞു';

  @override
  String toastShieldWindow(String duration) {
    return '$durationക്കുള്ളിൽ പരിച!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: നിങ്ങളുടെ ഊഴം മോഷ്ടിച്ചു';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player നിങ്ങളുടെ നേരെ ബോംബ് അയച്ചു';
  }

  @override
  String get toastNopeReturns => 'ഇല്ല! ഊഴം നിങ്ങൾക്ക് തിരികെ നൽകുന്നു';

  @override
  String get yourTurn => 'നിങ്ങളുടെ ഊഴം';

  @override
  String onTurn(String player) {
    return 'ഊഴം: $player';
  }

  @override
  String deckCount(int count) {
    return 'ഡെക്ക് $count';
  }

  @override
  String ghostName(String name) {
    return '$name (പ്രേതം)';
  }

  @override
  String get ghostNope => 'പ്രേതത്തിന്റെ ഇല്ല!';

  @override
  String get startHelp =>
      'ഡെക്കിന് മുകളിലെ വര കടത്തി അതേ നിറമോ നമ്പറോ ഉള്ള കാർഡ് എറിയൂ. ഇല്ല!, പരിച എന്നിവ വശത്തേക്ക് സ്വൈപ്പ് ചെയ്യൂ; പൊട്ടിക്കൂ, മോഷണം എന്നിവ കളിക്കാരന്റെ മേൽ വലിച്ചിടൂ.';

  @override
  String get start => 'തുടങ്ങൂ';

  @override
  String get youWin => 'നിങ്ങൾ ജയിച്ചു';

  @override
  String get nobodySurvived => 'ആരും ശേഷിച്ചില്ല';

  @override
  String playerWins(String player) {
    return '$player ജയിച്ചു';
  }

  @override
  String get playAgain => 'വീണ്ടും കളിക്കൂ';

  @override
  String get copyReplay => 'റീപ്ലേ പകർത്തൂ';

  @override
  String get gameSettings => 'കളിയുടെ ക്രമീകരണം';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'ബോംബ്, $fuse നീക്കങ്ങൾ ബാക്കി',
      one: 'ബോംബ്, $fuse നീക്കം ബാക്കി',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'തുടരൂ';

  @override
  String get pause => 'നിർത്തൂ';

  @override
  String get debug => 'ഡീബഗ്';

  @override
  String get sectionTime => 'സമയം';

  @override
  String get step => 'ഘട്ടം';

  @override
  String gameClock(String duration, int round) {
    return 'കളി സമയം $duration, റൗണ്ട് $round';
  }

  @override
  String get artificialLatency => 'കൃത്രിമ കാലതാമസം';

  @override
  String get followTurn => 'കാഴ്ച ഊഴമുള്ള കളിക്കാരനെ പിന്തുടരുന്നു';

  @override
  String get followTurnHint => 'മനുഷ്യർ നിയന്ത്രിക്കുന്ന ഇരിപ്പിടങ്ങൾ മാത്രം';

  @override
  String get sectionForceCard => 'കാർഡ് അടിച്ചേൽപ്പിക്കൂ';

  @override
  String get number => 'നമ്പർ';

  @override
  String get giveToHand => 'കയ്യിൽ കൊടുക്കൂ';

  @override
  String get setAsTarget => 'ലക്ഷ്യമായി സജ്ജമാക്കൂ';

  @override
  String get sectionBombAndLimit => 'ബോംബും നീക്കപരിധിയും';

  @override
  String get noBomb => 'ബോംബ് ഇല്ല';

  @override
  String fuseValue(int fuse) {
    return 'തിരി $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'ഒന്നാം റൗണ്ട് പരിധി (ഇപ്പോൾ $duration)';
  }

  @override
  String get loadFromClipboard => 'ക്ലിപ്ബോർഡിൽ നിന്ന് ലോഡ് ചെയ്യൂ';

  @override
  String get sectionEvents => 'സംഭവങ്ങൾ';

  @override
  String get endGame => 'കളി അവസാനിപ്പിക്കൂ';

  @override
  String get removeLife => 'ജീവൻ കുറയ്ക്കൂ';

  @override
  String get addLife => 'ജീവൻ കൂട്ടൂ';
}
