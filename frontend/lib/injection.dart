import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/injection.config.dart';

final getIt = GetIt.instance;

@module
abstract class InjectableModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  GoogleSignIn get googleSignIn => GoogleSignIn(
        scopes: ['email'],
      );
}

@InjectableInit()
void configureInjection() => getIt.init();
