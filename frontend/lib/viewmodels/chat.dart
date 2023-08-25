import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grpc/grpc.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/grpc/generated/chat_service_service.pbgrpc.dart';
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
  final _globalState = getIt<GlobalState>();
  final _chatService = getIt<ChatServiceClient>();

  @override
  FutureOr<ChatState> build() {
    return ChatState(
      messages: [],
      user: User(id: _globalState.userId!),
      otomo: User(id: uuid()),
    );
  }

  void sendMessage(String text) {
    final stream = _sendMessage(text);
    _receiveReply(stream);
  }

  ResponseStream<ChatService_SendMessageStreamResponse> _sendMessage(
    String text,
  ) {
    final sendingMessage = _newTextMessage(text, state.value!.user)
        .copyWith(status: Status.sending);

    _addMessage(sendingMessage);
    final stream =
        _chatService.sendMessage(ChatService_SendMessageRequest()..text = text);
    final sentMessage =
        sendingMessage.copyWith(status: Status.sent) as TextMessage;
    _updateMessageWithIndex(sentMessage);
    return stream;
  }

  void _receiveReply(
    ResponseStream<ChatService_SendMessageStreamResponse> replyStream,
  ) {
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
          reply = _newTextMessage('Error occurred', state.value!.otomo)
              .copyWith(status: Status.error) as TextMessage;
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

  void _addMessage(Message message) {
    state = state..value!.messages.insert(0, message);
  }

  void _updateMessageWithIndex(Message message) {
    final messages = state.value!.messages;
    final index = messages.indexWhere((m) => m.id == message.id);
    messages[index] = message;
    state = state;
  }

  TextMessage _combineReplyChunk(
    TextMessage? reply,
    ChatService_SendMessageStreamResponse replyChunk,
  ) {
    if (reply == null) {
      return _newTextMessage(replyChunk.text, state.value!.otomo)
          .copyWith(status: Status.sending) as TextMessage;
    } else {
      final replyText = reply.text + replyChunk.text;
      final combinedReply = reply.copyWith(text: replyText);
      return combinedReply as TextMessage;
    }
  }

  TextMessage _newTextMessage(String text, User author) {
    return TextMessage(
      author: author,
      // Random string
      id: uuid(),
      text: text,
    );
  }
}
