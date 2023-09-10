import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/message.dart';
part 'message.freezed.dart';

@freezed
class TextMessageData with _$TextMessageData {
  const factory TextMessageData({
    required String id,
    required String text,
    required Role role,
    required DateTime sentAt,
    String? remoteId,
    @Default(false) bool active,
    required MessageStatus status,
  }) = _TextMessageData;

  factory TextMessageData.fromTextMessage(
    TextMessage message, {
    required MessageStatus status,
    bool active = false,
  }) {
    return TextMessageData(
      id: message.id,
      text: message.text,
      role: message.role,
      sentAt: message.sentAt,
      remoteId: message.id,
      status: status,
      active: active,
    );
  }
}

enum MessageStatus {
  sent,
  sending,
  error,
}
