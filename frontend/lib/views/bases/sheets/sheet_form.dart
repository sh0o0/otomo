import 'package:flutter/material.dart';

class SheetForm extends StatelessWidget {
  const SheetForm({
    super.key,
    this.backgroundColor,
    this.shadow = true,
    required this.child,
  });

  final Color? backgroundColor;
  final bool shadow;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: theme.colorScheme.shadow.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 2,
                  offset: const Offset(0, -2),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }
}
