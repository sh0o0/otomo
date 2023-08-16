import 'package:flutter/material.dart';

class AppSafeArea extends StatelessWidget {
  const AppSafeArea({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}
