import 'package:flutter/material.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppCircularProgressIndicator(),
      ),
    );
  }
}
