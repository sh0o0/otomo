import 'package:otomo/tools/app_package_info.dart';

class GoogleAPIHeaders {
  const GoogleAPIHeaders({
    required this.androidPackageName,
    required this.androidCertFingerprintSha1,
    required this.iosBundleId,
  });

  static GoogleAPIHeaders fromEnvironment() => GoogleAPIHeaders(
        androidPackageName: AppPackageInfo.packageName,
        androidCertFingerprintSha1: AppPackageInfo.buildSignature,
        iosBundleId: AppPackageInfo.packageName,
      );

  final String androidPackageName;
  final String androidCertFingerprintSha1;
  final String iosBundleId;

  Map<String, String> toMap() {
    return {
      'X-Android-Package': androidPackageName,
      'X-Android-Cert': androidCertFingerprintSha1,
      'X-Ios-Bundle-Identifier': iosBundleId,
    };
  }
}
