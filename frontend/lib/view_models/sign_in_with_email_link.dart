import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_with_email_link.g.dart';

@riverpod
class SignInWithEmailLink extends _$SignInWithEmailLink {
  SignInWithEmailLink() : super();

  final _controller = getIt<AuthControllerImpl>();

  @override
  void build() {}

  Future<void> sendSignInEmailLink(String email) async {
    await _controller.sendSignInEmailLink(email);
  }

  Future<void> signInWithEmailLinkIfLinkCorrect(String link) async {
    if (!_controller.isSignInWithEmailLink(link)) return;
    await _controller.signInWithEmailLink(link);
  }
}
