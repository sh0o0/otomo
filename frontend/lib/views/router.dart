import 'package:go_router/go_router.dart';
import 'package:otomo/viewmodels/user.dart';
import 'package:otomo/views/pages/home/home.dart';
import 'package:otomo/views/pages/sign_in/sign_in.dart';
import 'package:otomo/views/pages/sign_in_with_email_link/sign_in_with_email_link.dart';

abstract class Routes {
  static const home = '/home';
  static const signIn = '/sign_in';
  static const signInWithEmailLink = '/sign_in/email';
}

final router = GoRouter(
  redirect: (context, state) {
    if (userNotifier.isLoggedIn) {
      return Routes.home;
    }
    return Routes.signIn;
  },
  refreshListenable: userNotifier,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: Routes.signInWithEmailLink,
      builder: (context, state) => const SignInWithEmailLinkPage(),
    ),
  ],
);
