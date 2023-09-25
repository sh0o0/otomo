import 'package:flutter/material.dart';

class TappableText extends StatelessWidget {
  const TappableText(
    this.text, {
    super.key,
    required this.onTap,
    this.style,
  });

  final String text;
  final VoidCallback onTap;
  final TextStyle? style;

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.copyWith(
            decoration: TextDecoration.underline,
          );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text, style: styleOf(context)?.merge(style)),
    );
  }
}
