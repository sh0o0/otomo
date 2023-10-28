import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_config.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/configs/l10n/app_localizations.dart';
import 'package:otomo/view_models/app.dart';
import 'package:otomo/view_models/color_theme.dart';
import 'package:otomo/view_models/router.dart';
import 'package:otomo/views/cases/inform/upgrade_modal.dart';
import 'package:otomo/views/utils/localizations.dart';
import 'package:upgrader/upgrader.dart';

typedef SnackBarBuilder = SnackBar Function(BuildContext context);

class App extends HookConsumerWidget {
  const App({super.key});

  static final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar({
    SnackBar? snackBar,
    SnackBarBuilder? snackBarBuilder,
  }) {
    assert(snackBar != null || snackBarBuilder != null);
    assert(snackBar == null || snackBarBuilder == null);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentState = _scaffoldKey.currentState;
      if (currentState == null) return;
      currentState
          .showSnackBar(snackBar ?? snackBarBuilder!(currentState.context));
    });
  }

  static final _upgrader = Upgrader(
    // appcastConfig: AppcastConfiguration(
    //   url:
    //       'https://raw.githubusercontent.com/larryaasen/upgrader/master/test/testappcast.xml',
    //   supportedOS: ['android', 'iOS'],
    // ),
    dialogStyle: Platform.isIOS
        ? UpgradeDialogStyle.cupertino
        : UpgradeDialogStyle.material,
    debugLogging: !appConfig.isRelease,
    debugDisplayOnce: true,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appVMProvider.notifier);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: _scaffoldKey,
      onGenerateTitle: (context) => context.l10n.title,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ref.watch(colorThemeProvider),
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        final languageCode = localeOf(context).languageCode;
        notifier.applyLanguageToControllers(languageCode);

        return Stack(
          children: [
            child!,
            UpgradeModal(
              upgrader: _upgrader,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        );
      },
    );
  }
}
