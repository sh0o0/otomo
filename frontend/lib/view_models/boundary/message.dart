import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/place.dart';
part 'message.freezed.dart';

@freezed
class TextMessageData with _$TextMessageData {
  const TextMessageData._();

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
