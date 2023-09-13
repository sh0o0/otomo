import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/message.dart';
part 'message_event.freezed.dart';

@freezed
class TextMessageChangedEvent with _$TextMessageChangedEvent {
  const factory TextMessageChangedEvent({
    required MessageChangedEventType type,
    TextMessage? data,
  }) = _TextMessageChangedEvent;
}

enum MessageChangedEventType {
  added,
  modified,
  removed,
}
