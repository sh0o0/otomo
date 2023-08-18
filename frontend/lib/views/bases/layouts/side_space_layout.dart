import 'package:flutter/material.dart';

class SideSpaceLayout extends StatelessWidget {
  const SideSpaceLayout({
    super.key,
    required this.child,
    this.sidePadding = 16.0,
  });

  final double sidePadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sidePadding),
      child: child,
    );
  }
}
