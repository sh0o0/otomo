import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as ui;
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/constants/locales.dart';
import 'package:otomo/domains/entities/message.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/converter.dart';
import 'package:otomo/views/utils/launcher.dart';

class ChatUI extends StatelessWidget {
  const ChatUI({
    super.key,
    required this.messages,
    required this.onSendPressed,
    required this.user,
    this.emptyState,
    this.onEndReached,
    this.onMessageTap,
    this.onPlaceTextTap,
    this.inputOptions = const ui.InputOptions(),
    this.onBackgroundTap,
    this.customBottomWidget,
    this.showStatusPopup,
    this.statusPopupBuilder,
    this.isLastPage = false,
  }) : assert(showStatusPopup == null || statusPopupBuilder != null);

  final List<TextMessageData> messages;
  final void Function(String) onSendPressed;
  final Author user;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;
  final void Function(BuildContext context, MessageData message)? onMessageTap;
  final void Function(ExtractedPlace)? onPlaceTextTap;
  final ui.InputOptions inputOptions;
  final VoidCallback? onBackgroundTap;
  final Widget? customBottomWidget;
  final bool Function(MessageData)? showStatusPopup;
  final Widget Function(BuildContext context, MessageData message)?
      statusPopupBuilder;
  final bool isLastPage;

  Widget _buildBubble(
    BuildContext context, {
    required Widget child,
    required types.Message message,
  }) {
    final messageData = ViewConverter.I.message.viewToData(message);
    final theme = Theme.of(context);
    final chatTheme = theme.extension<AppTheme>()!.chatTheme;
    final showStatus = messageData.author.isUser ||
        messageData.status == MessageStatus.error ||
        messageData.status == MessageStatus.sending;
    final isUser = messageData.author.isUser;

    late final Color color;
    if (messageData.author.isUser) {
      color = chatTheme.primaryColor;
    } else {
      color = chatTheme.secondaryColor;
    }

    Widget statusWidget = Padding(
      padding: isUser
          ? const EdgeInsets.only(left: 8, bottom: 4)
          : const EdgeInsets.only(right: 8, bottom: 4),
      child: ui.MessageStatus(status: message.status),
    );

    if (showStatusPopup?.call(messageData) == true) {
      statusWidget = CustomPopupMenu(
        pressType: PressType.singleClick,
        showArrow: false,
        menuBuilder: () => statusPopupBuilder!.call(context, messageData),
        child: statusWidget,
      );
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (showStatus && !isUser) statusWidget,
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(chatTheme.messageBorderRadius),
              color: color,
            ),
            constraints: BoxConstraints(
              maxWidth:
                  showStatus ? constraints.maxWidth - 20 : constraints.maxWidth,
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
    });
  }

  List<MatchText> _makeTextMatchers(BuildContext context, String messageId) {
    final theme = Theme.of(context);
    final message = messages.firstWhere((e) => e.message.id == messageId);
    final placeEx = message.placeExtraction;

    return placeEx.places.map((e) {
      final hasPlace = e.geocodedPlace != null;
      return MatchText(
        pattern: e.text,
        onTap: hasPlace ? (_) => onPlaceTextTap?.call(e) : (_) {},
        renderWidget: ({required pattern, required text}) {
          return RichText(
            text: TextSpan(
              text: text,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: hasPlace
                    ? theme.colorScheme.primary
                    : TextStyles.disabled(context)?.color,
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final chatTheme = Theme.of(context).extension<AppTheme>()!.chatTheme;
    return ui.Chat(
      l10n: const ChatL10nJa(),
      dateLocale: Locales.ja.languageCode,
      messages: ViewConverter.I.message.textDataToViewList(messages),
      onSendPressed: (message) => onSendPressed(message.text),
      isLastPage: isLastPage,
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
          onLinkPressed: Launcher.urlString,
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

@immutable
class ChatL10nJa extends ui.ChatL10n {
  const ChatL10nJa({
    super.attachmentButtonAccessibilityLabel = 'メディアを送信',
    super.emptyChatPlaceholder = 'メッセージはありません',
    super.fileButtonAccessibilityLabel = 'ファイル',
    super.inputPlaceholder = 'メッセージ',
    super.sendButtonAccessibilityLabel = '送信',
    super.unreadMessagesLabel = '未読メッセージ',
  });
}
