import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/injection.dart';

final signInProvider = StateNotifierProvider((ref) {
  return SignInInNotifier();
});

class SignInInNotifier extends StateNotifier<void> {
  SignInInNotifier() : super(null);

  final _googleSignIn = getIt<GoogleSignIn>();

  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await getIt<FirebaseAuth>().signInWithCredential(credential);
  }
}
