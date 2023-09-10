import 'dart:async';

import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/entities/latlng.dart';
import 'package:otomo/entities/message.dart' as msg;
import 'package:otomo/entities/place.dart';
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/tools/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChatState with _$ChatState {
  const ChatState._();

  const factory ChatState({
    required List<Message> messages,
    required User user,
    required User otomo,
  }) = _ChatState;

  List<Place> get activePlaces {
    final places = <Place>[];
    for (final message in _activeMessages) {
      if (message is! TextMessage) continue;

      final placesFromMessage = _placesFromTextMessage(message);
      places.addAll(placesFromMessage);
    }

    return places;
  }

  List<Message> get _activeMessages =>
      messages.where((m) => m.metadata?['active'] == true).toList();

  List<Place> _placesFromTextMessage(TextMessage message) {
    final places = <Place>[];
    final customTexts = msg.CustomText.fromAllMatches(message.text);

    for (final customText in customTexts) {
      logger.debug('customText: $customText');
      final place = Place(
          name: customText.text, latLng: AppLatLng.fromJson(customText.data['latlng']));
      places.add(place);
    }

    return places;
  }
}

@Riverpod(keepAlive: true)
class Chat extends _$Chat {
  Chat() {
    _user = User(id: _globalState.userId!);
    _otomo = User(id: uuid());
  }

  final _globalState = getIt<GlobalState>();
  final _chatController = getIt<ChatControllerImpl>();
  late final User _user;
  late final User _otomo;
  final StreamController<Place> _focusedPlaceController =
      StreamController<Place>.broadcast();

  StreamController<Place> get focusedPlaceController => _focusedPlaceController;
  List<Message> get _nonNullMessages => state.value?.messages ?? [];

  @override
  FutureOr<ChatState> build() async {
    state = const AsyncValue.loading();

    final chatMessages = await _listChatUIMessages(null, null);

    return ChatState(
      messages: chatMessages,
      user: _user,
      otomo: _otomo,
    );
  }

  void sendMessage(String text) {
    final stream = _sendMessage(text);
    _receiveReply(stream);
  }

  Future<void> listMessagesMore() async {
    final preValue = state.value;
    if (preValue == null) return;

    final lastMessageId = preValue.messages.last.remoteId;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final chatMessages = await _listChatUIMessages(null, lastMessageId);
      return preValue
          .copyWith(messages: [...preValue.messages, ...chatMessages]);
    });
  }

  Future<List<Message>> _listChatUIMessages(
      int? pageSize, String? pageStartAfterMessageId) async {
    final messages = await _chatController.listMessages(
        _globalState.userId!, pageSize, pageStartAfterMessageId);

    return messages.map((m) => _toChatUIMessage(m, Status.sent)).toList();
  }

  Stream<String> _sendMessage(String text) {
    final sendingMessage =
        _newTextMessage(text, state.value!.user, Status.sending);

    _addMessage(sendingMessage);
    final stream = _chatController.sendMessage(text);
    final sentMessage =
        sendingMessage.copyWith(status: Status.sent) as TextMessage;
    _updateMessageWithIndex(sentMessage);
    return stream;
  }

  void _receiveReply(Stream<String> replyStream) {
    TextMessage? reply;

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
          reply = _newTextMessage(
              'Error occurred', state.value!.otomo, Status.error);
          _addMessage(reply!);
        } else {
          _updateMessageWithIndex(reply!.copyWith(status: Status.error));
        }
      },
      onDone: () {
        _updateMessageWithIndex(reply!.copyWith(status: Status.sent));
      },
      cancelOnError: true,
    );
  }

  void _addMessage(TextMessage message) {
    state = state..value!.messages.insert(0, message);
  }

  void _updateMessageWithIndex(Message message) {
    final messages = state.value!.messages;
    final index = messages.indexWhere((m) => m.id == message.id);
    messages[index] = message;
    state = state;
  }

  TextMessage _combineReplyChunk(TextMessage? reply, String replyText) {
    if (reply == null) {
      return _newTextMessage(replyText, state.value!.otomo, Status.sending);
    } else {
      final combinedText = reply.text + replyText;
      final combinedReply = reply.copyWith(text: combinedText);
      return combinedReply as TextMessage;
    }
  }

  TextMessage _newTextMessage(String text, User author, Status? status) {
    return TextMessage(
      author: author,
      id: uuid(),
      text: text,
      status: status,
    );
  }

  Message _toChatUIMessage(
    msg.Message message,
    Status status,
  ) {
    return TextMessage(
      author: message.role == msg.Role.user ? _user : _otomo,
      id: uuid(),
      remoteId: message.id,
      text: message.text,
      status: status,
    );
  }

  void resetActiveMessages() {
    for (final m in _nonNullMessages) {
      if (m.metadata?['active'] == true) {
        m.metadata?['active'] = false;
      }
    }

    state = state;
  }

  void activateMessage(Message message) {
    final messages = [..._nonNullMessages];
    for (final m in messages) {
      if (m.metadata?['active'] == true) {
        m.metadata?['active'] = false;
      }
    }

    final index = messages.indexWhere((e) => e.id == message.id);
    final metadata = messages[index].metadata;
    final newMetadata =
        metadata == null ? {'active': true} : {...metadata, 'active': true};
    messages[index] = message.copyWith(metadata: newMetadata);

    state = AsyncValue.data(state.value!.copyWith(messages: messages));
  }

  void focusPlace(Place place) {
    _focusedPlaceController.add(place);
  }
}
