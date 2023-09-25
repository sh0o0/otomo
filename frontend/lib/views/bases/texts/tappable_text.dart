import 'package:flutter/material.dart';

class TappableText extends StatelessWidget {
  const TappableText(
    this.text, {
    super.key,
    required this.onTap,
    this.style = const TextStyle(decoration: TextDecoration.underline),
  });

  final String text;
  final VoidCallback onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text, style: style),
    );
  }
}
