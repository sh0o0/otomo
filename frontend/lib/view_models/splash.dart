import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash.freezed.dart';
part 'splash.g.dart';


@freezed
class SplashState with _$SplashState {
  const SplashState._();
  const factory SplashState() = _SplashState;
}

@riverpod
class Splash extends _$Splash {
  @override
  FutureOr<SplashState> build() {
    return const SplashState();
  }
}
