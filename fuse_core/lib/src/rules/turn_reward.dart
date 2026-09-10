import '../model/rules_config.dart';

/// Cards to draw after a valid throw made [throwMs] after the turn started.
/// (Timeouts and invalid throws use `rules.drawPenalty`.)
int rewardDraw(RulesConfig rules, int throwMs) =>
    throwMs <= rules.fastThrowMs ? rules.drawFast : rules.drawNormal;
