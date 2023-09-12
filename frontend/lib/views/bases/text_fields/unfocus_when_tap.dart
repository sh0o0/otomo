import 'package:flutter/material.dart';
import 'package:otomo/views/utils/controller.dart';

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
      onTap: tap ? () => ViewUtilsController.instance.unfocus(context) : null,
      child: child,
    );
  }
}
