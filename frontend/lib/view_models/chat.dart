import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/controllers/pagination.dart';
import 'package:otomo/controllers/utils.dart';
import 'package:otomo/entities/changed_event.dart';
import 'package:otomo/entities/exception.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_changed_event.dart';
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
    required Pagination<TextMessageData> messagesPage,
    @Default(false) bool hideTextField,
  }) = _ChatState;

  static final user = Author.fromRole(Role.user);

  List<AnalyzedLocation> get activeAnalyzedLocations {
    final locations = <AnalyzedLocation>[];

    for (final message in _activeMessages) {
      locations.addAll(message.locationAnalysis.locations);
    }

    return locations;
  }

  List<TextMessageData> get _activeMessages =>
      messagesPage.items.where((m) => m.message.active).toList();
}

@riverpod
class Chat extends _$Chat {
  Chat() : super();

  final _chatController = getIt<ChatControllerImpl>();
  final StreamController<AnalyzedLocation>
      _focusedAnalyzedLocationStreamController =
      StreamController<AnalyzedLocation>.broadcast();
  final StreamController<TextMessageData>
      _activatedTextMessageStreamController =
      StreamController<TextMessageData>.broadcast();

  Stream<AnalyzedLocation> get focusedAnalyzedLocationStream =>
      _focusedAnalyzedLocationStreamController.stream;
  Stream<TextMessageData> get activatedTextMessageStream =>
      _activatedTextMessageStreamController.stream;

  @override
  Future<ChatState> build() async {
    late final Pagination<TextMessageData> page;
    try {
      page = await _listTextMessageData(null, null);
    } catch (e, s) {
      return Future.error(e, s);
    }
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

    return ChatState(
      messagesPage: Pagination(
        items: page.items,
        hasMore: page.hasMore,
      ),
    );
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

    late final TextMessage respTextMessage;
    try {
      respTextMessage = await _chatController.sendMessage(
        userId: readUser(ref)!.id,
        text: text,
        clientId: clientId,
      );
    } catch (e) {
      final errorTextMessageData = newTextMessageData.copyWith.message(
          status: MessageStatus.error, error: AppException.orUnknown(e));
      _updateTextMessage(errorTextMessageData);
      return;
    }

    final respTextMessageData = TextMessageData.fromTextMessage(
      respTextMessage,
      status: MessageStatus.sent,
    );

    _updateTextMessage(respTextMessageData);
  }

  Future<void> listMessagesMore() async {
    if (state.isLoading) return;
    if (state.value?.messagesPage.hasMore == false) return;

    final ChatState preValue = state.value ??
        const ChatState(messagesPage: Pagination(items: [], hasMore: true));

    final lastMessageId = preValue.messagesPage.items.last.message.remoteId;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final page = await _listTextMessageData(null, lastMessageId);
      return preValue.copyWith(
        messagesPage: Pagination(
          items: [...preValue.messagesPage.items, ...page.items],
          hasMore: page.hasMore,
        ),
      );
    });
  }

  Future<Pagination<TextMessageData>> _listTextMessageData(
    int? pageSize,
    String? pageStartAfterMessageId,
  ) async {
    final page = await _chatController.listMessages(
        readUser(ref)!.id, pageSize, pageStartAfterMessageId);

    return Pagination(
      items: page.items
          .map((e) =>
              TextMessageData.fromTextMessage(e, status: MessageStatus.sent))
          .toList(),
      hasMore: page.hasMore,
    );
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

  void toggleMessageActiveWithId(String id) {
    final index = _indexOfMessage(id);
    if (index == -1) return;

    final msg = state.value!.messagesPage.items[index];
    if (msg.message.active) {
      _deactivateMessageWithIndex(index);
    } else {
      _activateMessageWithIndex(index);
      _activatedTextMessageStreamController.add(msg);
    }
  }

  void _activateMessageWithIndex(int index) {
    final message = state.value!.messagesPage.items[index];
    state = state
      ..value?.messagesPage.items[index] =
          message.copyWith.message(active: true);
  }

  void _deactivateMessageWithIndex(int index) {
    final message = state.value!.messagesPage.items[index];
    state = state
      ..value?.messagesPage.items[index] =
          message.copyWith.message(active: false);
  }

  void focusAnalyzedLocation(AnalyzedLocation loc) {
    _focusedAnalyzedLocationStreamController.add(loc);
  }

  void toggleShowOnlyMessages() {
    final value = state.value;
    if (value == null) return;

    state =
        AsyncValue.data(value.copyWith(hideTextField: !value.hideTextField));
  }

  void showTextField() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(value.copyWith(hideTextField: false));
  }

  void hideTextField() {
    final value = state.value;
    if (value == null) return;

    state = AsyncValue.data(value.copyWith(hideTextField: true));
  }

  bool _isMessageExist(String id) {
    final value = state.value;
    if (value == null) return false;

    return value.messagesPage.items.any((m) => m.message.id == id);
  }

  int _indexOfMessage(String id) {
    final value = state.value;
    if (value == null) return -1;

    return value.messagesPage.items.indexWhere((m) => m.message.id == id);
  }

  int _indexOfMessageByRemoteId(String remoteId) {
    final value = state.value;
    if (value == null) return -1;

    return value.messagesPage.items
        .indexWhere((m) => m.message.remoteId == remoteId);
  }

  void _addTextMessage(TextMessageData textMessage) {
    if (_isMessageExist(textMessage.message.id)) return;
    state = state..value?.messagesPage.items.insert(0, textMessage);
  }

  void _updateTextMessage(TextMessageData textMessage) {
    final index = _indexOfMessage(textMessage.message.id);
    if (index == -1) return;
    state = state..value?.messagesPage.items[index] = textMessage;
  }

  void _joinTextMessageChunk(TextMessageChunk chunk) {
    final index = _indexOfMessage(chunk.messageId);
    if (index == -1) return;
    final textMessage = state.value!.messagesPage.items[index];
    final joinedTextMessage = textMessage.copyWith
        .message(
          sentAt: chunk.sentAt,
          status: chunk.isLast ? MessageStatus.sent : MessageStatus.sending,
        )
        .copyWith(text: textMessage.text + chunk.text);
    state = state..value?.messagesPage.items[index] = joinedTextMessage;
  }

  void _removeTextMessageByRemoteId(String remoteId) {
    final index = _indexOfMessageByRemoteId(remoteId);
    if (index == -1) return;
    state = state..value?.messagesPage.items.removeAt(index);
  }
}
