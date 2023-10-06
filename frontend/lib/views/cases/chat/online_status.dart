import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';

class OnlineStatus extends StatelessWidget {
  const OnlineStatus({
    super.key,
    this.online = false,
  });

  final bool online;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            // TODO: Fix color for dark theme
            color: online
                ? theme.extension<AppTheme>()!.activeColor
                : Colors.black26,
            shape: BoxShape.circle,
          ),
        ),
        Spaces.w8,
        Text(
          online ? 'Online' : 'Offline',
          style: theme.textTheme.bodyMedium,
        )
      ],
    );
  }
}
