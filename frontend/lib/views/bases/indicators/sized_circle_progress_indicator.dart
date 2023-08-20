import 'package:flutter/material.dart';

class SizedCircleIndicator extends StatelessWidget {
  const SizedCircleIndicator({
    Key? key,
    this.height = 30,
    this.width = 30,
    this.strokeWidth = 3,
  }) : super(key: key);

  final double height;
  final double width;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
