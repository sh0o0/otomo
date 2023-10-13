import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class LeadingText extends StatelessWidget {
  const LeadingText({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8),
        child: BodyLarge(
          text,
          style: TextStyle(
            color: colors.primary,
          ),
        ),
      ),
    );
  }
}
