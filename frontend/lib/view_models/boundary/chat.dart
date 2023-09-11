import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/place.dart';
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
  }) = _MessageData;
}

@freezed
class TextMessageData with _$TextMessageData {
  const TextMessageData._();

  const factory TextMessageData({
    required MessageData message,
    required String text,
  }) = _TextMessageData;

  factory TextMessageData.fromTextMessage(
    TextMessage message, {
    required MessageStatus status,
    bool active = false,
  }) {
    return TextMessageData(
      message: MessageData(
        id: message.id,
        author: Author.fromRole(message.role),
        sentAt: message.sentAt,
        remoteId: message.id,
        status: status,
        active: active,
      ),
      text: message.text,
    );
  }

  List<Place> get placesFromText {
    final places = <Place>[];
    final customTexts = CustomText.fromAllMatches(text);

    for (final customText in customTexts) {
      final latLng = customText.latLng;
      if (latLng == null) continue;
      places.add(Place(name: customText.text, latLng: latLng));
    }

    return places;
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
