import 'package:flutter/material.dart';
import 'package:otomo/views/bases/bottom_sheets/bottom_sheet_bar_handle.dart';
import 'package:otomo/views/bases/bottom_sheets/bottom_sheet_leading.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/online_status.dart';
import 'package:otomo/views/cases/chat/otomo_avatar.dart';

class ChatBottomSheetBar extends StatelessWidget {
  const ChatBottomSheetBar({
    super.key,
    this.onPressedLeading,
  });

  final VoidCallback? onPressedLeading;

  Widget _buildLeft(BuildContext context) {
    return Row(
      children: [
        BottomSheetLeading(onPressedLeading: onPressedLeading),
        Spaces.w8,
        const OtomoAvatar(),
        Spaces.w8,
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Otomo'),
            OnlineStatus(online: true),
          ],
        )
      ],
    );
  }

  Widget _buildRight(BuildContext context) {
    return Spaces.zero;
  }

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
      child: Column(
        children: [
          Spaces.h8,
          const BottomSheetBarHandle(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLeft(context),
              _buildRight(context),
            ],
          ),
        ],
      ),
    );
  }
}
