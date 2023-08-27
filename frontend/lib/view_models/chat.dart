import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/chat.dart';
import 'package:otomo/models/message.dart' as msg;
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/tools/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChatState with _$ChatState {
  const factory ChatState({
    required List<Message> messages,
    required User user,
    required User otomo,
  }) = _ChatState;
}

@riverpod
class Chat extends _$Chat {
  Chat() {
    _user = User(id: _globalState.userId!);
    _otomo = User(id: uuid());
  }

  final _globalState = getIt<GlobalState>();
  final _chatController = getIt<ChatController>();
  late final User _user;
  late final User _otomo;

  @override
  FutureOr<ChatState> build() async {
    state = const AsyncValue.loading();

    final messages =
        await _chatController.listMessages(_globalState.userId!, null, null);
    final chatMessages =
        messages.map((m) => _toChatUIMessage(m, Status.sent)).toList();

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
}
