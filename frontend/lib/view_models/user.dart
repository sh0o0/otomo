import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/tools/logger.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>(
  (ref) => AuthNotifier(
    getIt<FirebaseAuth>(),
    getIt<GlobalState>(),
  ),
);

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier(this._firebaseAuth, this._globalState) : super(null) {
    _firebaseAuth.authStateChanges().listen((user) {
      state = user;
      _globalState.userId = user?.uid;
      logger.info('auth state changed. user is ${user?.uid}');
    });
  }

  final FirebaseAuth _firebaseAuth;
  final GlobalState _globalState;

  bool get isLoggedIn => state != null;
}
