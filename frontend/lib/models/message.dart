import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
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
  }) = _CustomText;

  static final regExp = RegExp(r'%\[(.*?)\]\((.*?)\)');

  static CustomText fromFirstMatch(String str) {
    final match = regExp.firstMatch(str);
    if (match == null) return const CustomText(text: '', data: {});

    final text = match.group(1);
    final data = match.group(2);

    return CustomText(
      text: text ?? '',
      data: jsonDecode(data ?? '{}') ,
    );
  }

  static List<CustomText> fromAllMatches(String str) {
    final matches = regExp.allMatches(str);
    final results = <CustomText>[];

    for (final match in matches) {
      final text = match.group(1);
      final data = match.group(2);

      results.add(CustomText(
        text: text ?? '',
        data: jsonDecode(data ?? '{}') ,
      ));
    }

    return results;
  }
}
