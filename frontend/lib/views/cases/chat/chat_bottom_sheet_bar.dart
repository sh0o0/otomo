import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/online_status.dart';
import 'package:otomo/views/cases/chat/otomo_avatar.dart';

class ChatBottomSheetBar extends StatelessWidget {
  const ChatBottomSheetBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        border: Border(
          bottom: BorderSide(color: theme.dividerColor, width: 1),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            OtomoAvatar(),
            Spaces.w8,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Otomo'),
                OnlineStatus(online: true),
              ],
            )
          ],
        ),
      ),
    );
  }
}
