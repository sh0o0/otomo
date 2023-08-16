import 'package:go_router/go_router.dart';
import 'package:otomo/views/pages/sign_in/sign_in.dart';
import 'package:otomo/views/pages/sign_in_with_email_link/sign_in_with_email_link.dart';

abstract class Routes {
  static const signIn = '/sign_in';
  static const signInWithEmailLink = '/sign_in/email';
}

final router = GoRouter(
  initialLocation: Routes.signIn,
  routes: [
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
