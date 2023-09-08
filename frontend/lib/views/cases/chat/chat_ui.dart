import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
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
    this.onTapCustomText,
  });

  final List<types.Message> messages;
  final types.User user;
  final void Function(types.PartialText) onSendPressed;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;
  final void Function(BuildContext context, types.Message)? onMessageTap;
  final void Function(CustomText text)? onTapCustomText;

  Color _getBubbleColor(BuildContext context, types.Message message) {
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;
    final bool active = message.metadata?['active'] == true;

    if (message.author == user) {
      if (active) return chatTheme.primaryColor.withOpacity(0.5);
      return chatTheme.primaryColor;
    }
    if (active) return chatTheme.secondaryColor.withOpacity(0.5);
    return chatTheme.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;

    return Chat(
      messages: messages,
      onSendPressed: onSendPressed,
      user: user,
      theme: chatTheme,
      emptyState: emptyState,
      onEndReached: onEndReached,
      onMessageTap: onMessageTap,
      bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(chatTheme.messageBorderRadius),
            color: _getBubbleColor(context, message),
          ),
          child: child,
        );
      },
      textMessageOptions: TextMessageOptions(matchers: [
        MatchText(
          pattern: CustomText.regExpPattern,
          onTap: (text) {
            final customText = CustomText(text);
            onTapCustomText?.call(customText);
          },
          style: theme.textTheme.bodyLarge
              ?.copyWith(color: theme.colorScheme.primary),
          renderText: ({required str, required pattern}) {
            final customText = CustomText(str);
            return {'display': customText.text};
          },
        ),
      ]),
    );
  }
}

class CustomText {
  CustomText._({
    required this.text,
    required this.data,
  });

  static const regExpPattern = r'%\[(.*?)\]\((.*?)\)';
  static final regExp = RegExp(regExpPattern);

  factory CustomText(String str) {
    final match = regExp.firstMatch(str);
    if (match == null) return CustomText._(text: '', data: {});

    final text = match.group(1);
    final data = jsonDecode(match.group(2) ?? '{}');

    return CustomText._(text: text ?? '', data: data);
  }

  final String text;
  final Map<String, dynamic> data;

  @override
  String toString() => 'CustomChatText(text: $text, data: $data)';
}
