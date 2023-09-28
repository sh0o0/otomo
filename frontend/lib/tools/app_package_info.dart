import 'package:package_info_plus/package_info_plus.dart';

final class AppPackageInfo {
  AppPackageInfo._();

  static late final PackageInfo _packageInfo;

  static Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String get version => _packageInfo.version;
  static String get buildNumber => _packageInfo.buildNumber;
  static String get buildSignature => _packageInfo.buildSignature;
  static String get packageName => _packageInfo.packageName;
}
