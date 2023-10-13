import 'package:flutter/material.dart';

class RoundedFilledButton extends StatelessWidget {
  const RoundedFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.style,
    this.verticalExpanded = false,
  });

  RoundedFilledButton.large({
    super.key,
    required this.onPressed,
    required this.child,
    this.verticalExpanded = false,
  }) : style = FilledButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        );

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final bool verticalExpanded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: verticalExpanded ? double.infinity : null,
      child: FilledButton(
        style: style,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
