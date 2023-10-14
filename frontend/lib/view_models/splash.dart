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
    @Default(false) bool loading,
  }) = _SplashState;
}

@Riverpod(keepAlive: true)
class Splash extends _$Splash {
  static const splashDuration = Duration(milliseconds: 800);
  static const timeout = Duration(seconds: 10);
  static const loadingTimer = Duration(seconds: 3);

  @override
  SplashState build() {
    prepare();
    setLoadingTimer();
    return const SplashState();
  }

  void prepare() {
    final List<Future> waitList = [];

    waitList.add(Future.delayed(splashDuration));
    if (ref.read(policiesAgreementProvider).value?.initialized != true) {
      waitList.add(_waitPoliciesAgreementsPreparing());
    }
    if (!ref.read(accountVMProvider).initialized) {
      waitList.add(_waitAccountPreparing());
    }

    Future.wait(waitList).then((value) {
      state = const SplashState(ready: true);
    }).timeout(timeout);
  }

  Future _waitPoliciesAgreementsPreparing() {
    final completer = Completer();
    ref.listen(
        policiesAgreementProvider.select((value) => value.value?.initialized),
        (previous, next) {
      if (next == true) completer.complete();
    });
    return completer.future;
  }

  void setLoadingTimer() {
    Future.delayed(loadingTimer).then((_) {
      if (!state.ready) state = state.copyWith(loading: true);
    });
  }

  Future _waitAccountPreparing() {
    final completer = Completer();
    ref.listen(accountVMProvider.select((value) => value.initialized),
        (previous, next) {
      if (next) completer.complete();
    });
    return completer.future;
  }
}
