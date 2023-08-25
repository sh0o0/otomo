import 'package:logger/logger.dart';

AppConfig appConfig = AppConfig.fromEnv();

class Env {
  Env._();

  static const bool isRelease = bool.fromEnvironment('dart.vm.product');
  static const String otomoServerHost =
      String.fromEnvironment('OTOMO_SERVER_HOST');
  static const int otomoServerPort = int.fromEnvironment('OTOMO_SERVER_PORT');
  static const bool isSecureConnectionToOtomoServer =
      bool.fromEnvironment('IS_SECURE_CONNECTION_TO_OTOMO_SERVER');
}

class AppConfig {
  AppConfig.fromEnv()
      : isRelease = Env.isRelease,
        otomoServerHost = Env.otomoServerHost,
        otomoServerPort = Env.otomoServerPort,
        isSecureConnectionToOtomoServer = Env.isSecureConnectionToOtomoServer,
        logLevel = Env.isRelease ? Level.info : Level.all;

  final bool isRelease;
  final String otomoServerHost;
  final int otomoServerPort;
  final bool isSecureConnectionToOtomoServer;
  final Level logLevel;

  @override
  String toString() {
    return '''isRelease: $isRelease
otomoServerHost: $otomoServerHost
otomoServerPort: $otomoServerPort
logLevel: $logLevel
''';
  }
}
