import 'package:flutter/material.dart';
import 'package:otomo/views/cases/home/multi_buttons.dart';

class SampleMultiButtons extends StatelessWidget {
  const SampleMultiButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: MultiButtons(),
      ),
    );
  }
}
