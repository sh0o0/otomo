import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/online_status.dart';
import 'package:otomo/views/cases/chat/otomo_avatar.dart';

class ChatUIAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatUIAppBar({
    super.key,
    this.title,
    this.leading,
    this.online = false,
  });

  final String? title;
  final Widget? leading;
  final bool online;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.background,
      elevation: 0,
      leading: leading,
      centerTitle: true,
      shape: Border(bottom: BorderSide(color: theme.dividerColor)),
      title: Column(
        children: [
          title == null ? Spaces.zero : Text(title!),
          OnlineStatus(online: online),
        ],
      ),
      titleTextStyle: theme.textTheme.titleMedium,
      actions: const [
        // TODO: Implement avatar
        OtomoAvatar(),
        Spaces.w16,
      ],
    );
  }
}
