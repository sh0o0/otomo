import 'package:flutter/material.dart';

class OtomoAvatar extends StatelessWidget {
  const OtomoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.black12,
        shape: BoxShape.circle,
      ),
    );
  }
}
