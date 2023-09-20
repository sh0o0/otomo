import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/controllers/utils.dart';
import 'package:otomo/entities/changed_event.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_changed_event.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/tools/logger.dart';
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
    @Default(false) bool showOnlyMessages,
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
  final _chatController = getIt<ChatControllerImpl>();
  final StreamController<Place> _focusedPlaceController =
      StreamController<Place>.broadcast();

  Stream<Place> get focusPlaceStream => _focusedPlaceController.stream;

  @override
  FutureOr<ChatState> build() async {
    state = const AsyncValue.loading();

    final messages = await _listTextMessageData(null, null);
    final user = readUser(ref);

    final messageChangedEventSub = _chatController
        .messageChangedEventsStream(userId: user!.id)
        .listen(_onMessageChanged, onError: (e) => logger.error(e.toString()));
    final messagingSub = _chatController
        .messagingStream(userId: user.id)
        .listen(_onBeMassaged, onError: (e) => logger.error(e.toString()));

    ref.onDispose(() {
      messageChangedEventSub.cancel();
      messagingSub.cancel();
    });

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
      userId: readUser(ref)!.id,
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
        readUser(ref)!.id, pageSize, pageStartAfterMessageId);

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

  void _onBeMassaged(TextMessageChunk chunk) {
    if (_isMessageExist(chunk.messageId)) {
      _joinTextMessageChunk(chunk);
    } else {
      final textMessage = TextMessageData.fromTextMessageChunk(
        chunk,
        status: chunk.isLast ? MessageStatus.sent : MessageStatus.sending,
      );
      _addTextMessage(textMessage);
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

  void toggleShowOnlyMessages() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(
        value.copyWith(showOnlyMessages: !value.showOnlyMessages));
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

  void _joinTextMessageChunk(TextMessageChunk chunk) {
    final index = _indexOfMessage(chunk.messageId);
    if (index == -1) return;
    final textMessage = state.value!.messages[index];
    final joinedTextMessage = textMessage.copyWith
        .message(
          sentAt: chunk.sentAt,
          status: chunk.isLast ? MessageStatus.sent : MessageStatus.sending,
        )
        .copyWith(text: textMessage.text + chunk.text);
    state = state..value?.messages[index] = joinedTextMessage;
  }

  void _removeTextMessageByRemoteId(String remoteId) {
    final index = _indexOfMessageByRemoteId(remoteId);
    if (index == -1) return;
    state = state..value?.messages.removeAt(index);
  }
}
