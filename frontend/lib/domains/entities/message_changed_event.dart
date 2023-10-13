import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/domains/entities/changed_event.dart';
import 'package:otomo/domains/entities/message.dart';

part 'message_changed_event.freezed.dart';

@freezed
class TextMessageChangedEvent with _$TextMessageChangedEvent {
  const factory TextMessageChangedEvent({
    required String messageId,
    required ChangedEventType type,
    TextMessage? data,
  }) = _TextMessageChangedEvent;
}

