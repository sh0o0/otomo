import 'package:logger/logger.dart';

AppConfig appConfig = AppConfig.fromEnv();

class _Env {
  _Env._();

  static const bool isRelease = bool.fromEnvironment('dart.vm.product');
  static const String otomoServerHost =
      String.fromEnvironment('OTOMO_SERVER_HOST');
  static const int otomoServerPort = int.fromEnvironment('OTOMO_SERVER_PORT');
  static const bool isSecureConnectionToOtomoServer =
      bool.fromEnvironment('IS_SECURE_CONNECTION_TO_OTOMO_SERVER');
  static const String mapboxPublicToken =
      String.fromEnvironment('MAPBOX_PUBLIC_TOKEN');
}

class AppConfig {
  AppConfig.fromEnv()
      : isRelease = _Env.isRelease,
        otomoServerHost = _Env.otomoServerHost,
        otomoServerPort = _Env.otomoServerPort,
        isSecureConnectionToOtomoServer = _Env.isSecureConnectionToOtomoServer,
        mapboxPublicToken = _Env.mapboxPublicToken,
        logLevel = _Env.isRelease ? Level.info : Level.all;

  final bool isRelease;
  final String otomoServerHost;
  final int otomoServerPort;
  final bool isSecureConnectionToOtomoServer;
  final String mapboxPublicToken;
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
