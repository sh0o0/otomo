import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:otomo/configs/app_themes.dart';

class ChatUI extends StatelessWidget {
  const ChatUI({
    super.key,
    required this.messages,
    required this.user,
    required this.onSendPressed,
    this.emptyState,
    this.onEndReached,
    this.onMessageTap,
  });

  final List<types.Message> messages;
  final types.User user;
  final void Function(types.PartialText) onSendPressed;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;
  final void Function(BuildContext context, types.Message)? onMessageTap;

  @override
  Widget build(BuildContext context) {
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;

    return Chat(
      messages: messages,
      onSendPressed: onSendPressed,
      user: user,
      theme: chatTheme,
      emptyState: emptyState,
      onEndReached: onEndReached,
      onMessageTap: onMessageTap,
    );
  }
}
