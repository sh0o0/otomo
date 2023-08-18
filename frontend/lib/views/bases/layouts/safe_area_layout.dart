import 'package:flutter/material.dart';

class SafeAreaLayout extends StatelessWidget {
  const SafeAreaLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}
