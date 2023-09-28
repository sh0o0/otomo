import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:settings_ui/settings_ui.dart';

class AppSettingsList extends StatelessWidget {
  const AppSettingsList({
    super.key,
    required this.sections,
  });

  final List<AbstractSettingsSection> sections;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context).extension<AppTheme>()?.settingsTheme;
    return SettingsList(
      lightTheme: appTheme,
      darkTheme: appTheme,
      sections: sections,
    );
  }
}
