import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space({
    super.key,
    this.height = 0,
    this.width = 0,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
