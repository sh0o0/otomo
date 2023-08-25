import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatModalUILeading extends StatelessWidget {
  const ChatModalUILeading({
    super.key,
    this.size = 32,
    this.onPressedLeading,
  });

  final double size;
  final VoidCallback? onPressedLeading;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      iconSize: size,
      onPressed: onPressedLeading ?? () => context.pop(),
    );
  }
}
