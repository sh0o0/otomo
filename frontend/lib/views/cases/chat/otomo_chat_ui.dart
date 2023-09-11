import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/view_models/boundary/message.dart';
import 'package:otomo/views/utils/converter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OtomoChatUI extends StatelessWidget {
  const OtomoChatUI({
    super.key,
    required this.messages,
    required this.onSendPressed,
    this.emptyState,
    this.onEndReached,
    this.onMessageTap,
    this.textMessageOptions = const TextMessageOptions(),
    this.onCustomTextTap,
  });

  static final user = Converter.roleToChatUser(Role.user);
  static final otomo = Converter.roleToChatUser(Role.otomo);

  final List<TextMessageData> messages;
  final void Function(String) onSendPressed;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;
  final void Function(BuildContext context, MessageData message)? onMessageTap;
  final TextMessageOptions textMessageOptions;
  final void Function(CustomText text)? onCustomTextTap;

  Color _getBubbleColor(BuildContext context, types.Message m) {
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;
    final message = Converter.chatMessageToMessageData(m);

    if (message.role == Role.user) {
      if (message.active) return chatTheme.primaryColor.withOpacity(0.5);
      return chatTheme.primaryColor;
    }
    if (message.active) return chatTheme.secondaryColor.withOpacity(0.5);
    return chatTheme.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;

    return Chat(
      messages: Converter.textMessageDataToChatTextMessageList(messages),
      onSendPressed: (message) => onSendPressed(message.text),
      user: user,
      theme: chatTheme,
      emptyState: emptyState,
      onEndReached: onEndReached,
      onMessageTap: (context, m) =>
          onMessageTap?.call(context, Converter.chatMessageToMessageData(m)),
      textMessageOptions: TextMessageOptions(
        isTextSelectable: false,
        onLinkPressed: launchUrlString,
        matchers: [
          MatchText(
            pattern: CustomText.regExp.pattern,
            onTap: (text) {
              final customText = CustomText.fromFirstMatch(text);
              onCustomTextTap?.call(customText);
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
      bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(chatTheme.messageBorderRadius),
            color: _getBubbleColor(context, message),
          ),
          child: child,
        );
      },
    );
  }
}
