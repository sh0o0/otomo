import 'dart:io';

import 'package:flutter/material.dart';
import 'package:otomo/constants/locales.dart';
import 'package:otomo/domains/entities/app_exception.dart';
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
    final normalizedNumber = phoneNumberNormalize(number);
    return tel(normalizedNumber);
  }

  static Future<bool> tel(String number) async {
    final telString = 'tel:$number';
    return urlString(telString);
  }

  static Future<bool> inquiry({
    required Locale locale,
    required String userId,
    required String email,
  }) {
    late final String device;
    if (Platform.isAndroid) {
      device = 'Android';
    } else if (Platform.isIOS) {
      device = 'iPhone';
    } else {
      device = 'Unknown';
    }

    late final String url;
    if (locale.languageCode == Locales.ja.languageCode) {
        url = _jaInquiry(userId: userId, email: email, device: device);
    } else {
        url = _enInquiry(userId: userId, email: email, device: device);
    }

    return urlString(url);
  }

  static String _jaInquiry({
    required String userId,
    required String email,
    required String device,
  }) =>
      'https://docs.google.com/forms/d/e/1FAIpQLSdqVWf8jm3FGSts_dPj3vEhQJyUw8G_KxaylbLrgTy7gsjteQ/viewform?usp=pp_url&entry.908889089=$userId&entry.1155027200=$email&entry.633383865=$device';

  static String _enInquiry({
    required String userId,
    required String email,
    required String device,
  }) =>
      'https://docs.google.com/forms/d/e/1FAIpQLSefpOiUphLbIbHDnED_M00SjLdvZBf49ky2GrdT3XiVH3dktQ/viewform?usp=pp_url&entry.908889089=$userId&entry.1155027200=$email&entry.633383865=$device';

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

String phoneNumberNormalize(String unformatedPhoneNumber) {
  return unformatedPhoneNumber
      .split('')
      .map((char) => allNormalizationMappings[char] ?? '')
      .join('');
}

const Map<String, String> allNormalizationMappings = {
  '+': '+',
  '＋': '+',
  '0': '0',
  '1': '1',
  '2': '2',
  '3': '3',
  '4': '4',
  '5': '5',
  '6': '6',
  '7': '7',
  '8': '8',
  '9': '9',
  '٠': '0',
  '١': '1',
  '٢': '2',
  '٣': '3',
  '٤': '4',
  '٥': '5',
  '٦': '6',
  '٧': '7',
  '٨': '8',
  '٩': '9',
  '۰': '0',
  '۱': '1',
  '۲': '2',
  '۳': '3',
  '۴': '4',
  '۵': '5',
  '۶': '6',
  '۷': '7',
  '۸': '8',
  '۹': '9',
};
