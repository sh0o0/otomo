import 'package:go_router/go_router.dart';
import 'package:otomo/views/pages/sign_in/sign_in.dart';

final router = GoRouter(
  initialLocation: '/sign_in',
  routes: [
    GoRoute(
      path: '/sign_in',
      builder: (context, state) => SignInPage(),
    ),
  ],
);
