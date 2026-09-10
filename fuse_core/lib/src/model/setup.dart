import 'card.dart';
import 'rules_config.dart';

final class PlayerSeat {
  const PlayerSeat(this.id, this.name);

  final String id;
  final String name;

  Map<String, Object?> toJson() => {'id': id, 'name': name};

  factory PlayerSeat.fromJson(Map<String, Object?> j) =>
      PlayerSeat(j['id'] as String, j['name'] as String);
}

/// Everything needed to create a game deterministically.
final class GameSetup {
  const GameSetup({
    required this.players,
    required this.seed,
    this.rules = const RulesConfig(),
    this.startTs = 0,
  });

  final List<PlayerSeat> players;
  final int seed;
  final RulesConfig rules;
  final int startTs;

  Map<String, Object?> toJson() => {
    'players': [for (final p in players) p.toJson()],
    'seed': seed,
    'rules': rules.toJson(),
    'startTs': startTs,
  };

  factory GameSetup.fromJson(Map<String, Object?> j) => GameSetup(
    players: [
      for (final p in j['players'] as List<Object?>)
        PlayerSeat.fromJson(p as Map<String, Object?>),
    ],
    seed: (j['seed'] as num).toInt(),
    rules: RulesConfig.fromJson(j['rules'] as Map<String, Object?>),
    startTs: (j['startTs'] as num?)?.toInt() ?? 0,
  );
}

/// Deck v1 split into the part that is dealt from and the cards that are
/// shuffled in only after dealing (bombs and defuses, PLAN §2).
({List<Card> dealable, List<Card> afterDeal}) buildDeck(RulesConfig rules) {
  var id = 0;
  final dealable = <Card>[];
  final afterDeal = <Card>[];
  final colors = CardColor.values.take(rules.colors);
  for (final color in colors) {
    for (var n = 1; n <= rules.maxNumber; n++) {
      dealable.add(Card.number(id++, color, n));
    }
  }
  for (final kind in CardKind.values) {
    if (kind == CardKind.number) continue;
    final count = rules.deckCounts[kind] ?? 0;
    final into = kind == CardKind.bomb || kind == CardKind.defuse
        ? afterDeal
        : dealable;
    for (var i = 0; i < count; i++) {
      into.add(Card.special(id++, kind));
    }
  }
  return (dealable: dealable, afterDeal: afterDeal);
}
