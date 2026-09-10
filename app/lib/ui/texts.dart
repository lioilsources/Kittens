import 'package:fuse_core/fuse_core.dart';

import 'theme.dart';

/// Why the host refused a command, in the player's words.
String rejectText(String reason, RulesConfig rules) => switch (reason) {
  RejectReason.notYourTurn => 'Nejsi na tahu',
  RejectReason.cardNotInHand => 'Tuhle kartu už nemáš',
  RejectReason.invalidTarget => 'Na tohoto hráče to nejde',
  RejectReason.notAReaction => 'Tahle karta se hází na balíček',
  RejectReason.ghost => 'Duch může hrát jen Ne!',
  RejectReason.notGhost => 'Ne! bez karty má jen duch',
  RejectReason.ghostNopeUsed => 'Ne! ducha už v tomhle kole padlo',
  RejectReason.ghostNeedsCard => 'Duch potřebuje kartu Ne!',
  RejectReason.nothingToNope => 'Není co zrušit',
  RejectReason.noPendingLoss => 'Štít už nestihneš',
  RejectReason.ownTurn => 'Svůj vlastní tah ukrást nejde',
  RejectReason.tooEarly =>
    'Krást jde až po ${seconds(rules.stealThresholdMs)} váhání',
  RejectReason.gameOver => 'Hra skončila',
  _ => 'Příkaz odmítnut',
};

String? commandOwner(Command command) => switch (command) {
  PlayCard(:final playerId) ||
  PlayReaction(:final playerId) ||
  GhostNope(:final playerId) => playerId,
  _ => null,
};

/// One-line description of what just happened at the table.
String? captionFor(GameEvent e, String Function(String id) name) => switch (e) {
  CardThrown(:final playerId, :final card, :final throwMs, :final draw) =>
    '${name(playerId)}: ${card.labelCs} za ${seconds(throwMs, digits: 2)}'
        '${draw > 0 ? ', bere $draw' : ''}',
  InvalidThrow(:final playerId, :final card) =>
    '${name(playerId)}: ${card.labelCs} neplatí',
  TurnTimedOut(:final playerId) => '${name(playerId)}: čas vypršel',
  TurnStolen(:final byPlayerId, :final fromPlayerId) =>
    '${name(byPlayerId)}: Kradež tahu (${name(fromPlayerId)})',
  ActionNoped(:final byPlayerId, :final actionKind) =>
    '${name(byPlayerId)}: Ne! na ${actionKind.nameCs}',
  NopeFizzled(:final playerId) => '${name(playerId)}: Ne! propadlo',
  BombSurfaced(:final drawnBy, :final fuse) when drawnBy != null =>
    'Bomba se vynořila, fuse $fuse',
  BombExploded(:final playerId) => 'Bomba vybuchla: ${name(playerId)}',
  BombDefused(:final playerId) => '${name(playerId)}: Zneškodni',
  BombRedirected(:final playerId, :final targetPlayerId) =>
    '${name(playerId)}: Odpal na ${name(targetPlayerId)}',
  ShieldUsed(:final playerId) => '${name(playerId)}: Štít',
  PlayerBecameGhost(:final playerId) => '${name(playerId)} je duch',
  _ => null,
};
