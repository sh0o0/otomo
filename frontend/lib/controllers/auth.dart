import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:otomo/entities/exception.dart';
import 'package:otomo/entities/user.dart';

class AuthControllerImpl {
  AuthControllerImpl(this._firebaseAuth);

  final auth.FirebaseAuth _firebaseAuth;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges().map(
        (authUser) => authUser == null
            ? null
            : User(id: authUser.uid, email: authUser.email ?? ''),
      );

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
}

abstract class FirebaseAuthExceptionCode {
  static const requiresRecentLogin = 'requires-recent-login';
  static const internalError = 'internal-error';
}
