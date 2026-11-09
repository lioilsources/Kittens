// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tagline => 'Throw the right card before the fuse burns down.';

  @override
  String get sectionPlayers => 'Players';

  @override
  String get sectionRules => 'Rules';

  @override
  String get sectionScenarios => 'Scenarios';

  @override
  String get ruleTurnLimit => 'Turn limit in round 1';

  @override
  String get ruleFastThrow => 'Fast throw, no draw, up to';

  @override
  String get ruleSteal => 'Steal after hesitating longer than';

  @override
  String get gameSpeed => 'Game speed';

  @override
  String get play => 'Play';

  @override
  String get loadReplayFromClipboard => 'Load replay from clipboard';

  @override
  String get noReplayInClipboard => 'No Kittens replay in the clipboard';

  @override
  String get replayCopied => 'Replay copied to clipboard';

  @override
  String get replayTitle => 'Replay';

  @override
  String get seatYou => 'You';

  @override
  String botName(int number) {
    return 'Bot $number';
  }

  @override
  String get seatModeHuman => 'Human';

  @override
  String get seatModeBot => 'Bot';

  @override
  String get seatModePaused => 'Paused';

  @override
  String reactionFixed(String duration) {
    return 'Reaction $duration';
  }

  @override
  String get reactionRandom => 'Random reaction';

  @override
  String get botIqSmart => 'Plays smart';

  @override
  String get botIqFirstValid => 'First valid';

  @override
  String get botIqSloppy => 'Errs 20%';

  @override
  String get colorRed => 'red';

  @override
  String get colorGreen => 'green';

  @override
  String get colorBlue => 'blue';

  @override
  String get colorYellow => 'yellow';

  @override
  String cardNumberLabel(String color, int number) {
    return '$color $number';
  }

  @override
  String get cardNumber => 'Basic';

  @override
  String get cardBomb => 'Bomb';

  @override
  String get cardDefuse => 'Defuse';

  @override
  String get cardDetonate => 'Detonate';

  @override
  String get cardNope => 'Nope!';

  @override
  String get cardShield => 'Shield';

  @override
  String get cardSteal => 'Steal';

  @override
  String get cardTwist => 'Twist';

  @override
  String get cardBlind => 'Blind';

  @override
  String get rejectNotYourTurn => 'It\'s not your turn';

  @override
  String get rejectCardNotInHand => 'You no longer have this card';

  @override
  String get rejectInvalidTarget => 'Can\'t target this player';

  @override
  String get rejectNotAReaction => 'This card goes on the deck';

  @override
  String get rejectGhost => 'A ghost can only play Nope!';

  @override
  String get rejectNotGhost => 'Only a ghost gets Nope! without a card';

  @override
  String get rejectGhostNopeUsed => 'The ghost\'s Nope! is used up this round';

  @override
  String get rejectGhostNeedsCard => 'The ghost needs a Nope! card';

  @override
  String get rejectNothingToNope => 'Nothing to cancel';

  @override
  String get rejectNoPendingLoss => 'Too late for a Shield';

  @override
  String get rejectOwnTurn => 'You can\'t steal your own turn';

  @override
  String rejectTooEarly(String duration) {
    return 'Stealing works only after $duration of hesitation';
  }

  @override
  String get rejectGameOver => 'The game is over';

  @override
  String get rejectOther => 'Command rejected';

  @override
  String captionThrown(String player, String card, String duration) {
    return '$player: $card in $duration';
  }

  @override
  String captionThrownDraw(
    String player,
    String card,
    String duration,
    int count,
  ) {
    return '$player: $card in $duration, draws $count';
  }

  @override
  String captionInvalid(String player, String card) {
    return '$player: $card doesn\'t count';
  }

  @override
  String captionTimedOut(String player) {
    return '$player: time\'s up';
  }

  @override
  String captionStolen(String player, String victim) {
    return '$player: stole the turn ($victim)';
  }

  @override
  String captionNoped(String player, String card) {
    return '$player: Nope! on $card';
  }

  @override
  String captionNopeFizzled(String player) {
    return '$player: Nope! fizzled';
  }

  @override
  String captionBombSurfaced(int fuse) {
    return 'The bomb surfaced, fuse $fuse';
  }

  @override
  String captionBombExploded(String player) {
    return 'The bomb exploded: $player';
  }

  @override
  String captionDefused(String player) {
    return '$player: Defuse';
  }

  @override
  String captionRedirected(String player, String target) {
    return '$player: Detonate on $target';
  }

  @override
  String captionShield(String player) {
    return '$player: Shield';
  }

  @override
  String captionGhost(String player) {
    return '$player is a ghost';
  }

  @override
  String get hintDetonate => 'Drag Detonate onto the player who gets the bomb';

  @override
  String get hintSteal => 'Drag Steal onto the player whose turn it is';

  @override
  String toastInvalidCard(int count) {
    return 'Invalid card: you lose a life and draw $count';
  }

  @override
  String get toastTimeOut => 'Time\'s up';

  @override
  String toastShieldWindow(String duration) {
    return 'Shield within $duration!';
  }

  @override
  String toastTurnStolen(String player) {
    return '$player stole your turn';
  }

  @override
  String toastBombOnYou(String player) {
    return '$player sent the bomb to you';
  }

  @override
  String get toastNopeReturns => 'Nope! returns the turn to you';

  @override
  String get yourTurn => 'Your turn';

  @override
  String onTurn(String player) {
    return 'Turn: $player';
  }

  @override
  String deckCount(int count) {
    return 'Deck $count';
  }

  @override
  String ghostName(String name) {
    return '$name (ghost)';
  }

  @override
  String get ghostNope => 'Ghost Nope!';

  @override
  String get startHelp =>
      'Throw a card of the same color or number across the line above the deck. Swipe Nope! and Shield to the side, drag Detonate and Steal onto a player.';

  @override
  String get start => 'Start';

  @override
  String get youWin => 'You win';

  @override
  String get nobodySurvived => 'Nobody survived';

  @override
  String playerWins(String player) {
    return '$player wins';
  }

  @override
  String get playAgain => 'Play again';

  @override
  String get copyReplay => 'Copy replay';

  @override
  String get gameSettings => 'Game settings';

  @override
  String bombTurnsLeft(int fuse) {
    String _temp0 = intl.Intl.pluralLogic(
      fuse,
      locale: localeName,
      other: 'Bomb, $fuse turns left',
      one: 'Bomb, $fuse turn left',
    );
    return '$_temp0';
  }

  @override
  String get resume => 'Resume';

  @override
  String get pause => 'Pause';

  @override
  String get debug => 'Debug';

  @override
  String get sectionTime => 'Time';

  @override
  String get step => 'Step';

  @override
  String gameClock(String duration, int round) {
    return 'Game time $duration, round $round';
  }

  @override
  String get artificialLatency => 'Artificial latency';

  @override
  String get followTurn => 'View follows the player on turn';

  @override
  String get followTurnHint => 'Only seats controlled by a human';

  @override
  String get sectionForceCard => 'Force a card';

  @override
  String get number => 'Number';

  @override
  String get giveToHand => 'Put in hand';

  @override
  String get setAsTarget => 'Set as target';

  @override
  String get sectionBombAndLimit => 'Bomb and turn limit';

  @override
  String get noBomb => 'No bomb';

  @override
  String fuseValue(int fuse) {
    return 'Fuse $fuse';
  }

  @override
  String turnLimitNow(String duration) {
    return 'Round 1 limit (now $duration)';
  }

  @override
  String get loadFromClipboard => 'Load from clipboard';

  @override
  String get sectionEvents => 'Events';

  @override
  String get endGame => 'End game';

  @override
  String get removeLife => 'Remove a life';

  @override
  String get addLife => 'Add a life';
}
