import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class TextMessage with _$TextMessage {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TextMessage({
    required String id,
    String? clientId,
    required String text,
    required Role role,
    required DateTime sentAt,
  }) = _TextMessage;

  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);
}

enum Role {
  user,
  otomo,
}
