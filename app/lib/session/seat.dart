import 'package:fuse_core/fuse_core.dart';

/// Who plays a seat in puppet mode (plan §6.2).
enum SeatMode {
  human,
  bot,

  /// Nobody plays it; the clock runs out unless you throw for it by hand.
  paused,
}

enum ReactionPreset {
  fast(FixedReaction(500)),
  slow(FixedReaction(1500)),
  random(UniformReaction(300, 1500));

  const ReactionPreset(this.model);

  final ReactionModel model;
}

final class SeatConfig {
  const SeatConfig({
    required this.id,
    required this.name,
    this.mode = SeatMode.bot,
    this.iq = BotIq.smart,
    this.reaction = ReactionPreset.random,
  });

  factory SeatConfig.fromJson(Map<String, Object?> j) => SeatConfig(
    id: j['id'] as String,
    name: j['name'] as String? ?? j['id'] as String,
    mode: SeatMode.values.byName(j['mode'] as String? ?? 'bot'),
    iq: j['iq'] == null ? BotIq.smart : BotIq.parse(j['iq'] as String),
    reaction: ReactionPreset.values.byName(
      j['reaction'] as String? ?? 'random',
    ),
  );

  final String id;
  final String name;
  final SeatMode mode;
  final BotIq iq;
  final ReactionPreset reaction;

  BotProfile get botProfile => BotProfile(iq: iq, reaction: reaction.model);

  SeatConfig copyWith({
    String? name,
    SeatMode? mode,
    BotIq? iq,
    ReactionPreset? reaction,
  }) => SeatConfig(
    id: id,
    name: name ?? this.name,
    mode: mode ?? this.mode,
    iq: iq ?? this.iq,
    reaction: reaction ?? this.reaction,
  );
}
