import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/localizations.dart';

class OnlineStatusBadge extends StatelessWidget {
  const OnlineStatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = Theme.of(context).colorScheme;
    final activeColor = theme.extension<AppTheme>()!.activeColor;
    return Container(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(10000),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Container(
        decoration: BoxDecoration(
          color: activeColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10000),
        ),
        child: BodySmall(
          context.l10n.online,
          style: TextStyle(
            color: activeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
