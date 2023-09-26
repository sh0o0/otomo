import 'package:settings_ui/settings_ui.dart';

class AppSettingsTile extends SettingsTile {
  AppSettingsTile({
    super.key,
    super.leading,
    super.trailing,
    super.value,
    required super.title,
    super.description,
    super.onPressed,
    super.enabled = true,
  });
}
