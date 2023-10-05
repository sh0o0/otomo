import 'package:flutter/material.dart';

class EdgeLayout extends StatelessWidget {
  const EdgeLayout({
    super.key,
    this.side = 16.0,
    this.bottom,
    this.top = 16.0,
    this.sliver = false,
    this.child,
  });

  final double side;
  final double? bottom;
  final double top;
  final bool sliver;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final safe = MediaQuery.paddingOf(context);
    final padding = EdgeInsets.only(
      top: top,
      bottom: bottom ?? safe.bottom + 40,
      right: side,
      left: side,
    );
    if (sliver) return SliverPadding(padding: padding, sliver: child);
    return Padding(padding: padding, child: child);
  }
}
