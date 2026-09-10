import 'package:flutter/material.dart' hide Card;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fuse/main.dart';
import 'package:fuse/session/scenario.dart';
import 'package:fuse/state/providers.dart';
import 'package:fuse_core/fuse_core.dart';

Scenario _scenario(List<String> give) => Scenario.fromJson({
  'name': 'Test',
  'viewAs': 'p1',
  'seed': 3,
  'seats': [
    {'id': 'p1', 'name': 'Ty', 'mode': 'human'},
    {'id': 'p2', 'name': 'Anna', 'mode': 'paused'},
    {'id': 'p3', 'name': 'Bára', 'mode': 'paused'},
  ],
  'commands': [
    {'type': 'debugSetTarget', 'code': 'R1', 'serverTs': 0},
    for (final code in give)
      {'type': 'debugGiveCard', 'playerId': 'p1', 'code': code, 'serverTs': 0},
  ],
});

Future<ProviderContainer> _startTable(WidgetTester tester, Scenario s) async {
  tester.view
    ..physicalSize = const Size(1179, 2556)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  final container = ProviderContainer();
  addTearDown(container.dispose);
  await tester.pumpWidget(
    UncontrolledProviderScope(container: container, child: const FuseApp()),
  );
  container.read(sessionProvider.notifier).startScenario(s);
  await tester.pump();
  await tester.pump();
  await tester.tap(find.text('Začít'));
  await tester.pump();
  return container;
}

Future<void> _finish(WidgetTester tester, ProviderContainer container) async {
  container.read(sessionProvider.notifier).quit();
  await tester.pump(const Duration(seconds: 2));
}

void main() {
  testWidgets('a card dragged over the deck line is thrown through the host', (
    tester,
  ) async {
    final container = await _startTable(tester, _scenario(['R5']));
    final host = container.read(sessionProvider)!.host;
    final card = host.state.player('p1').hand.lastWhere((c) => c.code == 'R5');

    await tester.drag(
      find.byKey(ValueKey('card-${card.id}')),
      const Offset(0, -520),
    );
    await tester.pump(const Duration(milliseconds: 300));

    final thrown = host.game.events.whereType<CardThrown>().single;
    expect(thrown.card.id, card.id);
    expect(host.state.target.id, card.id);
    expect(
      find.byKey(ValueKey('card-${card.id}')),
      findsNothing,
      reason: 'the card left the hand',
    );
    await _finish(tester, container);
  });

  testWidgets('a short drag returns the card without playing it', (
    tester,
  ) async {
    final container = await _startTable(tester, _scenario(['R5']));
    final host = container.read(sessionProvider)!.host;
    final card = host.state.player('p1').hand.lastWhere((c) => c.code == 'R5');

    await tester.drag(
      find.byKey(ValueKey('card-${card.id}')),
      const Offset(0, -60),
    );
    await tester.pump(const Duration(milliseconds: 300));

    expect(host.game.events.whereType<CardThrown>(), isEmpty);
    expect(host.game.events.whereType<InvalidThrow>(), isEmpty);
    expect(host.state.player('p1').hand.map((c) => c.id), contains(card.id));
    await _finish(tester, container);
  });

  testWidgets('Odpal dropped on an avatar targets that player', (tester) async {
    final container = await _startTable(tester, _scenario(['DETONATE']));
    final host = container.read(sessionProvider)!.host
      ..debug(const DebugSetBomb(fuse: 2, serverTs: 0));
    await tester.pump();
    final card = host.state
        .player('p1')
        .hand
        .lastWhere((c) => c.kind == CardKind.detonate);

    final from = tester.getCenter(find.byKey(ValueKey('card-${card.id}')));
    final to = tester.getCenter(find.text('Bára'));
    final gesture = await tester.startGesture(from);
    for (var i = 1; i <= 12; i++) {
      await gesture.moveTo(Offset.lerp(from, to, i / 12)!);
      await tester.pump(const Duration(milliseconds: 16));
    }
    await gesture.up();
    await tester.pump(const Duration(milliseconds: 300));

    final redirected = host.game.events.whereType<BombRedirected>().single;
    expect(redirected.targetPlayerId, 'p3');
    expect(host.state.turn.playerId, 'p3');
    await _finish(tester, container);
  });
}
