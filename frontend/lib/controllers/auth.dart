import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otomo/constants/links.dart';
import 'package:otomo/constants/firebase_exception_code.dart';
import 'package:otomo/domains/entities/account.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/tools/app_package_info.dart';
import 'package:otomo/tools/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _appleEmailScope = 'email';

class AuthControllerImpl {
  AuthControllerImpl(
    this._firebaseAuth,
    this._googleSignIn,
    this._sharedPreferences,
  );

  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final SharedPreferences _sharedPreferences;

  static const _emailOfSignInWithEmailLinkKey =
      'email_of_sign_in_with_email_link';

  Stream<Account?> authStateChanges() => _firebaseAuth
      .authStateChanges()
      .map((user) => user == null ? null : _userToAccount(user));

  Future<String?> getIdToken() async {
    try {
      return await _firebaseAuth.currentUser?.getIdToken();
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == FirebaseExceptionCode.noSuchProvider) {
        logger.warn('no such provider. signing out');
        await _firebaseAuth.signOut();
      }
      rethrow;
    }
  }

  Future<Account> signInWithGoogle() async {
    final credential = await _getGoogleAuthCredential();
    return _signInWithCredential(credential);
  }

  Future<Account> signInWithApple() async {
    if (Platform.isAndroid) {
      throw AppException.unknown('Apple sign in is not supported on Android');
    }

    final appleProvider = auth.AppleAuthProvider();
    appleProvider.addScope(_appleEmailScope);

    late final auth.UserCredential credential;
    if (kIsWeb) {
      credential = await _firebaseAuth.signInWithPopup(appleProvider);
    } else {
      credential = await _firebaseAuth.signInWithProvider(appleProvider);
    }
    return _userToAccount(credential.user);
  }

  Future<void> sendSignInEmailLink(String email) async {
    final settings = auth.ActionCodeSettings(
      url: Links.finishSignInWithEmailLink,
      handleCodeInApp: true,
      iOSBundleId: AppPackageInfo.packageName,
      androidPackageName: AppPackageInfo.packageName,
      androidInstallApp: true,
    );
    await _firebaseAuth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: settings,
    );
    await _sharedPreferences.setString(_emailOfSignInWithEmailLinkKey, email);
  }

  bool isSignInWithEmailLink(String link) =>
      _firebaseAuth.isSignInWithEmailLink(link);

  Future<Account> signInWithEmailLink(String link) async {
    if (!_firebaseAuth.isSignInWithEmailLink(link)) {
      throw AppException.unknown('incorrect email link');
    }

    final savedEmail =
        _sharedPreferences.getString(_emailOfSignInWithEmailLinkKey);
    if (savedEmail == null) throw AppException.unknown('email was not saved');

    final userCredential = await _firebaseAuth.signInWithEmailLink(
      email: savedEmail,
      emailLink: link,
    );

    await _sharedPreferences.remove(_emailOfSignInWithEmailLinkKey);

    return _userToAccount(userCredential.user);
  }

  Future<Account> _signInWithCredential(auth.AuthCredential credential) async {
    final userCred = await _firebaseAuth.signInWithCredential(credential);
    return _userToAccount(userCred.user);
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

  FutureOr<void> deleteAccount() async {
    try {
      await _firebaseAuth.currentUser?.delete();
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == FirebaseExceptionCode.requiresRecentLogin) {
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

  Future<Account> reauthenticate() async {
    final account = _userToAccount(_firebaseAuth.currentUser);
    switch (account.authProvider) {
      case AuthProvider.google:
        final credential = await _getGoogleAuthCredential();
        return _reauthenticateWithCredential(credential);
      case AuthProvider.apple:
        return _reauthenticateWithApple();
      default:
        throw AppException.unknown(
            'Unknown auth provider: ${account.authProvider}');
    }
  }

  Future<Account> _reauthenticateWithCredential(
    auth.AuthCredential credential,
  ) async {
    final userCred = await _firebaseAuth.currentUser
        ?.reauthenticateWithCredential(credential);
    return _userToAccount(userCred?.user);
  }

  Future<Account> _reauthenticateWithApple() async {
    final appleProvider = _getAppleOAuthProvider();

    late final auth.UserCredential? credential;
    if (kIsWeb) {
      credential = await _firebaseAuth.currentUser
          ?.reauthenticateWithPopup(appleProvider);
    } else {
      credential = await _firebaseAuth.currentUser
          ?.reauthenticateWithProvider(appleProvider);
    }
    return _userToAccount(credential?.user);
  }

  Account _userToAccount(auth.User? user) {
    if (user == null) throw AppException.unknown('User is null');
    return Account(
      uid: user.uid,
      email: user.email,
      authProvider: _getAuthProvider(user),
    );
  }

  AuthProvider _getAuthProvider(auth.User user) {
    if (user.providerData.isEmpty) {
      throw AppException.unknown('User has no provider data');
    }

    final provider = user.providerData.first.providerId;
    switch (provider) {
      case 'google.com':
        return AuthProvider.google;
      case 'apple.com':
        return AuthProvider.apple;
      default:
        throw AppException.unknown('Unknown provider: $provider');
    }
  }

  auth.AppleAuthProvider _getAppleOAuthProvider() =>
      auth.AppleAuthProvider().addScope(_appleEmailScope);
}
