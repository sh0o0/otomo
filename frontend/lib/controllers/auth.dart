import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otomo/entities/app_exception.dart';
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

  Future<String?> getIdToken() async =>
      await _firebaseAuth.currentUser?.getIdToken();

  Future<User> signInWithGoogle() async {
    final credential = await _getGoogleAuthCredential();
    return _signInWithCredential(credential);
  }

  Future<User> _signInWithCredential(auth.AuthCredential credential) async {
    final userCred = await _firebaseAuth.signInWithCredential(credential);
    final user = userCred.user;
    if (user == null) throw Exception('User is null');
    return User(id: user.uid, email: user.email);
  }

  Future<auth.OAuthCredential> _getGoogleAuthCredential() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    return auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  }

  Future<void> signOut() => _firebaseAuth.signOut();

  FutureOr<void> deleteAccount() {
    try {
      return _firebaseAuth.currentUser?.delete();
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthExceptionCode.requiresRecentLogin) {
        throw const AppException(
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
    final credential = await _getGoogleAuthCredential();
    return _reauthenticateWithCredential(credential);
  }

  Future<User> _reauthenticateWithCredential(
    auth.AuthCredential credential,
  ) async {
    final userCred = await _firebaseAuth.currentUser
        ?.reauthenticateWithCredential(credential);
    final user = userCred?.user;
    if (user == null) throw Exception('User is null');
    return User(id: user.uid, email: user.email);
  }
}

final class FirebaseAuthExceptionCode {
  FirebaseAuthExceptionCode._();

  static const requiresRecentLogin = 'requires-recent-login';
  static const internalError = 'internal-error';
  static const networkRequestFailed = 'network-request-failed';
}
