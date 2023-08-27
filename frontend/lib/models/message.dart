import 'package:freezed_annotation/freezed_annotation.dart';
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
