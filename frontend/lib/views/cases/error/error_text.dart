import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class ErrorText extends StatelessWidget {
  const ErrorText(
    this.error, {
    super.key,
    this.style,
    this.padding = EdgeInsets.zero,
  });

  final String? error;
  final TextStyle? style;
  final EdgeInsets padding;

  static TextStyle? styleOf(BuildContext context) =>
      BodyLarge.styleOf(context)?.copyWith(
        color: Theme.of(context).colorScheme.error,
      );

  @override
  Widget build(BuildContext context) {
    final err = error;

    return err == null
        ? Spaces.zero
        : Padding(
            padding: padding,
            child: Text(err, style: styleOf(context)?.merge(style)),
          );
  }
}
