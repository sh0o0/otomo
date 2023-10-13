import 'package:flutter/material.dart';
import 'package:otomo/constants/asset_paths.dart';

abstract class TextLogo extends StatelessWidget {
  const TextLogo({
    super.key,
  });

  const factory TextLogo.large() = _Large;

  double getWidth(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPaths.logos.textLogoBlack,
      width: getWidth(context),
    );
  }
}

class _Large extends TextLogo {
  const _Large();

  @override
  double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.8;
}
