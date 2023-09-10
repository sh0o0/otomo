import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/models/message.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
      textMessageOptions: TextMessageOptions(
        isTextSelectable: false,
        onLinkPressed: launchUrlString,
        matchers: [
          MatchText(
            pattern: CustomText.regExp.pattern,
            onTap: (text) {
              final customText = CustomText.fromFirstMatch(text);
              onTapCustomText?.call(customText);
            },
            renderWidget: ({required pattern, required text}) {
              final customText = CustomText.fromFirstMatch(text);
              return RichText(
                text: TextSpan(
                  text: customText.text,
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.primary),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
