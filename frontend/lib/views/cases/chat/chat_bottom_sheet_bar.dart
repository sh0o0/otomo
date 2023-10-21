import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
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
    this.onOtomoTapped,
    this.remainingMessageSendCount,
  });

  final VoidCallback? onLeadingPressed;
  final VoidCallback? onOtomoTapped;
  final RemainingMessageSendCount? remainingMessageSendCount;

  Widget _buildLeft(BuildContext context) {
    return GestureDetector(
      onTap: onOtomoTapped,
      child: Row(
        children: [
          Spaces.w16,
          GestureDetector(
            onTap: onOtomoTapped,
            child: const OtomoAvatar(),
          ),
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
      ),
    );
  }

  Widget _buildRight(BuildContext context) {
    final remainingCount = remainingMessageSendCount;
    if (remainingCount == null) {
      return Spaces.zero;
    }

    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildLimitCount(
                  context: context,
                  text: context.l10n
                      .chatDailyLimitCount(remainingCount.daily.count),
                  countPattern: remainingCount.daily.count.toString(),
                ),
                _buildLimitCount(
                  context: context,
                  text: context.l10n.chatMonthlySurplusLimitCount(
                      remainingCount.monthlySurplus.count),
                  countPattern: remainingCount.monthlySurplus.count.toString(),
                ),
              ],
            ),
          ),
          BottomSheetLeading(onPressedLeading: onLeadingPressed),
        ],
      ),
    );
  }

  Widget _buildLimitCount({
    required BuildContext context,
    required String text,
    required String countPattern,
  }) {
    return ParsedText(
      text: text,
      style: BodySmall.styleOf(context),
      alignment: TextAlign.end,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      parse: [
        MatchText(
          pattern: countPattern.toString(),
          style: TextStyles.bold,
        )
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
