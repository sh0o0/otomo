import 'package:flutter/material.dart';
import 'package:otomo/configs/app_colors.dart';

class ScreenBarrier extends StatelessWidget {
  const ScreenBarrier({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Container(
      height: mediaSize.height,
      width: mediaSize.width,
      color: AppColors.barrierColor,
      child: child,
    );
  }
}
