import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/entities/user.dart';
import 'package:otomo/tools/logger.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>(
  (ref) => AuthNotifier(getIt<AuthControllerImpl>()),
);

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier(this._authController) : super(null) {
    _authController.authStateChanges().listen((user) {
      state = user;
      logger.info('auth state changed. user is ${user?.id}');
    });
  }

  final AuthControllerImpl _authController;

  bool get isLoggedIn => state != null;
}
