import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signInProvider = StateNotifierProvider((ref) {
  return SignInInNotifier();
});

class SignInInNotifier extends StateNotifier<void> {
  SignInInNotifier() : super(null);

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: ['email'],
    ).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final user = await FirebaseAuth.instance.signInWithCredential(credential);
    print(user);
  }
}
