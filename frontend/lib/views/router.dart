import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/user.dart';
import 'package:otomo/views/pages/home/new_home.dart';
import 'package:otomo/views/pages/sign_in/sign_in.dart';
import 'package:otomo/views/pages/sign_in_with_email_link/sign_in_with_email_link.dart';

abstract class Routes {
  static const home = '/home';
  static const signIn = '/sign_in';
  static const signInWithEmailLink = '/sign_in/email';
}

final _key = GlobalKey<NavigatorState>();

final List<GoRoute> _signInPages = [
  GoRoute(
    path: Routes.signIn,
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: Routes.signInWithEmailLink,
    builder: (context, state) => const SignInWithEmailLinkPage(),
  ),
];

final routerProvider = Provider((ref) {
  final user = ref.watch(userProvider);
  if (user == null) {
    return GoRouter(
      navigatorKey: _key,
      initialLocation: Routes.signIn,
      routes: _signInPages,
    );
  }

  return GoRouter(
    navigatorKey: _key,
    initialLocation: Routes.home,
    routes: [
      ..._signInPages,
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const NewHome(),
      ),
    ],
  );
});
