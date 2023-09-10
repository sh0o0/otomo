import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/abstracts/controllers/id_token.dart';
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

  // TODO: Should think about this place
  await getIt<IdTokenController>().refreshIdToken();
}
