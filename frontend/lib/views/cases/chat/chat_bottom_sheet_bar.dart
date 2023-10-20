import 'package:flutter/material.dart';
import 'package:otomo/domains/entities/message_send_count.dart';
import 'package:otomo/views/bases/bottom_sheets/bottom_sheet_bar_handle.dart';
import 'package:otomo/views/bases/bottom_sheets/bottom_sheet_leading.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/chat/online_status.dart';
import 'package:otomo/views/cases/chat/otomo_avatar.dart';
import 'package:otomo/views/utils/localizations.dart';

class ChatBottomSheetBar extends StatelessWidget {
  const ChatBottomSheetBar({
    super.key,
    this.onLeadingPressed,
    this.remainingMessageSendCount,
  });

  final VoidCallback? onLeadingPressed;
  final RemainingMessageSendCount? remainingMessageSendCount;

  Widget _buildLeft(BuildContext context) {
    return Row(
      children: [
        Spaces.w16,
        const OtomoAvatar(),
        Spaces.w8,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.otomo),
            const OnlineStatus(online: true),
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

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BodySmall(context.l10n
                .chatPageDailyLimitCount(remainingCount.daily.count)),
            BodySmall(
              context.l10n.chatPageMonthlySurplusLimitCount(
                  remainingCount.monthlySurplus.count),
            ),
          ],
        ),
        BottomSheetLeading(onPressedLeading: onLeadingPressed),
      ],
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
