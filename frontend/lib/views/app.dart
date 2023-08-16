import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/viewmodels/settings/color.dart';
import 'package:otomo/views/router.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Otomo',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ref.watch(colorThemeProvider).mode,
      routerConfig: router,
    );
  }
}
