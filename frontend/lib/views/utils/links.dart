import 'dart:io';

import 'package:otomo/entities/app_exception.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:url_launcher/url_launcher_string.dart';

final class Launcher {
  Launcher._();

  static Future<bool> urlString(String urlString) async {
    if (await canLaunchUrlString(urlString)) {
      return await launchUrlString(urlString);
    } else {
      throw AppException.unknown('Could not launch url: $urlString');
    }
  }

  static Future<bool> anyFormatTel(String number) {
    final phoneNumber = PhoneNumber.parse(number);
    return tel(phoneNumber.international);
  }

  static Future<bool> tel(String number) async {
    final telString = 'tel:$number';
    return urlString(telString);
  }

  static Future<bool> inquiry(String userId, String email) {
    late final String device;
    if (Platform.isAndroid) {
      device = 'Android';
    } else if (Platform.isIOS) {
      device = 'iPhone';
    } else {
      device = 'Unknown';
    }
    final url =
        'https://docs.google.com/forms/d/e/1FAIpQLSdqVWf8jm3FGSts_dPj3vEhQJyUw8G_KxaylbLrgTy7gsjteQ/viewform?usp=pp_url&entry.908889089=$userId&entry.1155027200=$email&entry.633383865=$device';
    return urlString(url);
  }

  static Future<bool> searchOnGoogleMap({
    String query = '',
    String placeId = '',
  }) async {
    assert(query.isNotEmpty || placeId.isNotEmpty);

    final encodedQuery = Uri.encodeComponent(query);

    final url =
        'https://www.google.com/maps/search/?api=1&query=$encodedQuery&query_place_id=$placeId';
    return urlString(url);
  }
}
