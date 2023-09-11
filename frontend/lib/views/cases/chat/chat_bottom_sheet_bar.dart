import 'package:flutter/material.dart';

class BottomSheetBar extends StatelessWidget {
  const BottomSheetBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.appBarTheme.shadowColor!,
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
        color: theme.colorScheme.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: theme.dividerColor, width: 1),
          ),
        ),
        child: Text(
          'Bottom Sheet Bar',
          style: theme.textTheme.bodyLarge!,
        ),
      ),
    );
  }
}
