import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/account.dart';
import 'package:otomo/views/pages/account_deletion.dart';
import 'package:otomo/views/pages/home/index.dart';
import 'package:otomo/views/pages/policies_agreement.dart';
import 'package:otomo/views/pages/settings.dart';
import 'package:otomo/views/pages/sign_in.dart';
import 'package:otomo/views/pages/sign_in_with_email_link.dart';
import 'package:otomo/views/routes.dart';

final _key = GlobalKey<NavigatorState>();

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
    builder: (context, state) => const PoliciesAgreementPage(),
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

final routerProvider = Provider((ref) {
  final account = ref.watch(accountProvider);
  if (account == null) {
    return GoRouter(
      navigatorKey: _key,
      initialLocation: Routes.signIn,
      routes: _notSignedInPages,
    );
  }

  // FIXME: This is a temporary solution to avoid the error:
  return GoRouter(
    navigatorKey: _key,
    initialLocation: Routes.policiesAgreement,
    routes: _notAgreedPages,
  );

  return GoRouter(
    navigatorKey: _key,
    initialLocation: Routes.home,
    routes: [
      ..._notSignedInPages,
      ..._signedInPages,
    ],
  );
});
