import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceOpenNow extends StatelessWidget {
  const PlaceOpenNow({
    super.key,
    required this.openNow,
  });

  final bool openNow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>()!;
    return Column(
      children: [
        const TitleSmall('Hours'),
        BodyLarge(
          openNow ? 'Open' : 'Closed',
          style: TextStyle(
            color: openNow ? appTheme.activeColor : appTheme.dangerColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
