import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/constants/screen_names.dart';
import 'package:otomo/tools/analytics.dart';
import 'package:otomo/view_models/account.dart';
import 'package:otomo/view_models/policies_agreement.dart';
import 'package:otomo/view_models/splash.dart';
import 'package:otomo/views/pages/account_deletion.dart';
import 'package:otomo/views/pages/home/index.dart';
import 'package:otomo/views/pages/loading.dart';
import 'package:otomo/views/pages/otomo_profile.dart';
import 'package:otomo/views/pages/settings.dart';
import 'package:otomo/views/pages/sign_in.dart';
import 'package:otomo/views/pages/sign_in_with_email_link.dart';
import 'package:otomo/views/pages/splash.dart';
import 'package:otomo/views/pages/start_to_use.dart';
import 'package:otomo/views/routes.dart';

final _key = GlobalKey<NavigatorState>();

final List<RouteBase> _splashPages = [
  GoRoute(
    path: Routes.splash,
    name: ScreenNames.splash.name,
    builder: (context, state) => const SplashPage(),
  ),
];

final List<RouteBase> _notSignedInPages = [
  GoRoute(
    path: Routes.signIn,
    name: ScreenNames.signIn.name,
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: Routes.signInWithEmailLink,
    name: ScreenNames.signInWithEmailLink.name,
    builder: (context, state) => const SignInWithEmailLinkPage(),
  ),
];

final List<RouteBase> _notAgreedPages = [
  GoRoute(
    path: Routes.startToUse,
    name: ScreenNames.startToUse.name,
    builder: (context, state) => const StartToUsePage(),
  ),
];

final List<RouteBase> _signedInPages = [
  GoRoute(
    path: Routes.home,
    name: ScreenNames.home.name,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: Routes.otomo,
    name: ScreenNames.otomoProfile.name,
    pageBuilder: (context, state) => const MaterialPage(
      fullscreenDialog: true,
      child: OtomoProfilePage(),
    ),
  ),
  GoRoute(
    path: Routes.settings,
    name: ScreenNames.settings.name,
    pageBuilder: (context, state) => const MaterialPage(
      fullscreenDialog: true,
      child: SettingsPage(),
    ),
  ),
  GoRoute(
    path: Routes.accountDeletion,
    name: ScreenNames.accountDeletion.name,
    builder: (context, state) => const AccountDeletionPage(),
  ),
];

final List<RouteBase> _loadingPages = [
  GoRoute(
    path: Routes.loading,
    name: ScreenNames.loading.name,
    builder: (context, state) => const LoadingPage(),
  ),
];

GoRouter _goRouter({
  required List<RouteBase> routes,
  required String initialLocation,
}) =>
    GoRouter(
      navigatorKey: _key,
      observers: [Analytics.observer],
      initialLocation: initialLocation,
      routes: routes,
    );

final routerProvider = Provider((ref) {
  final splashState = ref.watch(splashProvider);
  final accountState = ref.watch(accountVMProvider);
  final agreementsState = ref.watch(policiesAgreementProvider);

  if (!splashState.ready) {
    return _goRouter(
      initialLocation: Routes.splash,
      routes: _splashPages,
    );
  }

  if (!accountState.isSignedIn) {
    return _goRouter(
      initialLocation: Routes.signIn,
      routes: _notSignedInPages,
    );
  }
  if (agreementsState.loading) {
    return _goRouter(
      initialLocation: Routes.loading,
      routes: _loadingPages,
    );
  }

  if (agreementsState.isAgreed) {
    return _goRouter(
      initialLocation: Routes.home,
      routes: _signedInPages,
    );
  }

  return _goRouter(
    initialLocation: Routes.startToUse,
    routes: _notAgreedPages,
  );
});
