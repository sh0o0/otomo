import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/tools/logger.dart';

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null) {
    // TODO: Rewrite by getIt
    final auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((user) {
      state = user;
      logger.info('auth state changed. user is ${user?.uid}');
    });
  }

  bool get isLoggedIn => state != null;
}
