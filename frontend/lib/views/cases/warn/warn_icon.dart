import 'package:flutter/material.dart';

class WarnIcon extends StatelessWidget {
  const WarnIcon(
    this.icon, {
    super.key,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Theme.of(context).colorScheme.errorContainer);
  }
}
