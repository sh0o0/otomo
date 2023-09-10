import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:otomo/entities/lat_lng.dart';
part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String text,
    required Role role,
    required DateTime sentAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

enum Role {
  user,
  otomo,
}

@freezed
class CustomText with _$CustomText {
  const factory CustomText({
    required String text,
    required Map<String, dynamic> data,
    AppLatLng? latLng,
  }) = _CustomText;

  static final regExp = RegExp(r'%\[(.*?)\]\((.*?)\)');

  static CustomText _fromMatch(Match match) {
    final text = match.group(1);
    final dataStr = match.group(2);
    final data = jsonDecode(dataStr ?? '{}');

    AppLatLng? latLng;

    if (data['latLng'] != null) {
      latLng = AppLatLng.fromJson(data['latLng']);
    }

    return CustomText(
      text: text ?? '',
      data: data,
      latLng: latLng,
    );
  }

  static CustomText fromFirstMatch(String str) {
    final match = regExp.firstMatch(str);
    if (match == null) return const CustomText(text: '', data: {});

    return _fromMatch(match);
  }

  static List<CustomText> fromAllMatches(String str) {
    final matches = regExp.allMatches(str);
    final results = <CustomText>[];

    for (final match in matches) {
      results.add(_fromMatch(match));
    }

    return results;
  }
}
