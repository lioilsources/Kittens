enum CardColor {
  red('R', 'červená'),
  green('G', 'zelená'),
  blue('B', 'modrá'),
  yellow('Y', 'žlutá');

  const CardColor(this.code, this.nameCs);
  final String code;
  final String nameCs;

  static CardColor fromCode(String code) => values.firstWhere(
    (c) => c.code == code,
    orElse: () => throw FormatException('Unknown color code: $code'),
  );
}

enum CardKind {
  /// Základ – barva × číslo.
  number('NUM', 'Základ'),

  /// Bomba – never in a hand; surfaces when drawn.
  bomb('BOMB', 'Bomba'),

  /// Zneškodni – thrown on your turn while a bomb is active.
  defuse('DEFUSE', 'Zneškodni'),

  /// Odpal – bomb stays, fuse = 1, turn jumps to the chosen target.
  detonate('DETONATE', 'Odpal'),

  /// Ne! – reaction, cancels the last played action card.
  nope('NOPE', 'Ne!'),

  /// Štít – reaction, saves a life within the shield window.
  shield('SHIELD', 'Štít'),

  /// Kradež – reaction, steals the turn from a hesitating player.
  steal('STEAL', 'Kradež'),

  /// Otoč – toggles matching to "±1 number, colour ignored".
  twist('TWIST', 'Otoč'),

  /// Slepá – the target card is hidden for a few turns.
  blind('BLIND', 'Slepá');

  const CardKind(this.code, this.nameCs);
  final String code;
  final String nameCs;

  bool get isReaction => this == nope || this == shield || this == steal;

  /// Cards whose effect can be cancelled by Ne!.
  bool get isNopeable =>
      this == defuse ||
      this == detonate ||
      this == twist ||
      this == blind ||
      this == shield ||
      this == steal;

  static CardKind fromCode(String code) => values.firstWhere(
    (k) => k.code == code,
    orElse: () => throw FormatException('Unknown card code: $code'),
  );
}

/// Immutable card. [id] is unique within one game so UI and commands can
/// refer to a concrete physical card.
final class Card {
  const Card._(this.id, this.kind, this.color, this.number);

  const Card.number(int id, CardColor color, int number)
    : this._(id, CardKind.number, color, number);

  factory Card.special(int id, CardKind kind) {
    if (kind == CardKind.number) {
      throw ArgumentError('Use Card.number for number cards');
    }
    return Card._(id, kind, null, null);
  }

  final int id;
  final CardKind kind;
  final CardColor? color;
  final int? number;

  bool get isNumber => kind == CardKind.number;

  /// Short human-readable code, e.g. `R7`, `BOMB`.
  String get code => isNumber ? '${color!.code}$number' : kind.code;

  String get labelCs => isNumber ? '${color!.nameCs} $number' : kind.nameCs;

  /// `R7#12` — code plus id.
  String toJson() => '$code#$id';

  static Card fromJson(Object? json) {
    if (json is! String) throw FormatException('Card must be a string: $json');
    final hash = json.lastIndexOf('#');
    if (hash <= 0) throw FormatException('Card missing id: $json');
    final code = json.substring(0, hash);
    final id = int.parse(json.substring(hash + 1));
    return parseCode(code, id);
  }

  /// Parses a code such as `R7` or `NOPE` into a card with the given [id].
  static Card parseCode(String code, int id) {
    final m = RegExp(r'^([RGBY])(\d{1,2})$').firstMatch(code);
    if (m != null) {
      return Card.number(id, CardColor.fromCode(m[1]!), int.parse(m[2]!));
    }
    return Card.special(id, CardKind.fromCode(code));
  }

  @override
  bool operator ==(Object other) =>
      other is Card &&
      other.id == id &&
      other.kind == kind &&
      other.color == color &&
      other.number == number;

  @override
  int get hashCode => Object.hash(id, kind, color, number);

  @override
  String toString() => toJson();
}
