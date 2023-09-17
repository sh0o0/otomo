import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/tools/logger.dart';
part 'custom_text.freezed.dart';

@freezed
class CustomText with _$CustomText {
  const factory CustomText({
    required String text,
    required Map<String, dynamic> data,
    AppLatLng? latLng,
  }) = _CustomText;

  static final regExp = RegExp(r'%\[(.*?)\]\((.*?)\)');

  factory CustomText._fromMatch(Match match) {
    final text = match.group(1);
    final dataStr = match.group(2);

    var data = <String, dynamic>{};
    try {
      data = jsonDecode(dataStr ?? '{}');
    } catch (e) {
      logger.warn(e.toString());
      data = {};
    }

    AppLatLng? latLng;

    // In the first place, the key was 'lat_lng'.
    final latLngStr = data['lat_lng'] ?? data['latLng'] ?? data['latlng'];
    if (latLngStr != null) {
      latLng = AppLatLng.fromJson(latLngStr);
    }

    return CustomText(
      text: text ?? '',
      data: data,
      latLng: latLng,
    );
  }

  factory CustomText.fromFirstMatch(String str) {
    final match = regExp.firstMatch(str);
    if (match == null) return const CustomText(text: '', data: {});

    return CustomText._fromMatch(match);
  }

  static List<CustomText> fromAllMatches(String str) {
    final matches = regExp.allMatches(str);
    final results = <CustomText>[];

    for (final match in matches) {
      results.add(CustomText._fromMatch(match));
    }

    return results;
  }
}
