import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:otomo/views/bases/text_fields/rounded_text_form_field.dart';

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
    final theme = Theme.of(context);

    return Chat(
      messages: widget.messages,
      onSendPressed: widget.onSendPressed,

      user: widget.user,
      theme: DefaultChatTheme(
        primaryColor: theme.primaryColor,
        secondaryColor: theme.primaryColor,
        backgroundColor: theme.colorScheme.background,
        sendButtonIcon: Icon(Icons.send_rounded, color: theme.primaryColor),
        inputTextStyle: theme.textTheme.bodyMedium!,
        inputTextColor: theme.textTheme.bodyMedium!.color!,
        inputBorderRadius: BorderRadius.zero,
        inputBackgroundColor: theme.colorScheme.background,
        inputContainerDecoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: theme.dividerColor),
          ),
        ),
        inputTextDecoration: RoundedTextFormField.inputDecoration,
      ),
    );
  }
}
