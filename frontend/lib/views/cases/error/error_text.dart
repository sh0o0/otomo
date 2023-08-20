import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
    this.text, {
    super.key,
    this.padding = EdgeInsets.zero,
  });

  final String? text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return text == null
        ? Spaces.zero
        : Padding(
          padding: padding,
          child: Text(
              text!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
        );
  }
}
