import '../model/game_state.dart';

/// Kradež: the player on turn must have hesitated strictly longer than the
/// threshold.
bool stealAllowedAt(GameState state, int ts) =>
    ts - state.turn.startedAt > state.rules.stealThresholdMs;

/// Štít: the earliest pending loss of [playerId] whose window is still open.
PendingLifeLoss? shieldableLoss(GameState state, String playerId, int ts) {
  PendingLifeLoss? best;
  for (final l in state.pendingLosses) {
    if (l.playerId != playerId) continue;
    if (ts > l.startedAt + state.rules.shieldWindowMs || ts > l.deadline) {
      continue;
    }
    if (best == null || l.deadline < best.deadline) best = l;
  }
  return best;
}

/// Ne!: the last action exists and its window is open (same turn, in time).
/// A second Ne! on an already cancelled action is accepted but fizzles.
bool nopeTargetOpen(GameState state, int ts) {
  final a = state.lastAction;
  return a != null && a.isOpenAt(ts, state.turn.seq, state.rules);
}

/// A ghost may use Ne! once per round.
bool ghostNopeAvailable(GameState state, PlayerState player) =>
    player.isGhost && player.ghostNopeRound != state.round;
