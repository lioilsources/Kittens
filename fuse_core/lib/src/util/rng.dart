/// Portable, seedable PRNG (xoshiro128**) using only 32-bit safe arithmetic,
/// so the same seed yields the same sequence on every platform. The engine
/// stores the 4-word state inside [GameState], which makes replays exact.
class Rng {
  Rng._(this._s0, this._s1, this._s2, this._s3);

  factory Rng.seeded(int seed) {
    var x = seed & _mask;
    int next() {
      // splitmix32
      x = (x + 0x9e3779b9) & _mask;
      var z = x;
      z = _imul(z ^ (z >>> 16), 0x85ebca6b);
      z = _imul(z ^ (z >>> 13), 0xc2b2ae35);
      return (z ^ (z >>> 16)) & _mask;
    }

    final s = [next(), next(), next(), next()];
    if (s.every((w) => w == 0)) s[0] = 1;
    return Rng._(s[0], s[1], s[2], s[3]);
  }

  factory Rng.fromState(List<int> state) {
    if (state.length != 4) {
      throw ArgumentError.value(state, 'state', 'expected 4 words');
    }
    return Rng._(state[0], state[1], state[2], state[3]);
  }

  static const _mask = 0xffffffff;

  int _s0, _s1, _s2, _s3;

  List<int> get state => List.unmodifiable([_s0, _s1, _s2, _s3]);

  /// Next raw 32-bit unsigned value.
  int nextUint32() {
    final result = _imul(_rotl(_imul(_s1, 5), 7), 9);
    final t = (_s1 << 9) & _mask;
    _s2 ^= _s0;
    _s3 ^= _s1;
    _s1 ^= _s2;
    _s0 ^= _s3;
    _s2 ^= t;
    _s3 = _rotl(_s3, 11);
    return result;
  }

  /// Uniform integer in `[0, max)`.
  int nextInt(int max) {
    if (max <= 0) throw ArgumentError.value(max, 'max', 'must be > 0');
    // Rejection sampling to avoid modulo bias.
    final limit = 0x100000000 - (0x100000000 % max);
    while (true) {
      final v = nextUint32();
      if (v < limit) return v % max;
    }
  }

  /// Uniform double in `[0, 1)`.
  double nextDouble() => nextUint32() / 0x100000000;

  void shuffle<T>(List<T> list) {
    for (var i = list.length - 1; i > 0; i--) {
      final j = nextInt(i + 1);
      final tmp = list[i];
      list[i] = list[j];
      list[j] = tmp;
    }
  }

  static int _rotl(int x, int k) =>
      ((x << k) & _mask) | ((x & _mask) >>> (32 - k));

  static int _imul(int a, int b) {
    a &= _mask;
    b &= _mask;
    final lo = (a & 0xffff) * b;
    final hi = (((a >>> 16) * b) & 0xffff) << 16;
    return (lo + hi) & _mask;
  }
}

/// Stateless deterministic hash of a few ints → `[0, 1)`. Used by bots so their
/// "random" reaction times are a pure function of (seed, situation).
double hashUnit(int a, [int b = 0, int c = 0, int d = 0]) {
  var h = 0x811c9dc5;
  for (final v in [a, b, c, d]) {
    h = Rng._imul(h ^ (v & 0xffffffff), 0x01000193);
    h = Rng._imul(h ^ (h >>> 15), 0x2c1b3c6d);
  }
  h ^= h >>> 16;
  return (h & 0xffffffff) / 0x100000000;
}
