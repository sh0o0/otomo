import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/entities/exception.dart';

part 'auth.freezed.dart';

final authProvider = AsyncNotifierProvider<AuthNotifier, AuthState>(
  () => AuthNotifier(getIt<AuthControllerImpl>()),
);

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool requiresRecentLogin,
  }) = _AuthState;
}

class AuthNotifier extends AsyncNotifier<AuthState> {
  AuthNotifier(this._authController);

  @override
  FutureOr<AuthState> build() => const AuthState(requiresRecentLogin: true);

  final AuthControllerImpl _authController;

  Future<void> signOut() async {
    state = await AsyncValue.guard(() async {
      await _authController.signOut();
      return state.value ?? const AuthState();
    });
  }

  Future<void> deleteAccount() async {
    state = await AsyncValue.guard(() async {
      try {
        await _authController.deleteAccount();
        return state.value?.copyWith(requiresRecentLogin: false) ??
            const AuthState();
      } on AppException catch (e) {
        if (e.cause == Cause.requiresRecentLogin) {
          return state.value?.copyWith(requiresRecentLogin: true) ??
              const AuthState(requiresRecentLogin: true);
        }
        rethrow;
      }
    });
  }
}
