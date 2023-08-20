import 'package:flutter/material.dart';
import 'package:otomo/views/bases/indicators/sized_circle_progress_indicator.dart';
import 'package:otomo/views/bases/screens/screen_barrier.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';

class ScaffoldWithBarrierIndicator extends StatelessWidget {
  const ScaffoldWithBarrierIndicator({
    super.key,
    required this.body,
    this.isProcessing = false,
  });

  final bool isProcessing;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(body: body),
        isProcessing
            ? const ScreenBarrier(child: SizedCircleIndicator())
            : Spaces.zero,
      ],
    );
  }
}
