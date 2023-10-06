import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

AppConfig appConfig = AppConfig.fromEnv();

class Env {
  Env._();

  static const String flavorStr = String.fromEnvironment('FLAVOR');
  static const bool isRelease = kReleaseMode;
  static const bool isLocal =
      bool.fromEnvironment('IS_LOCAL', defaultValue: false);
  static const bool isPlayground =
      bool.fromEnvironment('IS_PLAYGROUND', defaultValue: false);
  static const String otomoServerHost =
      String.fromEnvironment('OTOMO_SERVER_HOST');
  static const int otomoServerPort = int.fromEnvironment('OTOMO_SERVER_PORT');
  static const bool isSecureConnectionToOtomoServer =
      bool.fromEnvironment('IS_SECURE_CONNECTION_TO_OTOMO_SERVER');
  static const String iosGoogleMapApiKey =
      String.fromEnvironment('IOS_GOOGLE_MAP_API_KEY');
  static const String androidGoogleMapApiKey =
      String.fromEnvironment('ANDROID_GOOGLE_MAP_API_KEY');
}

class AppConfig {
  AppConfig.fromEnv()
      : isRelease = Env.isRelease,
        isLocal = Env.isLocal,
        isPlayground = Env.isPlayground,
        flavor = Flavor.values.byName(Env.flavorStr),
        otomoServerHost = Env.otomoServerHost,
        otomoServerPort = Env.otomoServerPort,
        googleMapApiKey = Platform.isIOS
            ? Env.iosGoogleMapApiKey
            : Env.androidGoogleMapApiKey,
        isSecureConnectionToOtomoServer = Env.isSecureConnectionToOtomoServer,
        logLevel = Env.isRelease ? Level.info : Level.all;

  final bool isRelease;
  final bool isLocal;
  final bool isPlayground;
  final Flavor flavor;
  final String otomoServerHost;
  final int otomoServerPort;
  final String googleMapApiKey;
  final bool isSecureConnectionToOtomoServer;
  final Level logLevel;

  @override
  String toString() {
    return '''isRelease: $isRelease
isLocal: $isLocal
flavor: $flavor
otomoServerHost: $otomoServerHost
otomoServerPort: $otomoServerPort
logLevel: $logLevel
''';
  }
}

enum Flavor {
  local,
  dev,
}
