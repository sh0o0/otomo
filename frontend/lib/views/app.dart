import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/view_models/color_theme.dart';
import 'package:otomo/view_models/router.dart';
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
  void _handleDynamicLink(PendingDynamicLinkData data) {
    logger
        .info('handel dynamic link. do nothing. Link: ${data.link.toString()}');
  }

  // TODO: Move this logic to other place.
  Future<void> _initDynamicLinks() async {
    final dynamicLinks = getIt<FirebaseDynamicLinks>();
    final initialLink = await dynamicLinks.getInitialLink();
    if (initialLink == null) {
      logger.info('initial dynamic link is null');
    } else {
      logger.info('got initial dynamic link');
      _handleDynamicLink(initialLink);
    }

    dynamicLinks.onLink.listen((data) {
      logger.info('dynamic link received');
      _handleDynamicLink(data);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      afterBuildCallback(_initDynamicLinks);
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
    );
  }
}
