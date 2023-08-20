import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/tools/global_state.dart';

class _ChatState {
  _ChatState({
    required this.messages,
    required this.user,
  });

  final List<types.Message> messages;
  final types.User user;
}

class ChatViewModel extends StateNotifier<_ChatState> {
  ChatViewModel(this._globalState)
      : super(_ChatState(
          messages: [],
          user: types.User(id: _globalState.userId!),
        ));

  final GlobalState _globalState;

  void sendMessage(types.Message message) {
    _addMessage(message);
  }

  void _addMessage(types.Message message) {
    state = _ChatState(
      messages: [...state.messages, message],
      user: state.user,
    );
  }
}
