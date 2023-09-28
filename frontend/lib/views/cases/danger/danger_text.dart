import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class DangerText extends BaseText {
  const DangerText(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium?.copyWith(
      color: theme.extension<AppTheme>()?.dangerColor,
      fontWeight: FontWeight.bold,
    );
  }

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}
