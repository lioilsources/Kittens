import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_or.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar'),
    Locale('bn'),
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ml'),
    Locale('mr'),
    Locale('ms'),
    Locale('nb'),
    Locale('nl'),
    Locale('or'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'PT'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// Subtitle under the game logo on the setup screen.
  ///
  /// In cs, this message translates to:
  /// **'Hoď správnou kartu dřív, než dohoří doutnák.'**
  String get tagline;

  /// No description provided for @sectionPlayers.
  ///
  /// In cs, this message translates to:
  /// **'Hráči'**
  String get sectionPlayers;

  /// No description provided for @sectionRules.
  ///
  /// In cs, this message translates to:
  /// **'Pravidla'**
  String get sectionRules;

  /// No description provided for @sectionScenarios.
  ///
  /// In cs, this message translates to:
  /// **'Scénáře'**
  String get sectionScenarios;

  /// Slider label: how long a turn may take in the first round.
  ///
  /// In cs, this message translates to:
  /// **'Limit tahu v 1. kole'**
  String get ruleTurnLimit;

  /// Slider label: a throw faster than this value draws no card. Followed by a duration.
  ///
  /// In cs, this message translates to:
  /// **'Rychlý hod bez dobírání do'**
  String get ruleFastThrow;

  /// Slider label: the Steal card works after the player on turn hesitates longer than this. Followed by a duration.
  ///
  /// In cs, this message translates to:
  /// **'Kradež po váhání delším než'**
  String get ruleSteal;

  /// No description provided for @gameSpeed.
  ///
  /// In cs, this message translates to:
  /// **'Rychlost hry'**
  String get gameSpeed;

  /// No description provided for @play.
  ///
  /// In cs, this message translates to:
  /// **'Hrát'**
  String get play;

  /// No description provided for @loadReplayFromClipboard.
  ///
  /// In cs, this message translates to:
  /// **'Načíst replay ze schránky'**
  String get loadReplayFromClipboard;

  /// Kittens is the game name; keep it untranslated.
  ///
  /// In cs, this message translates to:
  /// **'Ve schránce není replay Kittens'**
  String get noReplayInClipboard;

  /// No description provided for @replayCopied.
  ///
  /// In cs, this message translates to:
  /// **'Replay je ve schránce'**
  String get replayCopied;

  /// Recording of a played game that can be copied and loaded again.
  ///
  /// In cs, this message translates to:
  /// **'Replay'**
  String get replayTitle;

  /// Default name of the human player's seat.
  ///
  /// In cs, this message translates to:
  /// **'Ty'**
  String get seatYou;

  /// No description provided for @botName.
  ///
  /// In cs, this message translates to:
  /// **'Bot {number}'**
  String botName(int number);

  /// No description provided for @seatModeHuman.
  ///
  /// In cs, this message translates to:
  /// **'Člověk'**
  String get seatModeHuman;

  /// No description provided for @seatModeBot.
  ///
  /// In cs, this message translates to:
  /// **'Bot'**
  String get seatModeBot;

  /// No description provided for @seatModePaused.
  ///
  /// In cs, this message translates to:
  /// **'Pauza'**
  String get seatModePaused;

  /// Bot reaction time, e.g. 'Reakce 0,5 s'.
  ///
  /// In cs, this message translates to:
  /// **'Reakce {duration}'**
  String reactionFixed(String duration);

  /// Bot reaction time is random.
  ///
  /// In cs, this message translates to:
  /// **'Reakce náhodně'**
  String get reactionRandom;

  /// No description provided for @botIqSmart.
  ///
  /// In cs, this message translates to:
  /// **'Hraje chytře'**
  String get botIqSmart;

  /// Bot plays the first valid card it finds.
  ///
  /// In cs, this message translates to:
  /// **'První platná'**
  String get botIqFirstValid;

  /// Bot makes a mistake 20 % of the time.
  ///
  /// In cs, this message translates to:
  /// **'Chybuje 20 %'**
  String get botIqSloppy;

  /// No description provided for @colorRed.
  ///
  /// In cs, this message translates to:
  /// **'červená'**
  String get colorRed;

  /// No description provided for @colorGreen.
  ///
  /// In cs, this message translates to:
  /// **'zelená'**
  String get colorGreen;

  /// No description provided for @colorBlue.
  ///
  /// In cs, this message translates to:
  /// **'modrá'**
  String get colorBlue;

  /// No description provided for @colorYellow.
  ///
  /// In cs, this message translates to:
  /// **'žlutá'**
  String get colorYellow;

  /// A number card, e.g. 'červená 7'.
  ///
  /// In cs, this message translates to:
  /// **'{color} {number}'**
  String cardNumberLabel(String color, int number);

  /// Name of the basic number card type.
  ///
  /// In cs, this message translates to:
  /// **'Základ'**
  String get cardNumber;

  /// No description provided for @cardBomb.
  ///
  /// In cs, this message translates to:
  /// **'Bomba'**
  String get cardBomb;

  /// Card name (imperative): defuses the bomb. Keep short, printed on a card.
  ///
  /// In cs, this message translates to:
  /// **'Zneškodni'**
  String get cardDefuse;

  /// Card name (imperative): sends the bomb to another player. Keep short.
  ///
  /// In cs, this message translates to:
  /// **'Odpal'**
  String get cardDetonate;

  /// Card name: cancels the last action card. Keep very short.
  ///
  /// In cs, this message translates to:
  /// **'Ne!'**
  String get cardNope;

  /// Card name: saves a life.
  ///
  /// In cs, this message translates to:
  /// **'Štít'**
  String get cardShield;

  /// Card name: steals the turn from a hesitating player.
  ///
  /// In cs, this message translates to:
  /// **'Kradež'**
  String get cardSteal;

  /// Card name (imperative): changes matching to ±1 number.
  ///
  /// In cs, this message translates to:
  /// **'Otoč'**
  String get cardTwist;

  /// Card name: hides the target card for a few turns.
  ///
  /// In cs, this message translates to:
  /// **'Slepá'**
  String get cardBlind;

  /// No description provided for @rejectNotYourTurn.
  ///
  /// In cs, this message translates to:
  /// **'Nejsi na tahu'**
  String get rejectNotYourTurn;

  /// No description provided for @rejectCardNotInHand.
  ///
  /// In cs, this message translates to:
  /// **'Tuhle kartu už nemáš'**
  String get rejectCardNotInHand;

  /// No description provided for @rejectInvalidTarget.
  ///
  /// In cs, this message translates to:
  /// **'Na tohoto hráče to nejde'**
  String get rejectInvalidTarget;

  /// No description provided for @rejectNotAReaction.
  ///
  /// In cs, this message translates to:
  /// **'Tahle karta se hází na balíček'**
  String get rejectNotAReaction;

  /// 'Ne!' is the Nope card name; use the translated card name.
  ///
  /// In cs, this message translates to:
  /// **'Duch může hrát jen Ne!'**
  String get rejectGhost;

  /// No description provided for @rejectNotGhost.
  ///
  /// In cs, this message translates to:
  /// **'Ne! bez karty má jen duch'**
  String get rejectNotGhost;

  /// No description provided for @rejectGhostNopeUsed.
  ///
  /// In cs, this message translates to:
  /// **'Ne! ducha už v tomhle kole padlo'**
  String get rejectGhostNopeUsed;

  /// No description provided for @rejectGhostNeedsCard.
  ///
  /// In cs, this message translates to:
  /// **'Duch potřebuje kartu Ne!'**
  String get rejectGhostNeedsCard;

  /// No description provided for @rejectNothingToNope.
  ///
  /// In cs, this message translates to:
  /// **'Není co zrušit'**
  String get rejectNothingToNope;

  /// No description provided for @rejectNoPendingLoss.
  ///
  /// In cs, this message translates to:
  /// **'Štít už nestihneš'**
  String get rejectNoPendingLoss;

  /// No description provided for @rejectOwnTurn.
  ///
  /// In cs, this message translates to:
  /// **'Svůj vlastní tah ukrást nejde'**
  String get rejectOwnTurn;

  /// No description provided for @rejectTooEarly.
  ///
  /// In cs, this message translates to:
  /// **'Krást jde až po {duration} váhání'**
  String rejectTooEarly(String duration);

  /// No description provided for @rejectGameOver.
  ///
  /// In cs, this message translates to:
  /// **'Hra skončila'**
  String get rejectGameOver;

  /// No description provided for @rejectOther.
  ///
  /// In cs, this message translates to:
  /// **'Příkaz odmítnut'**
  String get rejectOther;

  /// Player threw a card in the given time.
  ///
  /// In cs, this message translates to:
  /// **'{player}: {card} za {duration}'**
  String captionThrown(String player, String card, String duration);

  /// Player threw a card and draws count cards as a penalty for a slow throw.
  ///
  /// In cs, this message translates to:
  /// **'{player}: {card} za {duration}, bere {count}'**
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  );

  /// No description provided for @captionInvalid.
  ///
  /// In cs, this message translates to:
  /// **'{player}: {card} neplatí'**
  String captionInvalid(String player, String card);

  /// No description provided for @captionTimedOut.
  ///
  /// In cs, this message translates to:
  /// **'{player}: čas vypršel'**
  String captionTimedOut(String player);

  /// No description provided for @captionStolen.
  ///
  /// In cs, this message translates to:
  /// **'{player}: Kradež tahu ({victim})'**
  String captionStolen(String player, String victim);

  /// No description provided for @captionNoped.
  ///
  /// In cs, this message translates to:
  /// **'{player}: Ne! na {card}'**
  String captionNoped(String player, String card);

  /// No description provided for @captionNopeFizzled.
  ///
  /// In cs, this message translates to:
  /// **'{player}: Ne! propadlo'**
  String captionNopeFizzled(String player);

  /// fuse = number of turns until the bomb explodes.
  ///
  /// In cs, this message translates to:
  /// **'Bomba se vynořila, doutnák {fuse}'**
  String captionBombSurfaced(int fuse);

  /// No description provided for @captionBombExploded.
  ///
  /// In cs, this message translates to:
  /// **'Bomba vybuchla: {player}'**
  String captionBombExploded(String player);

  /// No description provided for @captionDefused.
  ///
  /// In cs, this message translates to:
  /// **'{player}: Zneškodni'**
  String captionDefused(String player);

  /// No description provided for @captionRedirected.
  ///
  /// In cs, this message translates to:
  /// **'{player}: Odpal na {target}'**
  String captionRedirected(String player, String target);

  /// No description provided for @captionShield.
  ///
  /// In cs, this message translates to:
  /// **'{player}: Štít'**
  String captionShield(String player);

  /// No description provided for @captionGhost.
  ///
  /// In cs, this message translates to:
  /// **'{player} je duch'**
  String captionGhost(String player);

  /// No description provided for @hintDetonate.
  ///
  /// In cs, this message translates to:
  /// **'Odpal přetáhni na hráče, který dostane bombu'**
  String get hintDetonate;

  /// No description provided for @hintSteal.
  ///
  /// In cs, this message translates to:
  /// **'Kradež přetáhni na hráče, který je na tahu'**
  String get hintSteal;

  /// count = number of penalty cards drawn.
  ///
  /// In cs, this message translates to:
  /// **'Neplatná karta: přijdeš o život a bereš {count}'**
  String toastInvalidCard(int count);

  /// No description provided for @toastTimeOut.
  ///
  /// In cs, this message translates to:
  /// **'Čas vypršel'**
  String get toastTimeOut;

  /// Play a Shield card within the given time to keep your life.
  ///
  /// In cs, this message translates to:
  /// **'Štít do {duration}!'**
  String toastShieldWindow(String duration);

  /// No description provided for @toastTurnStolen.
  ///
  /// In cs, this message translates to:
  /// **'{player}: Kradež tvého tahu'**
  String toastTurnStolen(String player);

  /// No description provided for @toastBombOnYou.
  ///
  /// In cs, this message translates to:
  /// **'{player} na tebe odpálil bombu'**
  String toastBombOnYou(String player);

  /// No description provided for @toastNopeReturns.
  ///
  /// In cs, this message translates to:
  /// **'Ne! vrací tah k tobě'**
  String get toastNopeReturns;

  /// No description provided for @yourTurn.
  ///
  /// In cs, this message translates to:
  /// **'Tvůj tah'**
  String get yourTurn;

  /// No description provided for @onTurn.
  ///
  /// In cs, this message translates to:
  /// **'Na tahu: {player}'**
  String onTurn(String player);

  /// Number of cards left in the draw pile.
  ///
  /// In cs, this message translates to:
  /// **'Balíček {count}'**
  String deckCount(int count);

  /// Player who lost all lives and plays on as a ghost.
  ///
  /// In cs, this message translates to:
  /// **'{name} (duch)'**
  String ghostName(String name);

  /// Button: a ghost's free Nope.
  ///
  /// In cs, this message translates to:
  /// **'Ne! ducha'**
  String get ghostNope;

  /// No description provided for @startHelp.
  ///
  /// In cs, this message translates to:
  /// **'Hoď kartu stejné barvy nebo čísla přes čáru nad balíčkem. Ne! a Štít táhni do strany, Odpal a Kradež na hráče.'**
  String get startHelp;

  /// No description provided for @start.
  ///
  /// In cs, this message translates to:
  /// **'Začít'**
  String get start;

  /// No description provided for @youWin.
  ///
  /// In cs, this message translates to:
  /// **'Vyhráváš'**
  String get youWin;

  /// No description provided for @nobodySurvived.
  ///
  /// In cs, this message translates to:
  /// **'Nikdo nepřežil'**
  String get nobodySurvived;

  /// No description provided for @playerWins.
  ///
  /// In cs, this message translates to:
  /// **'{player} vyhrává'**
  String playerWins(String player);

  /// No description provided for @playAgain.
  ///
  /// In cs, this message translates to:
  /// **'Hrát znovu'**
  String get playAgain;

  /// No description provided for @copyReplay.
  ///
  /// In cs, this message translates to:
  /// **'Kopírovat replay'**
  String get copyReplay;

  /// No description provided for @gameSettings.
  ///
  /// In cs, this message translates to:
  /// **'Nastavení hry'**
  String get gameSettings;

  /// Accessibility label of the bomb badge.
  ///
  /// In cs, this message translates to:
  /// **'{fuse, plural, one{Bomba, zbývá {fuse} tah} few{Bomba, zbývají {fuse} tahy} many{Bomba, zbývá {fuse} tahu} other{Bomba, zbývá {fuse} tahů}}'**
  String bombTurnsLeft(int fuse);

  /// No description provided for @resume.
  ///
  /// In cs, this message translates to:
  /// **'Pokračovat'**
  String get resume;

  /// No description provided for @pause.
  ///
  /// In cs, this message translates to:
  /// **'Pozastavit'**
  String get pause;

  /// No description provided for @debug.
  ///
  /// In cs, this message translates to:
  /// **'Ladění'**
  String get debug;

  /// No description provided for @sectionTime.
  ///
  /// In cs, this message translates to:
  /// **'Čas'**
  String get sectionTime;

  /// No description provided for @step.
  ///
  /// In cs, this message translates to:
  /// **'Krok'**
  String get step;

  /// No description provided for @gameClock.
  ///
  /// In cs, this message translates to:
  /// **'Herní čas {duration}, kolo {round}'**
  String gameClock(String duration, int round);

  /// No description provided for @artificialLatency.
  ///
  /// In cs, this message translates to:
  /// **'Umělá latence'**
  String get artificialLatency;

  /// No description provided for @followTurn.
  ///
  /// In cs, this message translates to:
  /// **'Pohled sleduje hráče na tahu'**
  String get followTurn;

  /// No description provided for @followTurnHint.
  ///
  /// In cs, this message translates to:
  /// **'Jen místa ovládaná člověkem'**
  String get followTurnHint;

  /// No description provided for @sectionForceCard.
  ///
  /// In cs, this message translates to:
  /// **'Vnutit kartu'**
  String get sectionForceCard;

  /// No description provided for @number.
  ///
  /// In cs, this message translates to:
  /// **'Číslo'**
  String get number;

  /// No description provided for @giveToHand.
  ///
  /// In cs, this message translates to:
  /// **'Dát do ruky'**
  String get giveToHand;

  /// No description provided for @setAsTarget.
  ///
  /// In cs, this message translates to:
  /// **'Nastavit jako cíl'**
  String get setAsTarget;

  /// No description provided for @sectionBombAndLimit.
  ///
  /// In cs, this message translates to:
  /// **'Bomba a limit tahu'**
  String get sectionBombAndLimit;

  /// No description provided for @noBomb.
  ///
  /// In cs, this message translates to:
  /// **'Bez bomby'**
  String get noBomb;

  /// No description provided for @fuseValue.
  ///
  /// In cs, this message translates to:
  /// **'Doutnák {fuse}'**
  String fuseValue(int fuse);

  /// No description provided for @turnLimitNow.
  ///
  /// In cs, this message translates to:
  /// **'Limit v 1. kole (teď {duration})'**
  String turnLimitNow(String duration);

  /// No description provided for @loadFromClipboard.
  ///
  /// In cs, this message translates to:
  /// **'Načíst ze schránky'**
  String get loadFromClipboard;

  /// No description provided for @sectionEvents.
  ///
  /// In cs, this message translates to:
  /// **'Události'**
  String get sectionEvents;

  /// No description provided for @endGame.
  ///
  /// In cs, this message translates to:
  /// **'Ukončit hru'**
  String get endGame;

  /// No description provided for @removeLife.
  ///
  /// In cs, this message translates to:
  /// **'Ubrat život'**
  String get removeLife;

  /// No description provided for @addLife.
  ///
  /// In cs, this message translates to:
  /// **'Přidat život'**
  String get addLife;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'ca',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fi',
    'fr',
    'gu',
    'he',
    'hi',
    'hr',
    'hu',
    'id',
    'it',
    'ja',
    'kn',
    'ko',
    'ml',
    'mr',
    'ms',
    'nb',
    'nl',
    'or',
    'pa',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sl',
    'sv',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'PT':
            return AppLocalizationsPtPt();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'or':
      return AppLocalizationsOr();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
