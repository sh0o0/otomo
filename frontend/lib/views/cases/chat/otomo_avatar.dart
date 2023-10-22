import 'package:flutter/material.dart';
import 'package:otomo/constants/asset_paths.dart';

class OtomoAvatar extends StatelessWidget {
  const OtomoAvatar({
    super.key,
    this.radius = 20,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: AssetImage(AssetPaths.logos.logo),
      radius: radius,
    );
  }
}
