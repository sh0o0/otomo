import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:otomo/configs/app_themes.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({
    super.key,
    required this.messages,
    required this.user,
    required this.onSendPressed,
  });

  final List<types.Message> messages;
  final types.User user;
  final void Function(types.PartialText) onSendPressed;

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  @override
  Widget build(BuildContext context) {
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;

    return Chat(
      messages: widget.messages,
      onSendPressed: widget.onSendPressed,
      user: widget.user,
      theme: chatTheme,
    );
  }
}
