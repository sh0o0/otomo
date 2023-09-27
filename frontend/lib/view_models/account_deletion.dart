import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/entities/app_exception.dart';

part 'account_deletion.freezed.dart';

final accountDeletionProvider =
    AsyncNotifierProvider<AccountDeletionNotifier, AccountDeletionState>(
  () => AccountDeletionNotifier(getIt<AuthControllerImpl>()),
);

@freezed
class AccountDeletionState with _$AccountDeletionState {
  const factory AccountDeletionState({
    @Default(false) bool requiresRecentLogin,
  }) = _AccountDeletionState;
}

class AccountDeletionNotifier extends AsyncNotifier<AccountDeletionState> {
  AccountDeletionNotifier(this._authController);

  @override
  FutureOr<AccountDeletionState> build() => const AccountDeletionState();

  final AuthControllerImpl _authController;

  Future<void> deleteAccount() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _authController.deleteAccount();
        return state.value?.copyWith(requiresRecentLogin: false) ??
            const AccountDeletionState();
      } on AppException catch (e) {
        if (e.cause == Cause.requiresRecentLogin) {
          return state.value?.copyWith(requiresRecentLogin: true) ??
              const AccountDeletionState(requiresRecentLogin: true);
        }
        rethrow;
      }
    });
  }

  Future<void> reauthenticate() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authController.reauthenticate();
      return state.value?.copyWith(requiresRecentLogin: false) ??
          const AccountDeletionState();
    });
  }
}
