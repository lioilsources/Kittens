import 'package:fuse_core/fuse_core.dart';

/// Who plays a seat in puppet mode (plan §6.2).
enum SeatMode {
  human('Člověk'),
  bot('Bot'),

  /// Nobody plays it; the clock runs out unless you throw for it by hand.
  paused('Pauza');

  const SeatMode(this.labelCs);

  final String labelCs;
}

enum ReactionPreset {
  fast('0,5 s', FixedReaction(500)),
  slow('1,5 s', FixedReaction(1500)),
  random('Náhodně', UniformReaction(300, 1500));

  const ReactionPreset(this.labelCs, this.model);

  final String labelCs;
  final ReactionModel model;
}

extension BotIqLabel on BotIq {
  String get labelCs => switch (this) {
    BotIq.smart => 'Hraje chytře',
    BotIq.firstValid => 'První platná',
    BotIq.sloppy => 'Chybuje 20 %',
  };
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
