import 'card.dart';

/// How the turn limit shrinks during the game (open question §8).
enum LimitDecay {
  /// −step every round (a round = as many turns as there are living players).
  perRound,

  /// −step after every elimination.
  perElimination,
}

/// All tunable numbers of the rules. Defaults = PLAN §2 "Pravidla v1".
/// Times are game-time milliseconds.
final class RulesConfig {
  const RulesConfig({
    this.minPlayers = 2,
    this.maxPlayers = 5,
    this.startLives = 3,
    this.handSize = 5,
    this.turnLimitMs = 3000,
    this.turnLimitStepMs = 250,
    this.turnLimitMinMs = 1500,
    this.limitDecay = LimitDecay.perRound,
    this.fastThrowMs = 1000,
    this.drawFast = 0,
    this.drawNormal = 1,
    this.drawPenalty = 2,
    this.lifePenalty = 1,
    this.bombFuseTurns = 3,
    this.bombDamage = 2,
    this.stealThresholdMs = 2000,
    this.stealVictimDraw = 2,
    this.shieldWindowMs = 1000,
    this.shieldSavesLives = 1,
    this.nopeWindowMs = 2000,
    this.blindTurns = 2,
    this.ghostNopeNeedsCard = false,
    this.colors = 4,
    this.maxNumber = 10,
    this.deckCounts = defaultDeckCounts,
  });

  static const defaultDeckCounts = <CardKind, int>{
    CardKind.bomb: 4,
    CardKind.defuse: 6,
    CardKind.detonate: 4,
    CardKind.nope: 6,
    CardKind.shield: 4,
    CardKind.steal: 4,
    CardKind.twist: 2,
    CardKind.blind: 2,
  };

  final int minPlayers;
  final int maxPlayers;
  final int startLives;
  final int handSize;

  /// Turn limit in round 0.
  final int turnLimitMs;
  final int turnLimitStepMs;
  final int turnLimitMinMs;
  final LimitDecay limitDecay;

  /// Throw time ≤ this → [drawFast] cards.
  final int fastThrowMs;
  final int drawFast;
  final int drawNormal;

  /// Draw count after a timeout or an invalid card.
  final int drawPenalty;

  /// Lives lost for a timeout or an invalid card.
  final int lifePenalty;

  final int bombFuseTurns;
  final int bombDamage;

  /// Steal is allowed when the player on turn has hesitated strictly longer.
  final int stealThresholdMs;
  final int stealVictimDraw;

  /// Shield must be thrown within this time from the start of a life loss.
  final int shieldWindowMs;
  final int shieldSavesLives;

  /// Ne! must come within this time of the action (and in the same turn).
  final int nopeWindowMs;
  final int blindTurns;

  /// If false, a ghost's once-per-round Ne! is a free ability (no card).
  final bool ghostNopeNeedsCard;

  final int colors;
  final int maxNumber;
  final Map<CardKind, int> deckCounts;

  int get deckSize =>
      colors * maxNumber + deckCounts.values.fold(0, (a, b) => a + b);

  /// Turn limit for the given progress of the game.
  int turnLimitFor({required int round, required int eliminations}) {
    final steps = switch (limitDecay) {
      LimitDecay.perRound => round,
      LimitDecay.perElimination => eliminations,
    };
    final limit = turnLimitMs - steps * turnLimitStepMs;
    return limit < turnLimitMinMs ? turnLimitMinMs : limit;
  }

  RulesConfig copyWith({
    int? minPlayers,
    int? maxPlayers,
    int? startLives,
    int? handSize,
    int? turnLimitMs,
    int? turnLimitStepMs,
    int? turnLimitMinMs,
    LimitDecay? limitDecay,
    int? fastThrowMs,
    int? drawFast,
    int? drawNormal,
    int? drawPenalty,
    int? lifePenalty,
    int? bombFuseTurns,
    int? bombDamage,
    int? stealThresholdMs,
    int? stealVictimDraw,
    int? shieldWindowMs,
    int? shieldSavesLives,
    int? nopeWindowMs,
    int? blindTurns,
    bool? ghostNopeNeedsCard,
    int? colors,
    int? maxNumber,
    Map<CardKind, int>? deckCounts,
  }) => RulesConfig(
    minPlayers: minPlayers ?? this.minPlayers,
    maxPlayers: maxPlayers ?? this.maxPlayers,
    startLives: startLives ?? this.startLives,
    handSize: handSize ?? this.handSize,
    turnLimitMs: turnLimitMs ?? this.turnLimitMs,
    turnLimitStepMs: turnLimitStepMs ?? this.turnLimitStepMs,
    turnLimitMinMs: turnLimitMinMs ?? this.turnLimitMinMs,
    limitDecay: limitDecay ?? this.limitDecay,
    fastThrowMs: fastThrowMs ?? this.fastThrowMs,
    drawFast: drawFast ?? this.drawFast,
    drawNormal: drawNormal ?? this.drawNormal,
    drawPenalty: drawPenalty ?? this.drawPenalty,
    lifePenalty: lifePenalty ?? this.lifePenalty,
    bombFuseTurns: bombFuseTurns ?? this.bombFuseTurns,
    bombDamage: bombDamage ?? this.bombDamage,
    stealThresholdMs: stealThresholdMs ?? this.stealThresholdMs,
    stealVictimDraw: stealVictimDraw ?? this.stealVictimDraw,
    shieldWindowMs: shieldWindowMs ?? this.shieldWindowMs,
    shieldSavesLives: shieldSavesLives ?? this.shieldSavesLives,
    nopeWindowMs: nopeWindowMs ?? this.nopeWindowMs,
    blindTurns: blindTurns ?? this.blindTurns,
    ghostNopeNeedsCard: ghostNopeNeedsCard ?? this.ghostNopeNeedsCard,
    colors: colors ?? this.colors,
    maxNumber: maxNumber ?? this.maxNumber,
    deckCounts: deckCounts ?? this.deckCounts,
  );

  Map<String, Object?> toJson() => {
    'minPlayers': minPlayers,
    'maxPlayers': maxPlayers,
    'startLives': startLives,
    'handSize': handSize,
    'turnLimitMs': turnLimitMs,
    'turnLimitStepMs': turnLimitStepMs,
    'turnLimitMinMs': turnLimitMinMs,
    'limitDecay': limitDecay.name,
    'fastThrowMs': fastThrowMs,
    'drawFast': drawFast,
    'drawNormal': drawNormal,
    'drawPenalty': drawPenalty,
    'lifePenalty': lifePenalty,
    'bombFuseTurns': bombFuseTurns,
    'bombDamage': bombDamage,
    'stealThresholdMs': stealThresholdMs,
    'stealVictimDraw': stealVictimDraw,
    'shieldWindowMs': shieldWindowMs,
    'shieldSavesLives': shieldSavesLives,
    'nopeWindowMs': nopeWindowMs,
    'blindTurns': blindTurns,
    'ghostNopeNeedsCard': ghostNopeNeedsCard,
    'colors': colors,
    'maxNumber': maxNumber,
    'deckCounts': {for (final e in deckCounts.entries) e.key.code: e.value},
  };

  /// Missing keys fall back to defaults, so old replays stay loadable.
  factory RulesConfig.fromJson(Map<String, Object?> j) {
    const d = RulesConfig();
    int i(String k, int def) => (j[k] as num?)?.toInt() ?? def;
    final counts = j['deckCounts'] as Map<String, Object?>?;
    return RulesConfig(
      minPlayers: i('minPlayers', d.minPlayers),
      maxPlayers: i('maxPlayers', d.maxPlayers),
      startLives: i('startLives', d.startLives),
      handSize: i('handSize', d.handSize),
      turnLimitMs: i('turnLimitMs', d.turnLimitMs),
      turnLimitStepMs: i('turnLimitStepMs', d.turnLimitStepMs),
      turnLimitMinMs: i('turnLimitMinMs', d.turnLimitMinMs),
      limitDecay: j['limitDecay'] == null
          ? d.limitDecay
          : LimitDecay.values.byName(j['limitDecay'] as String),
      fastThrowMs: i('fastThrowMs', d.fastThrowMs),
      drawFast: i('drawFast', d.drawFast),
      drawNormal: i('drawNormal', d.drawNormal),
      drawPenalty: i('drawPenalty', d.drawPenalty),
      lifePenalty: i('lifePenalty', d.lifePenalty),
      bombFuseTurns: i('bombFuseTurns', d.bombFuseTurns),
      bombDamage: i('bombDamage', d.bombDamage),
      stealThresholdMs: i('stealThresholdMs', d.stealThresholdMs),
      stealVictimDraw: i('stealVictimDraw', d.stealVictimDraw),
      shieldWindowMs: i('shieldWindowMs', d.shieldWindowMs),
      shieldSavesLives: i('shieldSavesLives', d.shieldSavesLives),
      nopeWindowMs: i('nopeWindowMs', d.nopeWindowMs),
      blindTurns: i('blindTurns', d.blindTurns),
      ghostNopeNeedsCard:
          j['ghostNopeNeedsCard'] as bool? ?? d.ghostNopeNeedsCard,
      colors: i('colors', d.colors),
      maxNumber: i('maxNumber', d.maxNumber),
      deckCounts: counts == null
          ? d.deckCounts
          : {
              for (final e in counts.entries)
                CardKind.fromCode(e.key): (e.value as num).toInt(),
            },
    );
  }
}
