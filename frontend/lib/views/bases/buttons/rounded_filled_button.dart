import 'package:flutter/material.dart';

class RoundedFilledButton extends StatelessWidget {
  const RoundedFilledButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
