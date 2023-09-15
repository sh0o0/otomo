import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/entities/changed_event.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_changed_event.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/tools/uuid.dart';
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

@riverpod
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

  Future<void> sendMessage(String text) async {
    final clientId = uuid();
    final newTextMessageData = TextMessageData(
      message: MessageData(
        id: clientId,
        author: Author.fromRole(Role.user),
        sentAt: DateTime.now(),
        status: MessageStatus.sending,
        active: false,
      ),
      text: text,
    );

    _addTextMessage(newTextMessageData);

    final respTextMessage = await _chatController.sendMessage(
      userId: _globalState.userId!,
      text: text,
      clientId: clientId,
    );

    final respTextMessageData = TextMessageData.fromTextMessage(respTextMessage,
        status: MessageStatus.sent);

    _updateTextMessage(respTextMessageData);
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
      final message = changedEvent.data;

      switch (changedEvent.type) {
        case ChangedEventType.added:
          final textMessageData = TextMessageData.fromTextMessage(
            message!,
            status: MessageStatus.sent,
            active: false,
          );
          if (_isMessageExist(textMessageData.message.id)) {
            _updateTextMessage(textMessageData);
          } else {
            _addTextMessage(textMessageData);
          }
          break;
        case ChangedEventType.modified:
          final textMessageData = TextMessageData.fromTextMessage(
            message!,
            status: MessageStatus.sent,
            active: false,
          );
          _updateTextMessage(textMessageData);
          break;
        case ChangedEventType.removed:
          _removeTextMessageByRemoteId(changedEvent.messageId);
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

  bool _isMessageExist(String id) {
    final value = state.value;
    if (value == null) return false;

    return value.messages.any((m) => m.message.id == id);
  }

  int _indexOfMessage(String id) {
    final value = state.value;
    if (value == null) return -1;

    return value.messages.indexWhere((m) => m.message.id == id);
  }

  int _indexOfMessageByRemoteId(String remoteId) {
    final value = state.value;
    if (value == null) return -1;

    return value.messages.indexWhere((m) => m.message.remoteId == remoteId);
  }

  void _addTextMessage(TextMessageData textMessage) {
    if (_isMessageExist(textMessage.message.id)) return;
    state = state..value?.messages.insert(0, textMessage);
  }

  void _updateTextMessage(TextMessageData textMessage) {
    final index = _indexOfMessage(textMessage.message.id);
    if (index == -1) return;
    state = state..value?.messages[index] = textMessage;
  }

  void _removeTextMessageByRemoteId(String remoteId) {
    final index = _indexOfMessageByRemoteId(remoteId);
    if (index == -1) return;
    state = state..value?.messages.removeAt(index);
  }
}
