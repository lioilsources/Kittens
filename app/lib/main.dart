import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'autostart.dart';
import 'l10n/l10n.dart';
import 'state/providers.dart';
import 'ui/setup/setup_screen.dart';
import 'ui/table/table_screen.dart';
import 'ui/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: FuseApp()));
}

class FuseApp extends ConsumerStatefulWidget {
  const FuseApp({super.key});

  @override
  ConsumerState<FuseApp> createState() => _FuseAppState();
}

class _FuseAppState extends ConsumerState<FuseApp> {
  @override
  void initState() {
    super.initState();
    if (autostartValue.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => autostart(ref.read(sessionProvider.notifier), autostartValue),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final inGame = ref.watch(sessionProvider.select((s) => s != null));
    return MaterialApp(
      title: 'Kittens',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        // Number formatting in seconds()/factor() follows the UI locale.
        Intl.defaultLocale = Localizations.localeOf(context).toLanguageTag();
        return child!;
      },
      theme: buildTheme(),
      home: inGame ? const TableScreen() : const SetupScreen(),
    );
  }
}
