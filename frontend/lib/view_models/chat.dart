// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/constants/analytics_event.dart';
import 'package:otomo/controllers/boundary/chat.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/domains/entities/pagination.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/changed_event.dart';
import 'package:otomo/domains/entities/message.dart';
import 'package:otomo/domains/entities/message_changed_event.dart';
import 'package:otomo/domains/entities/message_send_count.dart';
import 'package:otomo/tools/analytics.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/tools/uuid.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    required Pagination<TextMessageData> messages,
    required RemainingMessageSendCount remainingMessageSendCount,
  }) = _ChatState;

  static final user = Author.fromRole(Role.user);

  List<ExtractedPlace> get activePlaces {
    final places = <ExtractedPlace>[];

    for (final message in _activeMessages) {
      places.addAll(message.placeExtraction.places);
    }

    return places;
  }

  List<TextMessageData> get _activeMessages =>
      messages.items.where((m) => m.message.active).toList();
}

@riverpod
class Chat extends _$Chat {
  final _chatController = getIt<ChatControllerImpl>();
  final StreamController<ExtractedPlace> _focusedPlaceStreamController =
      StreamController<ExtractedPlace>.broadcast();
  final StreamController<TextMessageData>
      _activatedTextMessageStreamController =
      StreamController<TextMessageData>.broadcast();

  Stream<ExtractedPlace> get focusedPlaceStream =>
      _focusedPlaceStreamController.stream;
  Stream<TextMessageData> get activatedTextMessageStream =>
      _activatedTextMessageStreamController.stream;

  @override
  Future<ChatState> build() async =>
      // Not const. Because it is not possible to add a message.
      // ignore: prefer_const_constructors
      ChatState(
        messages: Pagination.emptyHasMore(),
        remainingMessageSendCount: RemainingMessageSendCount.empty(),
      );

  Future<void> initState() async {
    state = const AsyncValue.loading();
    state = await guard(() async {
      final messages = await _listTextMessageData(null, null);
      final remainingMessageSendCount = await _getRemainingMessageSendCount();
      return state.value!.copyWith(
        messages: messages,
        remainingMessageSendCount: remainingMessageSendCount,
      );
    });

    final account = readAccount(ref);

    final messageChangedEventSub = _chatController
        .recentMessageChangedEventsStream(userId: account!.uid)
        .listen(
      _onMessageChanged,
      onError: (error) {
        if (error is AppException && error.causeIs(Cause.permissionDenied)) {
          logger.warn(error);
        }
      },
    );
    final messagingSub = _chatController
        .messagingStream(userId: account.uid)
        .listen(_onBeMassaged, onError: (e) => logger.warn(e.toString()));

    ref.onDispose(() {
      messageChangedEventSub.cancel();
      messagingSub.cancel();
    });
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

    late final SendMessageOutput output;
    try {
      output = await _chatController.sendMessage(
        userId: readAccount(ref)!.uid,
        text: text,
        clientId: clientId,
      );
    } on Exception catch (e) {
      logger.warn(e);
      final errorTextMessageData = newTextMessageData.copyWith.message(
        status: MessageStatus.error,
        error: e,
      );
      _updateTextMessage(errorTextMessageData);
      return;
    }

    final respTextMessageData = TextMessageData.fromTextMessage(
      output.message,
      status: MessageStatus.sent,
    );

    _updateTextMessage(respTextMessageData);
    _updateRemainingMessageSendCount(output.remainingMessageSendCount);
  }

  Future<void> listMessagesMore() async {
    if (state.isLoading) return;
    if (state.value?.messages.hasMore == false) return;

    final ChatState preValue = state.value ??
        ChatState(
          messages: Pagination.emptyHasMore(),
          remainingMessageSendCount: RemainingMessageSendCount.empty(),
        );

    final lastMessageId = preValue.messages.items.last.message.remoteId;

    state = const AsyncValue.loading();
    final page = await _listTextMessageData(null, lastMessageId);
    state = AsyncValue.data(preValue.copyWith(
      messages: Pagination(
        items: [...preValue.messages.items, ...page.items],
        hasMore: page.hasMore,
      ),
    ));
  }

  Future<RemainingMessageSendCount> _getRemainingMessageSendCount() async {
    final output = await _chatController
        .getRemainingMessageSendCount(readAccount(ref)!.uid);
    return output.remainingMessageSendCount;
  }

  Future<Pagination<TextMessageData>> _listTextMessageData(
    int? pageSize,
    String? pageStartAfterMessageId,
  ) async {
    final page = await _chatController.listMessages(
        readAccount(ref)!.uid, pageSize, pageStartAfterMessageId);

    return Pagination(
      items: page.items
          .map((e) =>
              TextMessageData.fromTextMessage(e, status: MessageStatus.sent))
          .toList(),
      hasMore: page.hasMore,
    );
  }

  void _onMessageChanged(List<TextMessageChangedEvent> events) {
    logger.debug('message changed: $events');

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

    final msg = state.value!.messages.items[index];
    if (msg.message.active) {
      _deactivateMessageWithIndex(index);
      Analytics.logEvent(
          event: AnalyticsEvents.message_deactivated,
          parameters: {
            'message_id': msg.message.remoteId,
            'role': msg.message.author.id,
          });
    } else {
      _activateMessageWithIndex(index);
      _activatedTextMessageStreamController.add(msg);
      Analytics.logEvent(event: AnalyticsEvents.message_activated, parameters: {
        'message_id': msg.message.remoteId,
        'role': msg.message.author.id,
      });
    }
  }

  void _activateMessageWithIndex(int index) {
    final message = state.value!.messages.items[index];
    state = state
      ..value?.messages.items[index] = message.copyWith.message(active: true);
  }

  void _deactivateMessageWithIndex(int index) {
    final message = state.value!.messages.items[index];
    state = state
      ..value?.messages.items[index] = message.copyWith.message(active: false);
  }

  void focusPlace(ExtractedPlace place) {
    _focusedPlaceStreamController.add(place);
  }

  bool _isMessageExist(String id) {
    final value = state.value;
    if (value == null) return false;

    return value.messages.items.any((m) => m.message.id == id);
  }

  int _indexOfMessage(String id) {
    final value = state.value;
    if (value == null) return -1;

    return value.messages.items.indexWhere((m) => m.message.id == id);
  }

  int _indexOfMessageByRemoteId(String remoteId) {
    final value = state.value;
    if (value == null) return -1;

    return value.messages.items
        .indexWhere((m) => m.message.remoteId == remoteId);
  }

  void _addTextMessage(TextMessageData textMessage) {
    if (_isMessageExist(textMessage.message.id)) return;
    state = state..value?.messages.items.insert(0, textMessage);
  }

  void _updateTextMessage(TextMessageData textMessage) {
    final index = _indexOfMessage(textMessage.message.id);
    if (index == -1) return;
    state = state..value?.messages.items[index] = textMessage;
  }

  void _joinTextMessageChunk(TextMessageChunk chunk) {
    final index = _indexOfMessage(chunk.messageId);
    if (index == -1) return;
    final textMessage = state.value!.messages.items[index];
    final joinedTextMessage = textMessage.copyWith
        .message(
          sentAt: chunk.sentAt,
          status: chunk.isLast ? MessageStatus.sent : MessageStatus.sending,
        )
        .copyWith(text: textMessage.text + chunk.text);
    state = state..value?.messages.items[index] = joinedTextMessage;
  }

  void _removeTextMessageByRemoteId(String remoteId) {
    final index = _indexOfMessageByRemoteId(remoteId);
    if (index == -1) return;
    state = state..value?.messages.items.removeAt(index);
  }

  void _updateRemainingMessageSendCount(
      RemainingMessageSendCount remainingMessageSendCount) {
    final value = state.value;
    if (value == null) {
      state = AsyncValue.data(ChatState(
        messages: Pagination.emptyHasMore(),
        remainingMessageSendCount: remainingMessageSendCount,
      ));
      return;
    }

    state = AsyncValue.data(value.copyWith(
      remainingMessageSendCount: remainingMessageSendCount,
    ));
  }
}
