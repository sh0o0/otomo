import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grpc/grpc.dart';
import 'package:otomo/grpc/generated/chat_service_service.pbgrpc.dart';
import 'package:otomo/injection.dart';
import 'package:otomo/tools/global_state.dart';
import 'package:otomo/tools/uuid.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
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
    // if be implemented delete message feature, should be implemented optimistic update.
    final newMessageIndex = _lengthOfMessages;

    _addMessage(sendingMessage);
    final stream =
        _chatService.sendMessage(ChatService_SendMessageRequest()..text = text);
    final sentMessage =
        sendingMessage.copyWith(status: Status.sent) as TextMessage;
    _updateMessageWithIndex(sentMessage, newMessageIndex);
    return stream;
  }

  void _receiveReply(
    ResponseStream<ChatService_SendMessageStreamResponse> replyStream,
  ) {
    final newReplyIndex = _lengthOfMessages;
    const replyingText = '...';
    String replyText = replyingText;
    TextMessage reply = _newTextMessage(replyText, state.value!.otomo)
        .copyWith(status: Status.sending) as TextMessage;
    _addMessage(reply);

    replyStream.listen(
      (replyChunk) {
        final replyTextExceptReplyingText =
            replyText.substring(0, replyText.length - 3);
        replyText +=
            replyTextExceptReplyingText + replyChunk.text + replyingText;
        final updatedReply = reply.copyWith(text: replyText);
        reply = updatedReply as TextMessage;

        _updateMessageWithIndex(updatedReply, newReplyIndex);
      },
      onError: (e) {
        final errReply = reply.copyWith(status: Status.error);
        _updateMessageWithIndex(errReply, newReplyIndex);
      },
      onDone: () {
        _updateMessageWithIndex(
            reply.copyWith(status: Status.sent), newReplyIndex);
      },
      cancelOnError: true,
    );
  }

  int get _lengthOfMessages => state.value!.messages.length;

  void _addMessage(Message message) {
    state = AsyncValue.data(state.value!.copyWith(
      messages: [...state.value!.messages, message],
    ));
  }

  void _updateMessageWithIndex(Message message, int index) {
    final messages = state.value!.messages;
    final updatedMessages = <Message>[
      ...messages.sublist(0, index),
      message,
      ...messages.sublist(index + 1),
    ];
    state = AsyncValue.data(state.value!.copyWith(messages: updatedMessages));
  }

  TextMessage _newTextMessage(String text, User author) {
    return TextMessage(
      author: author,
      id: uuid(),
      text: text,
    );
  }
}
