import '../model/card.dart';
import '../model/game_state.dart';

/// Number card vs. target. Normal: colour or number. Otoč: number ±1 only.
bool matchesTarget(Card card, Card target, MatchMode mode) {
  if (!card.isNumber || !target.isNumber) return false;
  return switch (mode) {
    MatchMode.normal =>
      card.color == target.color || card.number == target.number,
    MatchMode.twist => (card.number! - target.number!).abs() == 1,
  };
}

/// Whether an up-swipe throw of [card] is valid in [state]. An invalid throw
/// costs a life; it is not the same as a rejected (malformed) command.
bool isValidThrow(GameState state, Card card) => switch (card.kind) {
  CardKind.number => matchesTarget(card, state.target, state.matchMode),
  CardKind.twist || CardKind.blind => true,
  CardKind.defuse || CardKind.detonate => state.bomb != null,
  CardKind.bomb || CardKind.nope || CardKind.shield || CardKind.steal => false,
};
