import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart' hide Card;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fuse_core/fuse_core.dart';

import '../../l10n/l10n.dart';
import '../../session/client_session.dart';
import '../../session/host_session.dart';
import '../../session/puppet_session.dart';
import '../../session/seat.dart';
import '../../state/providers.dart';
import '../card_face.dart';
import '../debug/debug_panel.dart';
import '../hand/hand_view.dart';
import '../texts.dart';
import '../theme.dart';
import 'deck_view.dart';
import 'puppet_bar.dart';
import 'seat_avatar.dart';

class TableScreen extends ConsumerStatefulWidget {
  const TableScreen({super.key});

  @override
  ConsumerState<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends ConsumerState<TableScreen> {
  final _layerKey = GlobalKey();
  final _deckKey = GlobalKey();
  final _seatKeys = <String, GlobalKey>{};

  Card? _dragging;
  int _shakeToken = 0;
  bool _started = false;
  String? _toast;
  Timer? _toastTimer;
  String? _caption;

  // Layout of the last build, in table-layer coordinates.
  Offset _deckCenter = Offset.zero;
  double _deckSize = 0;
  double _deckLineY = 0;
  double _handTop = 0;

  GlobalKey _seatKey(String id) => _seatKeys.putIfAbsent(id, GlobalKey.new);

  @override
  void dispose() {
    _toastTimer?.cancel();
    super.dispose();
  }

  RenderBox? get _layer =>
      _layerKey.currentContext?.findRenderObject() as RenderBox?;

  Rect? _globalRect(GlobalKey key) {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null || !box.attached || !box.hasSize) return null;
    return box.localToGlobal(Offset.zero) & box.size;
  }

  void _showToast(String text) {
    _toastTimer?.cancel();
    setState(() => _toast = text);
    _toastTimer = Timer(const Duration(milliseconds: 1700), () {
      if (mounted) setState(() => _toast = null);
    });
  }

  // ------------------------------------------------------------- drop zones

  DropZone _resolve(Offset global, PlayerView view) {
    final layer = _layer;
    if (layer == null) return const NoZone();
    final p = layer.globalToLocal(global);
    for (final entry in _seatKeys.entries) {
      if (entry.key == view.myId) continue;
      final rect = _globalRect(entry.value);
      if (rect == null) continue;
      final local = layer.globalToLocal(rect.topLeft) & rect.size;
      if (local.inflate(14).contains(p)) return SeatZone(entry.key);
    }
    if (p.dy < _deckLineY && (p.dx - _deckCenter.dx).abs() < _deckSize * 0.55) {
      return const DeckZone();
    }
    final w = layer.size.width;
    if ((p.dx < w * 0.17 || p.dx > w * 0.83) && p.dy < _handTop) {
      return const SideZone();
    }
    return const NoZone();
  }

  Offset? _release(
    ClientSession client,
    PlayerView view,
    Card card,
    DropZone zone,
    Offset global,
  ) {
    Offset? seatCenter(String id) => _globalRect(_seatKey(id))?.center;
    final deck = _globalRect(_deckKey)?.center;
    switch (card.kind) {
      case CardKind.detonate:
        if (zone is SeatZone) {
          client.throwCard(card, targetPlayerId: zone.playerId);
          return seatCenter(zone.playerId);
        }
        if (zone is DeckZone) {
          _showToast(context.l10n.hintDetonate);
        }
        return null;
      case CardKind.steal:
        if (zone is SeatZone) {
          client.react(card, targetPlayerId: zone.playerId);
          return seatCenter(zone.playerId);
        }
        if (zone is! NoZone) {
          _showToast(context.l10n.hintSteal);
        }
        return null;
      case CardKind.nope || CardKind.shield:
        switch (zone) {
          case NoZone():
            return null;
          case SeatZone(:final playerId):
            client.react(card);
            return seatCenter(playerId);
          case DeckZone():
            client.react(card);
            return deck;
          case SideZone():
            client.react(card);
            final width = _layer?.size.width ?? 400;
            return Offset(global.dx < width / 2 ? -80 : width + 80, global.dy);
        }
      case CardKind.number ||
          CardKind.twist ||
          CardKind.blind ||
          CardKind.defuse ||
          CardKind.bomb:
        return null;
    }
  }

  bool _highlightSeat(SeatView seat, PlayerView view) =>
      switch (_dragging?.kind) {
        CardKind.detonate => seat.isAlive && view.bomb != null,
        CardKind.steal => seat.id == view.turn.playerId && !view.isMyTurn,
        _ => false,
      };

  // -------------------------------------------------------------- feedback

  void _onSnapshot(ClientSnapshot snap) {
    final view = snap.view;
    final me = view.myId;
    final l = context.l10n;
    String name(String id) => view.seat(id).name;
    for (final e in snap.events) {
      switch (e) {
        case InvalidThrow(:final playerId) when playerId == me:
          setState(() => _shakeToken++);
          HapticFeedback.heavyImpact();
          _showToast(l.toastInvalidCard(view.rules.drawPenalty));
        case TurnTimedOut(:final playerId) when playerId == me:
          HapticFeedback.heavyImpact();
          _showToast(l.toastTimeOut);
        case CommandRejected(:final command, :final reason)
            when commandOwner(command) == me:
          HapticFeedback.lightImpact();
          _showToast(rejectText(l, reason, view.rules));
        case LifeLossPending(:final loss)
            when loss.playerId == me &&
                view.cardsOf(CardKind.shield).isNotEmpty:
          _showToast(l.toastShieldWindow(seconds(view.rules.shieldWindowMs)));
        case TurnStolen(:final fromPlayerId, :final byPlayerId)
            when fromPlayerId == me:
          HapticFeedback.mediumImpact();
          _showToast(l.toastTurnStolen(name(byPlayerId)));
        case BombRedirected(:final playerId, :final targetPlayerId)
            when targetPlayerId == me:
          HapticFeedback.heavyImpact();
          _showToast(l.toastBombOnYou(name(playerId)));
        case TurnStarted(:final playerId, :final reason)
            when playerId == me && reason == TurnStartReason.nopeRevert:
          _showToast(l.toastNopeReturns);
        default:
          break;
      }
    }
  }

  void _onHost(HostUpdate update) {
    String name(String id) => update.state.player(id).name;
    for (final e in update.events.reversed) {
      final caption = captionFor(context.l10n, e, name);
      if (caption != null) {
        setState(() => _caption = caption);
        return;
      }
    }
  }

  // ----------------------------------------------------------------- build

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(sessionProvider);
    final host = ref.watch(hostProvider);
    final puppet = ref.watch(puppetProvider);
    final snapshot = ref.watch(viewProvider(puppet.viewAs));

    ref.listen(viewProvider(puppet.viewAs), (previous, next) {
      if (next != null && next.version != previous?.version) {
        _onSnapshot(next);
      }
    });
    ref.listen(hostProvider, (previous, next) {
      if (next != null) _onHost(next);
    });

    return Scaffold(
      endDrawer: const DebugPanel(),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.15),
            radius: 1.15,
            colors: [Palette.table, Palette.tableDeep],
          ),
        ),
        child: SafeArea(
          child: session == null || host == null || snapshot == null
              ? const Center(child: CircularProgressIndicator())
              : LayoutBuilder(
                  builder: (context, constraints) =>
                      _table(session, host, snapshot, constraints.biggest),
                ),
        ),
      ),
    );
  }

  Widget _table(
    PuppetSession session,
    HostUpdate host,
    ClientSnapshot snapshot,
    Size size,
  ) {
    final view = snapshot.view;
    final client = session.clients[view.myId]!;
    final width = size.width;
    final height = size.height;

    final handCardWidth = math.min(80.0, width / 4.6);
    _handTop = height - 14 - handCardWidth * cardAspect - 24;
    _deckSize = math.min(width * 0.6, height * 0.3);
    _deckCenter = Offset(
      width / 2,
      math.max(height * 0.4, 110 + _deckSize / 2 + 40),
    );
    _deckLineY = _deckCenter.dy + _deckSize / 2 + 8;

    // Other seats in play order, clockwise from my left over the top.
    final meIndex = view.seats.indexWhere((s) => s.id == view.myId);
    final others = [
      for (var k = 1; k < view.seats.length; k++)
        view.seats[(meIndex + k) % view.seats.length],
    ];
    final rx = width / 2 - 50;
    final ry = _deckCenter.dy - 118;
    Offset seatPos(int i) {
      final n = others.length;
      final deg = n == 1 ? 270.0 : 188 + i * (164 / (n - 1));
      final a = deg * math.pi / 180;
      return Offset(
        width / 2 + rx * math.cos(a),
        _deckCenter.dy + ry * math.sin(a),
      );
    }

    final dragKind = _dragging?.kind;
    final running = !host.paused && !view.isOver;
    int pending(String id) => view.pendingLosses
        .where((l) => l.playerId == id)
        .fold(0, (sum, l) => sum + l.amount);
    final onTurnName = view.seat(view.turn.playerId).name;

    return Stack(
      key: _layerKey,
      children: [
        if (dragKind == CardKind.nope || dragKind == CardKind.shield) ...[
          const Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: _SideGlow(left: true),
          ),
          const Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: _SideGlow(left: false),
          ),
        ],
        for (var i = 0; i < others.length; i++)
          Positioned(
            left: seatPos(i).dx - 48,
            top: seatPos(i).dy - 38,
            width: 96,
            child: Center(
              child: SeatAvatar(
                key: _seatKey(others[i].id),
                seat: others[i],
                mode: host.seats[others[i].id]?.mode ?? SeatMode.bot,
                maxLives: view.rules.startLives,
                onTurn: !view.isOver && view.turn.playerId == others[i].id,
                highlighted: _highlightSeat(others[i], view),
                pendingLoss: pending(others[i].id),
              ),
            ),
          ),
        Positioned(
          left: _deckCenter.dx - _deckSize / 2,
          top: _deckCenter.dy - _deckSize / 2,
          child: KeyedSubtree(
            key: _deckKey,
            child: DeckView(
              view: view,
              nowMs: client.nowMs,
              running: running,
              size: _deckSize,
              glow: _dragging != null && throwsOnCross(_dragging!.kind),
            ),
          ),
        ),
        if (_dragging != null && throwsOnCross(_dragging!.kind))
          Positioned(
            left: 24,
            right: 24,
            top: _deckLineY,
            child: const CustomPaint(
              size: Size(double.infinity, 2),
              painter: _DashPainter(),
            ),
          ),
        Positioned(
          left: 16,
          right: 16,
          top: _deckLineY + 8,
          child: Column(
            children: [
              Text(
                view.isOver
                    ? ''
                    : view.isMyTurn
                    ? context.l10n.yourTurn
                    : context.l10n.onTurn(onTurnName),
                style: TextStyle(
                  fontFamily: displayFont,
                  fontSize: 17,
                  color: view.isMyTurn ? Palette.sulfur : Palette.text,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                _caption ?? context.l10n.deckCount(view.deckCount),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, color: Palette.muted),
              ),
            ],
          ),
        ),
        Positioned(
          left: 14,
          right: 14,
          top: _handTop - 34,
          child: _MyRow(
            view: view,
            client: client,
            pendingLoss: pending(view.myId),
            mode: host.seats[view.myId]?.mode ?? SeatMode.human,
          ),
        ),
        Positioned.fill(
          child: HandView(
            cards: view.me.hand,
            version: snapshot.version,
            maxCardWidth: handCardWidth,
            resolveZone: (p) => _resolve(p, view),
            deckCenter: () => _globalRect(_deckKey)?.center ?? Offset.zero,
            deckLineY: () =>
                _layer?.localToGlobal(Offset(0, _deckLineY)).dy ?? 0,
            onThrow: client.throwCard,
            onRelease: (card, zone, global) =>
                _release(client, view, card, zone, global),
            onDragChanged: (card) => setState(() => _dragging = card),
            shakeToken: _shakeToken,
          ),
        ),
        const Positioned(top: 0, left: 0, right: 0, child: PuppetBar()),
        if (_toast != null)
          Positioned(
            top: 58,
            left: 24,
            right: 24,
            child: IgnorePointer(
              child: Center(child: _Toast(text: _toast!)),
            ),
          ),
        if (!_started && host.paused && !view.isOver)
          Positioned.fill(
            child: _StartOverlay(
              title: session.title ?? 'Kittens',
              description: session.description,
              onStart: () {
                setState(() => _started = true);
                session.host.resume();
              },
            ),
          ),
        if (view.isOver)
          Positioned.fill(
            child: _GameOverOverlay(
              winner: view.winnerId == null
                  ? null
                  : view.seat(view.winnerId!).name,
              iWon: view.winnerId == view.myId,
              session: session,
            ),
          ),
      ],
    );
  }
}

class _MyRow extends StatelessWidget {
  const _MyRow({
    required this.view,
    required this.client,
    required this.pendingLoss,
    required this.mode,
  });

  final PlayerView view;
  final ClientSession client;
  final int pendingLoss;
  final SeatMode mode;

  @override
  Widget build(BuildContext context) {
    final me = view.me;
    final action = view.lastAction;
    final ghostNope =
        me.isGhost &&
        me.ghostNopeRound != view.round &&
        action != null &&
        !action.noped &&
        action.isOpenAt(client.nowMs(), view.turn.seq, view.rules);
    return Row(
      children: [
        Text(
          me.isGhost ? context.l10n.ghostName(me.name) : me.name,
          style: TextStyle(
            fontFamily: displayFont,
            fontSize: 15,
            color: me.isGhost ? Palette.muted : Palette.text,
          ),
        ),
        const SizedBox(width: 8),
        LivesRow(lives: me.lives, max: view.rules.startLives),
        if (pendingLoss > 0) ...[
          const SizedBox(width: 6),
          Text(
            '−$pendingLoss',
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: Palette.matchRed,
            ),
          ),
        ],
        if (mode != SeatMode.human) ...[
          const SizedBox(width: 8),
          Icon(
            mode == SeatMode.bot ? Icons.smart_toy : Icons.pause,
            size: 16,
            color: Palette.muted,
          ),
        ],
        const Spacer(),
        if (me.isGhost)
          FilledButton.tonal(
            onPressed: ghostNope ? client.ghostNope : null,
            child: Text(context.l10n.ghostNope),
          ),
      ],
    );
  }
}

class _SideGlow extends StatelessWidget {
  const _SideGlow({required this.left});

  final bool left;

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Container(
      width: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: left ? Alignment.centerLeft : Alignment.centerRight,
          end: left ? Alignment.centerRight : Alignment.centerLeft,
          colors: [
            Palette.sulfur.withValues(alpha: 0.35),
            Palette.sulfur.withValues(alpha: 0),
          ],
        ),
      ),
    ),
  );
}

class _DashPainter extends CustomPainter {
  const _DashPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Palette.sulfur.withValues(alpha: 0.7)
      ..strokeWidth = 2;
    for (var x = 0.0; x < size.width; x += 14) {
      canvas.drawLine(Offset(x, 0), Offset(x + 7, 0), paint);
    }
  }

  @override
  bool shouldRepaint(_DashPainter oldDelegate) => false;
}

class _Toast extends StatelessWidget {
  const _Toast({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    decoration: BoxDecoration(
      color: Palette.stock,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 10)],
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Palette.ink,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ),
  );
}

class _StartOverlay extends StatelessWidget {
  const _StartOverlay({
    required this.title,
    required this.description,
    required this.onStart,
  });

  final String title;
  final String? description;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: Palette.tableDeep.withValues(alpha: 0.88),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: displayFont,
                fontSize: 30,
                color: Palette.sulfur,
              ),
            ),
            const SizedBox(height: 12),
            if (description != null && description!.isNotEmpty) ...[
              Text(
                description!,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
              const SizedBox(height: 12),
            ],
            Text(
              context.l10n.startHelp,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Palette.muted,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: onStart,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  context.l10n.start,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _GameOverOverlay extends ConsumerWidget {
  const _GameOverOverlay({
    required this.winner,
    required this.iWon,
    required this.session,
  });

  final String? winner;
  final bool iWon;
  final PuppetSession session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(sessionProvider.notifier);
    return ColoredBox(
      color: Palette.tableDeep.withValues(alpha: 0.9),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                iWon
                    ? context.l10n.youWin
                    : winner == null
                    ? context.l10n.nobodySurvived
                    : context.l10n.playerWins(winner!),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: displayFont,
                  fontSize: 34,
                  color: Palette.sulfur,
                ),
              ),
              const SizedBox(height: 28),
              if (notifier.canPlayAgain)
                FilledButton(
                  onPressed: notifier.playAgain,
                  child: Text(context.l10n.playAgain),
                ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: session.host.replay.encode()),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.l10n.replayCopied)),
                    );
                  }
                },
                child: Text(context.l10n.copyReplay),
              ),
              TextButton(
                onPressed: notifier.quit,
                child: Text(context.l10n.gameSettings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
