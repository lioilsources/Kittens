// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get tagline => 'દોરી બળી જાય તે પહેલાં સાચું પત્તું ફેંકો.';

  @override
  String get sectionPlayers => 'ખેલાડીઓ';

  @override
  String get sectionRules => 'નિયમો';

  @override
  String get sectionScenarios => 'પરિસ્થિતિઓ';

  @override
  String get ruleTurnLimit => 'પહેલા રાઉન્ડમાં ચાલની મર્યાદા';

  @override
  String get ruleFastThrow => 'ઉપાડ્યા વગર ઝડપી ફેંક, સુધી';

  @override
  String get ruleSteal => 'આનાથી લાંબી ખચકાટ પછી ચોરી';

  @override
  String get gameSpeed => 'રમતની ઝડપ';

  @override
  String get play => 'રમો';

  @override
  String get loadReplayFromClipboard => 'ક્લિપબોર્ડમાંથી રિપ્લે લોડ કરો';

  @override
  String get noReplayInClipboard => 'ક્લિપબોર્ડમાં Kittens રિપ્લે નથી';

  @override
  String get replayCopied => 'રિપ્લે ક્લિપબોર્ડમાં છે';

  @override
  String get replayTitle => 'રિપ્લે';

  @override
  String get seatYou => 'તમે';

  @override
  String botName(int number) {
    return 'બોટ $number';
  }

  @override
  String get seatModeHuman => 'માણસ';

  @override
  String get seatModeBot => 'બોટ';

  @override
  String get seatModePaused => 'થોભાવેલું';

  @override
  String reactionFixed(String duration) {
    return 'પ્રતિક્રિયા $duration';
  }

  @override
  String get reactionRandom => 'રેન્ડમ પ્રતિક્રિયા';

  @override
  String get botIqSmart => 'હોશિયારીથી રમે છે';

  @override
  String get botIqFirstValid => 'પહેલું માન્ય પત્તું';

  @override
  String get botIqSloppy => '20% ભૂલ કરે છે';

  @override
  String get colorRed => 'લાલ';

  @override
  String get colorGreen => 'લીલું';

  @override
  String get colorBlue => 'વાદળી';

  @override
  String get colorYellow => 'પીળું';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'મૂળભૂત';

  @override
  String get cardBomb => 'બૉમ્બ';

  @override
  String get cardDefuse => 'નિષ્ક્રિય કરો';

  @override
  String get cardDetonate => 'વિસ્ફોટ';

  @override
  String get cardNope => 'ના!';

  @override
  String get cardShield => 'ઢાલ';

  @override
  String get cardSteal => 'ચોરી';

  @override
  String get cardTwist => 'ઉલટાવો';

  @override
  String get cardBlind => 'આંધળું';

  @override
  String get rejectNotYourTurn => 'તમારી વારી નથી';

  @override
  String get rejectCardNotInHand => 'આ પત્તું હવે તમારી પાસે નથી';

  @override
  String get rejectInvalidTarget => 'આ ખેલાડીને નિશાન બનાવી શકાતો નથી';

  @override
  String get rejectNotAReaction => 'આ પત્તું ડેક પર ફેંકાય છે';

  @override
  String get rejectGhost => 'ભૂત ફક્ત ના! રમી શકે છે';

  @override
  String get rejectNotGhost => 'પત્તા વગર ના! ફક્ત ભૂત પાસે છે';

  @override
  String get rejectGhostNopeUsed => 'ભૂતનું ના! આ રાઉન્ડમાં વપરાઈ ગયું છે';

  @override
  String get rejectGhostNeedsCard => 'ભૂતને ના! પત્તું જોઈએ';

  @override
  String get rejectNothingToNope => 'રદ કરવા જેવું કંઈ નથી';

  @override
  String get rejectNoPendingLoss => 'ઢાલ માટે હવે મોડું થઈ ગયું છે';

  @override
  String get rejectOwnTurn => 'પોતાની જ વારી ચોરી શકાતી નથી';

  @override
  String rejectTooEarly(String duration) {
    return 'ચોરી ફક્ત $duration ખચકાટ પછી થઈ શકે છે';
  }

  @override
  String get rejectGameOver => 'રમત પૂરી થઈ';

  @override
  String get rejectOther => 'આદેશ નકારાયો';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card, $durationમાં';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card, $durationમાં, $count ઉપાડે છે';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card માન્ય નથી';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: સમય પૂરો';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: વારીની ચોરી ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: $card પર ના!';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: ના! નિષ્ફળ';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'બૉમ્બ ઉપર આવ્યો, દોરી $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'બૉમ્બ ફાટ્યો: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: નિષ્ક્રિય કરો';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: $target પર વિસ્ફોટ';
  }

  @override
  String captionShield(String player) {
    return '$player: ઢાલ';
  }

  @override
  String captionGhost(String player) {
    return '$player ભૂત છે';
  }

  @override
  String get hintDetonate => 'વિસ્ફોટને જે ખેલાડીને બૉમ્બ મળશે તેના પર ખેંચો';

  @override
  String get hintSteal => 'ચોરીને જેની વારી છે તે ખેલાડી પર ખેંચો';

  @override
  String toastInvalidCard(int count) {
    return 'અમાન્ય પત્તું: એક જીવ જાય છે અને $count ઉપાડવા પડે છે';
  }

  @override
  String get toastTimeOut => 'સમય પૂરો';

  @override
  String toastShieldWindow(String duration) {
    return '$durationમાં ઢાલ!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player: એ તમારી વારી ચોરી લીધી';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player એ તમારા પર બૉમ્બ મોકલ્યો';
  }

  @override
  String get toastNopeReturns => 'ના! વારી તમને પાછી આપે છે';

  @override
  String get yourTurn => 'તમારી વારી';

  @override
  String onTurn(String player) {
    return 'વારી: $player';
  }

  @override
  String deckCount(int count) {
    return 'ડેક $count';
  }

  @override
  String ghostName(String name) {
    return '$name (ભૂત)';
  }

  @override
  String get ghostNope => 'ભૂતનું ના!';

  @override
  String get startHelp =>
      'ડેકની ઉપરની રેખા પાર કરીને એ જ રંગ કે નંબરનું પત્તું ફેંકો. ના! અને ઢાલને બાજુ તરફ સરકાવો, વિસ્ફોટ અને ચોરીને ખેલાડી પર ખેંચો.';

  @override
  String get start => 'શરૂ કરો';

  @override
  String get youWin => 'તમે જીત્યા';

  @override
  String get nobodySurvived => 'કોઈ બચ્યું નહીં';

  @override
  String playerWins(String player) {
    return '$player જીત્યો';
  }

  @override
  String get playAgain => 'ફરી રમો';

  @override
  String get copyReplay => 'રિપ્લે કૉપિ કરો';

  @override
  String get gameSettings => 'રમતની સેટિંગ્સ';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'બૉમ્બ, $fuse ચાલ બાકી',
      one: 'બૉમ્બ, $fuse ચાલ બાકી',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'ચાલુ રાખો';

  @override
  String get pause => 'થોભાવો';

  @override
  String get debug => 'ડિબગ';

  @override
  String get sectionTime => 'સમય';

  @override
  String get step => 'પગલું';

  @override
  String gameClock(String duration, int round) {
    return 'રમતનો સમય $duration, રાઉન્ડ $round';
  }

  @override
  String get artificialLatency => 'કૃત્રિમ વિલંબ';

  @override
  String get followTurn => 'દૃશ્ય વારીવાળા ખેલાડીને અનુસરે છે';

  @override
  String get followTurnHint => 'ફક્ત માણસ દ્વારા નિયંત્રિત બેઠકો';

  @override
  String get sectionForceCard => 'પત્તું લાદો';

  @override
  String get number => 'નંબર';

  @override
  String get giveToHand => 'હાથમાં આપો';

  @override
  String get setAsTarget => 'લક્ષ્ય તરીકે સેટ કરો';

  @override
  String get sectionBombAndLimit => 'બૉમ્બ અને ચાલની મર્યાદા';

  @override
  String get noBomb => 'બૉમ્બ વગર';

  @override
  String fuseValue(int fuse) {
    return 'દોરી $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'પહેલા રાઉન્ડની મર્યાદા (હમણાં $duration)';
  }

  @override
  String get loadFromClipboard => 'ક્લિપબોર્ડમાંથી લોડ કરો';

  @override
  String get sectionEvents => 'ઘટનાઓ';

  @override
  String get endGame => 'રમત પૂરી કરો';

  @override
  String get removeLife => 'જીવ ઘટાડો';

  @override
  String get addLife => 'જીવ ઉમેરો';
}
