import 'package:flutter/material.dart';
import 'package:otomo/entities/message_send_count.dart';
import 'package:otomo/views/bases/bottom_sheets/bottom_sheet_bar_handle.dart';
import 'package:otomo/views/bases/bottom_sheets/bottom_sheet_leading.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/chat/online_status.dart';
import 'package:otomo/views/cases/chat/otomo_avatar.dart';

class ChatBottomSheetBar extends StatelessWidget {
  const ChatBottomSheetBar({
    super.key,
    this.onPressedLeading,
    this.remainingMessageSendCount,
  });

  final VoidCallback? onPressedLeading;
  final RemainingMessageSendCount? remainingMessageSendCount;

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
    final remainingCount = remainingMessageSendCount;
    if (remainingCount == null) {
      return Spaces.zero;
    }

    final size = MediaQuery.of(context).size;

    return Flexible(
      child: Container(
        padding: const EdgeInsets.only(right: 20.0),
        width: size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BodySmall('今日の残り: ${remainingCount.daily.count} 回'),
            BodySmall(
              '今月の追加分残り: ${remainingCount.monthlySurplus.count} 回',
            ),
          ],
        ),
      ),
    );
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
