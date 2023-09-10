import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/view_models/boundary/message.dart';
import 'package:otomo/views/utils/converter.dart';

class OtomoChatUI extends StatelessWidget {
  const OtomoChatUI({
    super.key,
    required this.messages,
    required this.onSendPressed,
    this.emptyState,
    this.onEndReached,
    this.onMessageTap,
    this.textMessageOptions = const TextMessageOptions(),
  });

  static final user = Converter.roleToChatUser(Role.user);
  static final otomo = Converter.roleToChatUser(Role.otomo);

  final List<TextMessageData> messages;
  final void Function(types.PartialText) onSendPressed;
  final Widget? emptyState;
  final Future<void> Function()? onEndReached;
  final void Function(BuildContext context, types.Message)? onMessageTap;
  final TextMessageOptions textMessageOptions;

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
    final chatTheme = Theme.of(context).extension<AppChatTheme>()!.chatTheme;

    return Chat(
      messages: Converter.textMessageDataToChatTextMessageList(messages),
      onSendPressed: onSendPressed,
      user: user,
      theme: chatTheme,
      emptyState: emptyState,
      onEndReached: onEndReached,
      onMessageTap: onMessageTap,
      textMessageOptions: textMessageOptions,
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
