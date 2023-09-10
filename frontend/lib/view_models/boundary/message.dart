import 'package:freezed_annotation/freezed_annotation.dart';
part 'message.freezed.dart';

@freezed
class TextMessageData with _$TextMessageData {
  const factory TextMessageData({
    required String id,
    required String text,
    required String role,
    required DateTime sentAt,
    required String? remoteId,
    @Default(false) bool active,
  }) = _TextMessageData;
}
