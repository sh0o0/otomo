import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/view_models/account.dart';
import 'package:otomo/view_models/policies_agreement.dart';
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

  bool removedNative = false;

  @override
  SplashState build() {
    setupRemoveNativeSplash();

    prepare();
    setLoadingTimer();

    return const SplashState();
  }

  void prepare() {
    final List<Future> waitList = [];

    waitList.add(Future.delayed(splashDuration));
    if (!ref.read(policiesAgreementProvider).initialized) {
      waitList.add(_waitPoliciesAgreementsPreparing());
    }
    if (!ref.read(accountVMProvider).initialized) {
      waitList.add(_waitAccountPreparing());
    }

    Future.wait(waitList).then((value) {
      state = const SplashState(ready: true);
    }).timeout(timeout);
  }

  void setupRemoveNativeSplash() {
    ref.listenSelf((previous, next) {
      if (removedNative) return;
      if (next.loading || next.ready) {
        removedNative = true;
        FlutterNativeSplash.remove();
      }
    });
  }

  void setLoadingTimer() {
    Future.delayed(loadingTimer).then((_) {
      if (!state.ready) state = state.copyWith(loading: true);
    });
  }

  Future _waitPoliciesAgreementsPreparing() {
    final completer = Completer();
    final sub = ref
        .listen(policiesAgreementProvider.select((value) => value.initialized),
            (previous, next) {
      if (next == true) completer.complete();
    });
    ref.onDispose(() {
      sub.close();
    });
    return completer.future;
  }

  Future _waitAccountPreparing() {
    final completer = Completer();
    final sub = ref
        .listen(accountVMProvider.select((value) => value.initialized),
            (previous, next) {
      if (next) completer.complete();
    });
    ref.onDispose(() {
      sub.close();
    });
    return completer.future;
  }
}
