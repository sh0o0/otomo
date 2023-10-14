import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/domains/entities/account.dart';
import 'package:otomo/tools/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class AccountState with _$AccountState {
  const AccountState._();
  const factory AccountState({
    @Default(null) Account? account,
    @Default(true) bool initialized,
  }) = _AccountState;
}

@Riverpod(keepAlive: true)
class AccountVM extends _$AccountVM {
  final _authController = getIt<AuthControllerImpl>();

  @override
  AccountState build() {
    _authController.authStateChanges().listen((account) {
      state = AccountState(account: account);
      logger.info('auth state changed. user is ${account?.uid}');
      if (account == null) return;
      getIt<FirebaseCrashlytics>().setUserIdentifier(account.uid);
    });

    return const AccountState(initialized: false);
  }

  Future<void> signOut() => _authController.signOut();
}
