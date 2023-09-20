import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/entities/user.dart';
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/tools/logger.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>(
  (ref) => AuthNotifier(
    getIt<AuthControllerImpl>(),
    getIt<GlobalState>(),
  ),
);

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier(this._authController, this._globalState) : super(null) {
    _authController.authStateChanges().listen((user) {
      state = user;
      _globalState.userId = user?.id;
      logger.info('auth state changed. user is ${user?.id}');
    });
  }

  final AuthControllerImpl _authController;
  final GlobalState _globalState;

  bool get isLoggedIn => state != null;
}
