import 'dart:io';

final class Links {
  const Links._();

  static const String serviceSide = 'https://azure992416.studio.site/';

  static String inquiry(String userId, String email) {
    late final String device;
    if (Platform.isAndroid) {
      device = 'Android';
    } else if (Platform.isIOS) {
      device = 'iPhone';
    } else {
      device = 'Unknown';
    }
    return 'https://docs.google.com/forms/d/e/1FAIpQLSdqVWf8jm3FGSts_dPj3vEhQJyUw8G_KxaylbLrgTy7gsjteQ/viewform?usp=pp_url&entry.908889089=$userId&entry.1155027200=$email&entry.633383865=$device';
  }
}
