import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/tools/global_state.dart';

part 'chat.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required List<Message> messages,
    required User user,
  }) = _ChatState;
}

class ChatViewModel extends StateNotifier<ChatState> {
  ChatViewModel(this._globalState)
      : super(ChatState(
          messages: [],
          user: User(id: _globalState.userId!),
        ));

  final GlobalState _globalState;

  void sendMessage(Message message) {
    _addMessage(message);
  }

  void _addMessage(Message message) {
    state = state.copyWith(
      messages: [...state.messages, message],
    );
  }
}
