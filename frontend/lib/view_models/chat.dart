import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/tools/uuid.dart';
import 'package:otomo/view_models/boundary/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    required List<TextMessageData> messages,
  }) = _ChatState;

  List<Place> get activePlaces {
    final places = <Place>[];

    for (final message in _activeMessages) {
      final placesFromMessage = _placesFromTextMessageData(message);
      places.addAll(placesFromMessage);
    }

    return places;
  }

  List<TextMessageData> get _activeMessages =>
      messages.where((m) => m.active).toList();

  List<Place> _placesFromTextMessageData(TextMessageData message) {
    final places = <Place>[];
    final customTexts = CustomText.fromAllMatches(message.text);

    for (final customText in customTexts) {
      final latLng = customText.latLng;
      if (latLng == null) continue;
      places.add(Place(name: customText.text, latLng: latLng));
    }

    return places;
  }
}

@Riverpod(keepAlive: true)
class Chat extends _$Chat {
  final _globalState = getIt<GlobalState>();
  final _chatController = getIt<ChatControllerImpl>();
  final StreamController<Place> _focusedPlaceController =
      StreamController<Place>.broadcast();

  StreamController<Place> get focusedPlaceController => _focusedPlaceController;

  @override
  FutureOr<ChatState> build() async {
    state = const AsyncValue.loading();

    final chatMessages = await _listTextMessageData(null, null);

    return ChatState(
      messages: chatMessages,
    );
  }

  void sendMessage(String text) {
    final stream = _sendMessage(text);
    _receiveReply(stream);
  }

  Future<void> listMessagesMore() async {
    final ChatState preValue = state.value ?? const ChatState(messages: []);

    final lastMessageId = preValue.messages.last.remoteId;

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

  Stream<String> _sendMessage(String text) {
    final sendingMessage = _newTextMessageData(
        text: text, role: Role.user, status: MessageStatus.sending);

    _addMessage(sendingMessage);
    final stream = _chatController.sendMessage(text);
    final sentMessage = sendingMessage.copyWith(status: MessageStatus.sent);
    _updateMessageWithIndex(sentMessage);
    return stream;
  }

  void _receiveReply(Stream<String> replyStream) {
    TextMessageData? reply;

    replyStream.listen(
      (replyChunk) {
        final isFirstChunk = reply == null;
        reply = _combineReplyChunk(reply, replyChunk);
        if (isFirstChunk) {
          _addMessage(reply!);
        } else {
          _updateMessageWithIndex(reply!);
        }
      },
      onError: (e) {
        logger.warn(e.toString());

        if (reply == null) {
          reply = _newTextMessageData(
            text: 'Error occurred',
            role: Role.otomo,
            status: MessageStatus.error,
          );
          _addMessage(reply!);
        } else {
          _updateMessageWithIndex(reply!.copyWith(status: MessageStatus.error));
        }
      },
      onDone: () {
        _updateMessageWithIndex(reply!.copyWith(status: MessageStatus.sent));
      },
      cancelOnError: true,
    );
  }

  void _addMessage(TextMessageData message) {
    state = state..value!.messages.insert(0, message);
  }

  void _updateMessageWithIndex(TextMessageData message) {
    final messages = state.value!.messages;
    final index = messages.indexWhere((m) => m.id == message.id);
    messages[index] = message;
    state = state;
  }

  TextMessageData _combineReplyChunk(TextMessageData? reply, String replyText) {
    if (reply == null) {
      return _newTextMessageData(
        text: replyText,
        role: Role.otomo,
        status: MessageStatus.sending,
      );
    } else {
      final combinedText = reply.text + replyText;
      final combinedReply = reply.copyWith(text: combinedText);
      return combinedReply;
    }
  }

  TextMessageData _newTextMessageData({
    required String text,
    required Role role,
    required MessageStatus status,
  }) {
    return TextMessageData(
      id: uuid(),
      text: text,
      role: role,
      status: status,
      // TODO: Replace date time with response
      sentAt: DateTime.now(),
    );
  }

  void resetActiveMessages() {
    final value = state.value;
    if (value == null) return;

    final inactiveMessages =
        value.messages.map((e) => e.copyWith(active: false)).toList();

    state = AsyncValue.data(value.copyWith(messages: inactiveMessages));
  }

  void activateMessageWith(int index) {
    resetActiveMessages();

    final value = state.value;
    if (value == null) return;

    final message = value.messages[index];
    value.messages[index] = message.copyWith(active: true);

    state = AsyncValue.data(value);
  }

  void focusPlace(Place place) {
    _focusedPlaceController.add(place);
  }
}
