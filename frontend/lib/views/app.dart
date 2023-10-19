import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/configs/l10n/app_localizations.dart';
import 'package:otomo/view_models/app.dart';
import 'package:otomo/view_models/color_theme.dart';
import 'package:otomo/view_models/router.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  static final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(SnackBar snackBar) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scaffoldKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appVMProvider.notifier);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: _scaffoldKey,
      title: 'Otomo',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ref.watch(colorThemeProvider),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
