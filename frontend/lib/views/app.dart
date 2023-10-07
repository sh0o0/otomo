import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/constants/locales.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/view_models/color_theme.dart';
import 'package:otomo/view_models/router.dart';
import 'package:otomo/view_models/sign_in_with_email_link.dart';
import 'package:otomo/views/utils/flutter.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  static final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(SnackBar snackBar) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scaffoldKey.currentState?.showSnackBar(snackBar);
    });
  }

  // TODO: Move this logic to other place.
  void _handleDynamicLink(PendingDynamicLinkData data, WidgetRef ref) {
    logger
        .info('handel dynamic link. do nothing. Link: ${data.link.toString()}');

    // Email link sign-in flow.
    ref
        .read(signInWithEmailLinkProvider.notifier)
        .signInWithEmailLinkIfLinkCorrect(data.link.toString());
  }

  // TODO: Move this logic to other place.
  Future<void> _initDynamicLinks(WidgetRef ref) async {
    final dynamicLinks = getIt<FirebaseDynamicLinks>();
    final initialLink = await dynamicLinks.getInitialLink();
    if (initialLink == null) {
      logger.info('initial dynamic link is null');
    } else {
      logger.info('got initial dynamic link');
      _handleDynamicLink(initialLink, ref);
    }

    dynamicLinks.onLink.listen((data) {
      logger.info('dynamic link received');
      _handleDynamicLink(data, ref);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      FlutterUtils.afterBuildCallback(() => _initDynamicLinks(ref));
      return () {};
    }, const []);

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locales.ja
      ],
    );
  }
}
