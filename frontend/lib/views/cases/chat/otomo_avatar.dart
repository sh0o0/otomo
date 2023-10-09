import 'package:flutter/material.dart';
import 'package:otomo/constants/asset_paths.dart';

class OtomoAvatar extends StatelessWidget {
  const OtomoAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: AssetImage(AssetPaths.logos.logo),
    );
  }
}
