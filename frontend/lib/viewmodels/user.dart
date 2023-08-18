import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otomo/tools/logger.dart';

final userNotifier = UserNotifier();

class UserNotifier extends ValueNotifier<User?> {
  UserNotifier() : super(null) {
    // TODO: Rewrite by getIt
    final auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((user) {
      value = user;
      logger.info('auth state changed. user is ${user?.uid}');
    });
  }

  bool get isLoggedIn => value != null;
}
