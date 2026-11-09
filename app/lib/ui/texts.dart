import 'package:fuse_core/fuse_core.dart';

import '../l10n/l10n.dart';
import 'theme.dart';

/// Why the host refused a command, in the player's words.
String rejectText(AppLocalizations l, String reason, RulesConfig rules) =>
    switch (reason) {
      RejectReason.notYourTurn => l.rejectNotYourTurn,
      RejectReason.cardNotInHand => l.rejectCardNotInHand,
      RejectReason.invalidTarget => l.rejectInvalidTarget,
      RejectReason.notAReaction => l.rejectNotAReaction,
      RejectReason.ghost => l.rejectGhost,
      RejectReason.notGhost => l.rejectNotGhost,
      RejectReason.ghostNopeUsed => l.rejectGhostNopeUsed,
      RejectReason.ghostNeedsCard => l.rejectGhostNeedsCard,
      RejectReason.nothingToNope => l.rejectNothingToNope,
      RejectReason.noPendingLoss => l.rejectNoPendingLoss,
      RejectReason.ownTurn => l.rejectOwnTurn,
      RejectReason.tooEarly => l.rejectTooEarly(
        seconds(rules.stealThresholdMs),
      ),
      RejectReason.gameOver => l.rejectGameOver,
      _ => l.rejectOther,
    };

String? commandOwner(Command command) => switch (command) {
  PlayCard(:final playerId) ||
  PlayReaction(:final playerId) ||
  GhostNope(:final playerId) => playerId,
  _ => null,
};

/// One-line description of what just happened at the table.
String? captionFor(
  AppLocalizations l,
  GameEvent e,
  String Function(String id) name,
) => switch (e) {
  CardThrown(:final playerId, :final card, :final throwMs, :final draw) =>
    draw > 0
        ? l.captionThrownDraw(
            name(playerId),
            l.cardLabel(card),
            seconds(throwMs, digits: 2),
            draw,
          )
        : l.captionThrown(
            name(playerId),
            l.cardLabel(card),
            seconds(throwMs, digits: 2),
          ),
  InvalidThrow(:final playerId, :final card) => l.captionInvalid(
    name(playerId),
    l.cardLabel(card),
  ),
  TurnTimedOut(:final playerId) => l.captionTimedOut(name(playerId)),
  TurnStolen(:final byPlayerId, :final fromPlayerId) => l.captionStolen(
    name(byPlayerId),
    name(fromPlayerId),
  ),
  ActionNoped(:final byPlayerId, :final actionKind) => l.captionNoped(
    name(byPlayerId),
    l.kindName(actionKind),
  ),
  NopeFizzled(:final playerId) => l.captionNopeFizzled(name(playerId)),
  BombSurfaced(:final drawnBy, :final fuse) when drawnBy != null =>
    l.captionBombSurfaced(fuse),
  BombExploded(:final playerId) => l.captionBombExploded(name(playerId)),
  BombDefused(:final playerId) => l.captionDefused(name(playerId)),
  BombRedirected(:final playerId, :final targetPlayerId) => l.captionRedirected(
    name(playerId),
    name(targetPlayerId),
  ),
  ShieldUsed(:final playerId) => l.captionShield(name(playerId)),
  PlayerBecameGhost(:final playerId) => l.captionGhost(name(playerId)),
  _ => null,
};
