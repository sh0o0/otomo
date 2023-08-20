import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/controllers/sign_in.dart';
import 'package:otomo/injection.dart';

final signInProvider = StateNotifierProvider((ref) {
  return SignInInNotifier(getIt<SignInController>());
});

class SignInInNotifier extends StateNotifier<void> {
  SignInInNotifier(this._controller) : super(null);

  final SignInController _controller;

  Future<void> signInWithGoogle() => _controller.signInWithGoogle();
}
