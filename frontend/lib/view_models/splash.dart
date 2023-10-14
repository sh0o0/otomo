import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/view_models/account.dart';
import 'package:otomo/view_models/agreed_policies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash.freezed.dart';
part 'splash.g.dart';

@freezed
class SplashState with _$SplashState {
  const SplashState._();
  const factory SplashState({
    @Default(false) bool ready,
  }) = _SplashState;
}

@riverpod
class Splash extends _$Splash {
  static const timeout = Duration(seconds: 10);

  @override
  SplashState build() {
    return const SplashState();
  }

  void prepare() {
    final List<Future> waitList = [];

    waitList.add(Future.delayed(const Duration(seconds: 1)));

    if (ref.read(policiesAgreementProvider).value?.initialized != true) {
      final completer = Completer();
      ref.listen(
          policiesAgreementProvider.select((value) => value.value?.initialized),
          (previous, next) {
        if (next == true) completer.complete();
      });
      waitList.add(completer.future);
    }

    if (!ref.read(accountVMProvider).initialized) {
      final completer = Completer();
      ref.listen(accountVMProvider.select((value) => value.initialized),
          (previous, next) {
        if (next) completer.complete();
      });
      waitList.add(completer.future);
    }

    Future.wait(waitList).then((_) {
      state = const SplashState(ready: true);
    }).timeout(timeout);
  }
}
