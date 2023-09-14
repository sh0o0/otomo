import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/entities/changed_event.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_changed_event.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    required List<TextMessageData> messages,
  }) = _ChatState;

  static final user = Author.fromRole(Role.user);

  List<Place> get activePlaces {
    final places = <Place>[];

    for (final message in _activeMessages) {
      places.addAll(message.placesFromText);
    }

    return places;
  }

  List<TextMessageData> get _activeMessages =>
      messages.where((m) => m.message.active).toList();
}

@Riverpod(keepAlive: true)
class Chat extends _$Chat {
  final _globalState = getIt<GlobalState>();
  final _chatController = getIt<ChatControllerImpl>();
  final StreamController<Place> _focusedPlaceController =
      StreamController<Place>.broadcast();

  Stream<Place> get focusPlaceStream => _focusedPlaceController.stream;

  @override
  FutureOr<ChatState> build() async {
    state = const AsyncValue.loading();

    final messages = await _listTextMessageData(null, null);

    _chatController
        .messageChangedEventsStream(userId: _globalState.userId!)
        .listen(_onMessageChanged);

    return ChatState(messages: messages);
  }

  void sendMessage(String text) {
    _chatController.sendMessage(text);
  }

  Future<void> listMessagesMore() async {
    final ChatState preValue = state.value ?? const ChatState(messages: []);

    final lastMessageId = preValue.messages.last.message.remoteId;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final messages = await _listTextMessageData(null, lastMessageId);
      return preValue.copyWith(messages: [...preValue.messages, ...messages]);
    });
  }

  Future<List<TextMessageData>> _listTextMessageData(
    int? pageSize,
    String? pageStartAfterMessageId,
  ) async {
    final messages = await _chatController.listMessages(
        _globalState.userId!, pageSize, pageStartAfterMessageId);

    return messages
        .map((e) =>
            TextMessageData.fromTextMessage(e, status: MessageStatus.sent))
        .toList();
  }

  void _onMessageChanged(List<TextMessageChangedEvent> events) {
    for (final changedEvent in events) {
      final messages = state.value?.messages ?? [];
      final message = changedEvent.data;

      switch (changedEvent.type) {
        case ChangedEventType.added:
          final textMessageData = TextMessageData.fromTextMessage(
            message!,
            status: MessageStatus.sent,
            active: false,
          );
          state = state..value?.messages.insert(0, textMessageData);
          break;
        case ChangedEventType.modified:
          final textMessageData = TextMessageData.fromTextMessage(
            message!,
            status: MessageStatus.sent,
            active: false,
          );
          final index =
              messages.indexWhere((m) => m.message.remoteId == message.id);
          if (index == -1) return;
          state = state..value?.messages[index] = textMessageData;
          break;
        case ChangedEventType.removed:
          final index = messages
              .indexWhere((m) => m.message.remoteId == changedEvent.messageId);
          if (index == -1) return;
          state = state..value!.messages.removeAt(index);
          break;
      }
    }
  }

  void resetActiveMessages() {
    final value = state.value;
    if (value == null) return;

    final inactiveMessages =
        value.messages.map((e) => e.copyWith.message(active: false)).toList();

    state = AsyncValue.data(value.copyWith(messages: inactiveMessages));
  }

  void activateMessageWithId(String id) {
    resetActiveMessages();

    final value = state.value;
    if (value == null) return;

    final index = value.messages.indexWhere((m) => m.message.id == id);

    final message = value.messages[index];
    value.messages[index] = message.copyWith.message(active: true);

    state = AsyncValue.data(value);
  }

  void focusPlace(Place place) {
    _focusedPlaceController.add(place);
  }
}
