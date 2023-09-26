import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class TappableText extends BaseText {
  const TappableText(
    super.text, {
    super.key,
    super.style,
    required this.onTap,
  });

  final VoidCallback onTap;

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            decoration: TextDecoration.underline,
          );

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: super.build(context)
    );
  }
}
