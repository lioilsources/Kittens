import '../model/game_state.dart';

/// Fuse semantics: `fuse` = completed turns left including the current one.
/// A *completed* turn (valid throw, invalid throw, timeout) ticks the fuse;
/// a *transferred* turn (Kradež, Odpal, Ne! revert) does not. When the tick
/// reaches 0, the player whose turn just completed takes the bomb damage.
({BombState? bomb, bool exploded}) tickFuse(BombState? bomb) {
  if (bomb == null) return (bomb: null, exploded: false);
  final fuse = bomb.fuse - 1;
  if (fuse <= 0) return (bomb: null, exploded: true);
  return (bomb: BombState(card: bomb.card, fuse: fuse), exploded: false);
}
