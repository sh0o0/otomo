import 'package:flutter/material.dart';

class EdgeLayout extends StatelessWidget {
  const EdgeLayout({
    super.key,
    this.side = 16.0,
    this.bottom,
    this.top = 16.0,
    required this.child,
  });

  final double side;
  final double? bottom;
  final double top;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final safe = MediaQuery.paddingOf(context);
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom ?? safe.bottom + 40,
        right: side,
        left: side,
      ),
      child: child,
    );
  }
}
