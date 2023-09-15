import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/controllers/boundary/id_token.dart';
import 'package:otomo/configs/app_config.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/firebase_options.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/app.dart';

void main() async {
  logger.info(appConfig.toString());
  await setup();
  runApp(const ProviderScope(child: App()));
}

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  configureInjection();

  if (appConfig.isLocal) {
    getIt<FirebaseFirestore>().useFirestoreEmulator(appConfig.otomoServerHost, 8080);
    await getIt<FirebaseAuth>().useAuthEmulator(appConfig.otomoServerHost, 9099);
  }

  // TODO: Should think about this place
  await getIt<IdTokenController>().refreshIdToken();
}
