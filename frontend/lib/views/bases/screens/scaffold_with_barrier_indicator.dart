import 'package:flutter/material.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/bases/screens/screen_barrier.dart';

class IndicatorOverlay extends StatelessWidget {
  const IndicatorOverlay({
    super.key,
    required this.child,
    this.isProcessing = false,
  });

  final bool isProcessing;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isProcessing)
          const ScreenBarrier(
            child: Center(child: AppCircularProgressIndicator()),
          )
      ],
    );
  }
}
