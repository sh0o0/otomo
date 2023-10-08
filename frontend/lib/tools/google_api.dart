import 'package:otomo/configs/app_config.dart';
import 'package:otomo/tools/app_package_info.dart';

class GoogleAPIHeaders {
  const GoogleAPIHeaders({
    this.androidPackageName,
    this.androidCertFingerprintSha1,
    this.iosBundleId,
  });

  static GoogleAPIHeaders fromEnvironment() => GoogleAPIHeaders(
        androidPackageName: AppPackageInfo.packageName,
        androidCertFingerprintSha1: appConfig.androidCertFingerprintSha1,
        iosBundleId: AppPackageInfo.packageName,
      );

  final String? androidPackageName;
  final String? androidCertFingerprintSha1;
  final String? iosBundleId;

  Map<String, String> toMap() {
    return {
      'x-android_package_name': androidPackageName ?? '',
      'x-android_cert_fingerprint': androidCertFingerprintSha1 ?? '',
      'x-ios-bundle-identifier': iosBundleId ?? '',
    };
  }
}
