import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class ErrorText extends BaseText {
  const ErrorText(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      BodyLarge.styleOf(context)?.copyWith(
        color: Theme.of(context).colorScheme.error,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}
