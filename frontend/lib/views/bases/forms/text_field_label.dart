import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({
    super.key,
    required this.label,
    this.bottomPadding = 8,
    this.alignment = Alignment.centerLeft,
  });

  final String label;
  final double bottomPadding;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Align(
        alignment: alignment,
        child: Text(label, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
