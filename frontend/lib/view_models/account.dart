import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/entities/account.dart';
import 'package:otomo/tools/logger.dart';

final accountProvider = StateNotifierProvider<AccountNotifier, Account?>(
  (ref) => AccountNotifier(getIt<AuthControllerImpl>()),
);

class AccountNotifier extends StateNotifier<Account?> {
  AccountNotifier(this._authController) : super(null) {
    _authController.authStateChanges().listen((account) {
      state = account;
      logger.info('auth state changed. user is ${account?.uid}');
      if (account == null) return;
      getIt<FirebaseCrashlytics>().setUserIdentifier(account.uid);
    });
  }

  final AuthControllerImpl _authController;

  Future<void> signOut() => _authController.signOut();
}
