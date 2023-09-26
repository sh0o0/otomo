import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class WarnText extends StatelessWidget {
  const WarnText(
    this.warn, {
    super.key,
    this.style,
    this.showIcon = true,
  });

  final String? warn;
  final TextStyle? style;
  final bool showIcon;

  static TextStyle? styleOf(BuildContext context) =>
      BodyMedium.styleOf(context)?.copyWith(
        color: Theme.of(context).colorScheme.errorContainer,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    final textStyle = styleOf(context)?.merge(style);
    final warnText = warn;

    return warnText == null
        ? Spaces.zero
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showIcon)
                Icon(
                  Icons.warning_rounded,
                  color: textStyle?.color,
                  size: 18,
                ),
              if (showIcon) Spaces.w4,
              BodyMedium(warnText, style: textStyle),
            ],
          );
  }
}
