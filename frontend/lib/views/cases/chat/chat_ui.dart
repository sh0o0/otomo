import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/view_models/boundary/chat.dart';
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
    this.onStatusTap,
    this.onLocationTextTap,
    this.inputOptions = const ui.InputOptions(),
    this.onBackgroundTap,
    this.customBottomWidget,
  });

  final List<TextMessageData> messages;
  final void Function(String) onSendPressed;
  final Author user;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;
  final void Function(BuildContext context, MessageData message)? onMessageTap;
  final void Function(BuildContext context, MessageData message)? onStatusTap;
  final void Function(AnalyzedLocation)? onLocationTextTap;
  final ui.InputOptions inputOptions;
  final VoidCallback? onBackgroundTap;
  final Widget? customBottomWidget;

  Widget _buildBubble(
    BuildContext context, {
    required Widget child,
    required types.Message message,
  }) {
    final messageData = ViewConverter.I.message.viewToData(message);
    final theme = Theme.of(context);
    final chatTheme = theme.extension<AppChatTheme>()!.chatTheme;
    final size = MediaQuery.of(context).size;
    final showStatus =
        messageData.author.isUser || messageData.status != MessageStatus.sent;
    final isUser = messageData.author.isUser;

    Color? color;
    if (messageData.author.isUser) {
      color = chatTheme.primaryColor;
    } else {
      color = chatTheme.secondaryColor;
    }

    final statusWidget = GestureDetector(
      onTap: () => onMessageTap?.call(context, messageData),
      child: Padding(
        padding: isUser
            ? const EdgeInsets.only(left: 8, bottom: 4)
            : const EdgeInsets.only(right: 8, bottom: 4),
        child: ui.MessageStatus(status: message.status),
      ),
    );

    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showStatus && !isUser) statusWidget,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(chatTheme.messageBorderRadius),
            color: color,
          ),
          constraints: BoxConstraints(
            maxWidth: size.width * 0.7,
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
            children: [
              child,
              if (messageData.active)
                Animate(
                  effects: const [
                    FadeEffect(duration: Duration(milliseconds: 50))
                  ],
                  child: Positioned(
                    bottom: 0,
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 5,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (showStatus && isUser) statusWidget,
      ],
    );
  }

  List<MatchText> _makeTextMatchers(BuildContext context, String messageId) {
    final theme = Theme.of(context);
    final message = messages.firstWhere((e) => e.message.id == messageId);
    final locationAnalysis = message.locationAnalysis;

    return locationAnalysis.locations
        .map((e) => MatchText(
              pattern: e.text,
              onTap: (text) => onLocationTextTap?.call(e),
              renderWidget: ({required pattern, required text}) {
                return RichText(
                  text: TextSpan(
                    text: text,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.primary),
                  ),
                );
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;

    return ui.Chat(
      messages: ViewConverter.I.message.textDataToViewList(messages),
      onSendPressed: (message) => onSendPressed(message.text),
      user: types.User(id: user.id),
      theme: chatTheme,
      emptyState: emptyState,
      onEndReached: onEndReached,
      onMessageTap: (context, m) =>
          onMessageTap?.call(context, ViewConverter.I.message.viewToData(m)),
      textMessageBuilder: (
        textMessage, {
        required int messageWidth,
        required bool showName,
      }) =>
          ui.TextMessage(
        emojiEnlargementBehavior: ui.EmojiEnlargementBehavior.multi,
        hideBackgroundOnEmojiMessages: true,
        usePreviewData: true,
        message: textMessage,
        options: ui.TextMessageOptions(
          isTextSelectable: false,
          onLinkPressed: launchUrlString,
          matchers: _makeTextMatchers(context, textMessage.id),
        ),
        showName: showName,
      ),
      onBackgroundTap: onBackgroundTap,
      inputOptions: inputOptions,
      customBottomWidget: customBottomWidget,
      bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
        return _buildBubble(context, child: child, message: message);
      },
    );
  }
}
