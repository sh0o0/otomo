import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/exception.dart';
import 'package:otomo/entities/message.dart';

part 'chat.freezed.dart';

@freezed
class MessageData with _$MessageData {
  const factory MessageData({
    required String id,
    required Author author,
    required DateTime sentAt,
    String? remoteId,
    @Default(false) bool active,
    required MessageStatus status,
    AppException? error,
  }) = _MessageData;
}

@freezed
class TextMessageData with _$TextMessageData {
  const TextMessageData._();

  const factory TextMessageData({
    required MessageData message,
    required String text,
    @Default(LocationAnalysis(locations: [])) LocationAnalysis locationAnalysis,
  }) = _TextMessageData;

  factory TextMessageData.fromTextMessage(
    TextMessage message, {
    required MessageStatus status,
    bool active = false,
  }) {
    return TextMessageData(
      message: MessageData(
        id: (message.clientId?.isNotEmpty == true)
            ? message.clientId!
            : message.id,
        author: Author.fromRole(message.role),
        sentAt: message.sentAt,
        remoteId: message.id,
        status: message.hasError ? MessageStatus.error : status,
        active: active,
      ),
      text: message.text,
      locationAnalysis: message.locationAnalysis,
    );
  }

  factory TextMessageData.fromTextMessageChunk(
    TextMessageChunk chunk, {
    required MessageStatus status,
    bool active = false,
  }) {
    return TextMessageData(
      message: MessageData(
        id: (chunk.clientId?.isNotEmpty == true)
            ? chunk.clientId!
            : chunk.messageId,
        author: Author.fromRole(chunk.role),
        sentAt: chunk.sentAt,
        remoteId: chunk.messageId,
        status: status,
        active: active,
      ),
      text: chunk.text,
    );
  }
}

enum MessageStatus {
  sent,
  sending,
  error,
}

@freezed
class Author with _$Author {
  const Author._();

  const factory Author({
    required String id,
  }) = _Author;

  factory Author.fromRole(Role role) {
    return Author(id: role.toString());
  }

  bool get isUser => id == Role.user.toString();
  bool get isOtomo => id == Role.otomo.toString();
}
