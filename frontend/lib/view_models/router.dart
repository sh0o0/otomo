import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/account.dart';
import 'package:otomo/view_models/policies_agreement.dart';
import 'package:otomo/view_models/splash.dart';
import 'package:otomo/views/pages/account_deletion.dart';
import 'package:otomo/views/pages/home/index.dart';
import 'package:otomo/views/pages/loading.dart';
import 'package:otomo/views/pages/splash.dart';
import 'package:otomo/views/pages/start_to_use.dart';
import 'package:otomo/views/pages/settings.dart';
import 'package:otomo/views/pages/sign_in.dart';
import 'package:otomo/views/pages/sign_in_with_email_link.dart';
import 'package:otomo/views/routes.dart';

final _key = GlobalKey<NavigatorState>();

final List<RouteBase> _splashPages = [
  GoRoute(
    path: Routes.splash,
    builder: (context, state) => const SplashPage(),
  ),
];

final List<RouteBase> _notSignedInPages = [
  GoRoute(
    path: Routes.signIn,
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: Routes.signInWithEmailLink,
    builder: (context, state) => const SignInWithEmailLinkPage(),
  ),
];

final List<RouteBase> _notAgreedPages = [
  GoRoute(
    path: Routes.policiesAgreement,
    builder: (context, state) => const StartToUsePage(),
  ),
];

final List<RouteBase> _signedInPages = [
  GoRoute(
    path: Routes.home,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: Routes.settings,
    pageBuilder: (context, state) => const MaterialPage(
      fullscreenDialog: true,
      child: SettingsPage(),
    ),
  ),
  GoRoute(
    path: Routes.accountDeletion,
    builder: (context, state) => const AccountDeletionPage(),
  ),
];

final List<RouteBase> _loadingPages = [
  GoRoute(
    path: Routes.loading,
    builder: (context, state) => const LoadingPage(),
  ),
];

final routerProvider = Provider((ref) {
  final splashState = ref.watch(splashProvider);
  final accountState = ref.watch(accountVMProvider);
  final agreementsState = ref.watch(policiesAgreementProvider);

  if (!splashState.ready) {
    return GoRouter(
      navigatorKey: _key,
      initialLocation: Routes.splash,
      routes: _splashPages,
    );
  }

  if (accountState.isSignedIn) {
    return GoRouter(
      navigatorKey: _key,
      initialLocation: Routes.signIn,
      routes: _notSignedInPages,
    );
  }
  if (agreementsState.loading) {
    return GoRouter(
      navigatorKey: _key,
      initialLocation: Routes.loading,
      routes: _loadingPages,
    );
  }

  if (agreementsState.isAgreed) {
    return GoRouter(
      navigatorKey: _key,
      initialLocation: Routes.home,
      routes: [
        ..._notSignedInPages,
        ..._signedInPages,
      ],
    );
  }

  return GoRouter(
    navigatorKey: _key,
    initialLocation: Routes.policiesAgreement,
    routes: _notAgreedPages,
  );
});
