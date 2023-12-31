import 'package:flutter/material.dart';
import 'package:otomo/views/utils/flutter.dart';

class Unfocus extends StatelessWidget {
  const Unfocus({
    super.key,
    this.tap = true,
    required this.child,
  });

  final bool tap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap ? () => FlutterUtils.unfocus(context) : null,
      child: child,
    );
  }
}
