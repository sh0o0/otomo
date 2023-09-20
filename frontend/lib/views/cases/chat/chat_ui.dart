import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/entities/custom_text.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/utils/converter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChatUI extends StatelessWidget {
  const ChatUI({
    super.key,
    required this.messages,
    required this.onSendPressed,
    required this.user,
    this.emptyState,
    this.onEndReached,
    this.onMessageTap,
    this.onCustomTextTap,
    this.hideBottomSheet = false,
    this.inputOptions = const InputOptions(),
  });

  final List<TextMessageData> messages;
  final void Function(String) onSendPressed;
  final Author user;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;
  final void Function(BuildContext context, MessageData message)? onMessageTap;
  final void Function(CustomText text)? onCustomTextTap;
  final bool hideBottomSheet;
  final InputOptions inputOptions;

  Color _getBubbleColor(BuildContext context, types.Message m) {
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;
    final message = ViewConverter.I.message.viewToData(m);

    if (message.author.isUser) {
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
      messages: ViewConverter.I.message.textDataToViewList(messages),
      onSendPressed: (message) => onSendPressed(message.text),
      user: types.User(id: user.id),
      theme: chatTheme,
      emptyState: emptyState,
      onEndReached: onEndReached,
      onMessageTap: (context, m) =>
          onMessageTap?.call(context, ViewConverter.I.message.viewToData(m)),
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
      inputOptions: inputOptions,
      customBottomWidget: hideBottomSheet ? Spaces.zero : null,
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
