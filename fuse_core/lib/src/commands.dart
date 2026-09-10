/// Commands are the only way to change the game. A client creates a command
/// with its local `clientTs`; the host stamps the authoritative `serverTs`
/// (game time) and feeds it to the engine. `serverTs` must never decrease.
sealed class Command {
  const Command({required this.serverTs, this.clientTs});

  final int serverTs;
  final int? clientTs;

  String get type;

  /// Same command with a host-assigned timestamp.
  Command stamped(int serverTs);

  Map<String, Object?> _fields();

  Map<String, Object?> toJson() => {
    'type': type,
    'serverTs': serverTs,
    if (clientTs != null) 'clientTs': clientTs,
    ..._fields(),
  };

  static Command fromJson(Map<String, Object?> j) {
    final ts = (j['serverTs'] as num).toInt();
    final cts = (j['clientTs'] as num?)?.toInt();
    String s(String k) => j[k] as String;
    int i(String k) => (j[k] as num).toInt();
    return switch (j['type']) {
      'playCard' => PlayCard(
        playerId: s('playerId'),
        cardId: i('cardId'),
        targetPlayerId: j['targetPlayerId'] as String?,
        serverTs: ts,
        clientTs: cts,
      ),
      'playReaction' => PlayReaction(
        playerId: s('playerId'),
        cardId: i('cardId'),
        targetPlayerId: j['targetPlayerId'] as String?,
        serverTs: ts,
        clientTs: cts,
      ),
      'ghostNope' => GhostNope(
        playerId: s('playerId'),
        serverTs: ts,
        clientTs: cts,
      ),
      'timerExpired' => TimerExpired(serverTs: ts),
      'debugGiveCard' => DebugGiveCard(
        playerId: s('playerId'),
        code: s('code'),
        serverTs: ts,
      ),
      'debugSetBomb' => DebugSetBomb(
        fuse: (j['fuse'] as num?)?.toInt(),
        serverTs: ts,
      ),
      'debugSetTurnLimit' => DebugSetTurnLimit(
        limitMs: i('limitMs'),
        serverTs: ts,
      ),
      'debugSetLives' => DebugSetLives(
        playerId: s('playerId'),
        lives: i('lives'),
        serverTs: ts,
      ),
      'debugSetTarget' => DebugSetTarget(code: s('code'), serverTs: ts),
      final other => throw FormatException('Unknown command type: $other'),
    };
  }

  @override
  String toString() => toJson().toString();
}

/// Up-swipe: throw a card onto the deck during your own turn.
/// [targetPlayerId] is required for Odpal.
final class PlayCard extends Command {
  const PlayCard({
    required this.playerId,
    required this.cardId,
    this.targetPlayerId,
    required super.serverTs,
    super.clientTs,
  });

  final String playerId;
  final int cardId;
  final String? targetPlayerId;

  @override
  String get type => 'playCard';

  @override
  PlayCard stamped(int serverTs) => PlayCard(
    playerId: playerId,
    cardId: cardId,
    targetPlayerId: targetPlayerId,
    serverTs: serverTs,
    clientTs: clientTs,
  );

  @override
  Map<String, Object?> _fields() => {
    'playerId': playerId,
    'cardId': cardId,
    if (targetPlayerId != null) 'targetPlayerId': targetPlayerId,
  };
}

/// Side-swipe onto an avatar: Ne!, Štít or Kradež (kind comes from the card).
final class PlayReaction extends Command {
  const PlayReaction({
    required this.playerId,
    required this.cardId,
    this.targetPlayerId,
    required super.serverTs,
    super.clientTs,
  });

  final String playerId;
  final int cardId;
  final String? targetPlayerId;

  @override
  String get type => 'playReaction';

  @override
  PlayReaction stamped(int serverTs) => PlayReaction(
    playerId: playerId,
    cardId: cardId,
    targetPlayerId: targetPlayerId,
    serverTs: serverTs,
    clientTs: clientTs,
  );

  @override
  Map<String, Object?> _fields() => {
    'playerId': playerId,
    'cardId': cardId,
    if (targetPlayerId != null) 'targetPlayerId': targetPlayerId,
  };
}

/// A ghost's once-per-round Ne! (without a card, unless rules say otherwise).
final class GhostNope extends Command {
  const GhostNope({
    required this.playerId,
    required super.serverTs,
    super.clientTs,
  });

  final String playerId;

  @override
  String get type => 'ghostNope';

  @override
  GhostNope stamped(int serverTs) =>
      GhostNope(playerId: playerId, serverTs: serverTs, clientTs: clientTs);

  @override
  Map<String, Object?> _fields() => {'playerId': playerId};
}

/// Host-generated only. Resolves every deadline ≤ serverTs: the turn timeout
/// and closing Štít windows (committing life losses).
final class TimerExpired extends Command {
  const TimerExpired({required super.serverTs});

  @override
  String get type => 'timerExpired';

  @override
  TimerExpired stamped(int serverTs) => TimerExpired(serverTs: serverTs);

  @override
  Map<String, Object?> _fields() => const {};
}

/// Marker for debug-panel commands (logged in replays like any other).
sealed class DebugCommand extends Command {
  const DebugCommand({required super.serverTs});
}

/// Puts a card with [code] (e.g. `R7`, `NOPE`) into a hand. Takes a matching
/// card from the deck/discard if there is one, otherwise mints a new card.
final class DebugGiveCard extends DebugCommand {
  const DebugGiveCard({
    required this.playerId,
    required this.code,
    required super.serverTs,
  });

  final String playerId;
  final String code;

  @override
  String get type => 'debugGiveCard';

  @override
  DebugGiveCard stamped(int serverTs) =>
      DebugGiveCard(playerId: playerId, code: code, serverTs: serverTs);

  @override
  Map<String, Object?> _fields() => {'playerId': playerId, 'code': code};
}

/// Forces a bomb on top with the given fuse; `null` removes the active bomb.
final class DebugSetBomb extends DebugCommand {
  const DebugSetBomb({required this.fuse, required super.serverTs});

  final int? fuse;

  @override
  String get type => 'debugSetBomb';

  @override
  DebugSetBomb stamped(int serverTs) =>
      DebugSetBomb(fuse: fuse, serverTs: serverTs);

  @override
  Map<String, Object?> _fields() => {'fuse': fuse};
}

/// Overrides the base turn limit (also applied to the running turn).
final class DebugSetTurnLimit extends DebugCommand {
  const DebugSetTurnLimit({required this.limitMs, required super.serverTs});

  final int limitMs;

  @override
  String get type => 'debugSetTurnLimit';

  @override
  DebugSetTurnLimit stamped(int serverTs) =>
      DebugSetTurnLimit(limitMs: limitMs, serverTs: serverTs);

  @override
  Map<String, Object?> _fields() => {'limitMs': limitMs};
}

final class DebugSetLives extends DebugCommand {
  const DebugSetLives({
    required this.playerId,
    required this.lives,
    required super.serverTs,
  });

  final String playerId;
  final int lives;

  @override
  String get type => 'debugSetLives';

  @override
  DebugSetLives stamped(int serverTs) =>
      DebugSetLives(playerId: playerId, lives: lives, serverTs: serverTs);

  @override
  Map<String, Object?> _fields() => {'playerId': playerId, 'lives': lives};
}

/// Replaces the target card with a number card [code] (e.g. `B3`).
final class DebugSetTarget extends DebugCommand {
  const DebugSetTarget({required this.code, required super.serverTs});

  final String code;

  @override
  String get type => 'debugSetTarget';

  @override
  DebugSetTarget stamped(int serverTs) =>
      DebugSetTarget(code: code, serverTs: serverTs);

  @override
  Map<String, Object?> _fields() => {'code': code};
}
