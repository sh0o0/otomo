import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithOnlyBackButton extends StatelessWidget {
  const ScaffoldWithOnlyBackButton({
    super.key,
    required this.body,
    this.onPressedBackButton,
  });

  final Widget body;
  final VoidCallback? onPressedBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          body,
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: onPressedBackButton ?? () => context.pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
