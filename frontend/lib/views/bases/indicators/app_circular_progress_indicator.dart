import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({
    super.key,
    this.value,
  });

  final double? value;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
    );
  }
}
