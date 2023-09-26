import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otomo/entities/exception.dart';
import 'package:otomo/entities/user.dart';

class AuthControllerImpl {
  AuthControllerImpl(this._firebaseAuth, this._googleSignIn);

  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges().map(
        (authUser) => authUser == null
            ? null
            : User(id: authUser.uid, email: authUser.email),
      );

  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOut() => _firebaseAuth.signOut();

  FutureOr<void> deleteAccount() {
    try {
      return _firebaseAuth.currentUser?.delete();
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthExceptionCode.requiresRecentLogin) {
        throw AppException(
          message: 'Please re-authenticate',
          cause: Cause.requiresRecentLogin,
          domain: Domain.auth,
          field: Field.none,
        );
      }
      rethrow;
    }
  }

  Future<User> reauthenticate() async {
    final provider = auth.GoogleAuthProvider();
    final userCred =
        await _firebaseAuth.currentUser?.reauthenticateWithProvider(provider);
    final user = userCred?.user;
    if (user == null) throw Exception('User is null');

    return User(id: user.uid, email: user.email);
  }
}

abstract class FirebaseAuthExceptionCode {
  static const requiresRecentLogin = 'requires-recent-login';
  static const internalError = 'internal-error';
}
