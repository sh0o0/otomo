import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/tools/logger.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({
    super.key,
    required this.messages,
    required this.user,
    required this.onSendPressed,
    this.emptyState,
    this.onEndReached,
  });

  final List<types.Message> messages;
  final types.User user;
  final void Function(types.PartialText) onSendPressed;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;

    return Chat(
      messages: widget.messages,
      onSendPressed: widget.onSendPressed,
      user: widget.user,
      theme: chatTheme,
      emptyState: widget.emptyState,
      onEndReached: widget.onEndReached,
      textMessageOptions: TextMessageOptions(matchers: [
        MatchText(
          pattern: CustomChatText.regExpPattern,
          onTap: (text) {
            final customChatText = CustomChatText(text);
            logger.debug('customChatText: $customChatText');
          },
          style: theme
              .textTheme
              .bodyLarge
              ?.copyWith(color: theme.colorScheme.primary),
          renderText: ({required str, required pattern}) {
            final customChatText = CustomChatText(str);
            return {'display': customChatText.text};
          },
        ),
      ]),
    );
  }
}

class CustomChatText {
  CustomChatText._({
    required this.text,
    required this.data,
  });

  static const regExpPattern = r'%\[(.*?)\]\((.*?)\)';
  static final regExp = RegExp(regExpPattern);

  factory CustomChatText(String str) {
    final match = regExp.firstMatch(str);
    if (match == null) return CustomChatText._(text: '', data: {});

    final text = match.group(1);
    final data = jsonDecode(match.group(2) ?? '{}');

    return CustomChatText._(text: text ?? '', data: data);
  }

  final String text;
  final Map<String, dynamic> data;

  @override
  String toString() => 'CustomChatText(text: $text, data: $data)';
}
