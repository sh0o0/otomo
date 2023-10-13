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
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      color: AppColors.barrierColor,
      child: child,
    );
  }
}
