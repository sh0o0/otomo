import 'package:flutter/material.dart';

class BottomSheetBarHandle extends StatelessWidget {
  const BottomSheetBarHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).dividerColor;

    return Container(
      height: 6,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100000),
      ),
    );
  }
}
