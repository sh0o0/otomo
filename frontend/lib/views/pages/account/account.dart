import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/view_models/user.dart';
import 'package:settings_ui/settings_ui.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context).extension<AppTheme>();
    final user = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: SettingsList(
        lightTheme: appTheme?.settingsTheme,
        sections: [
          SettingsSection(
            title: const Text('Account'),
            tiles: [
              SettingsTile(
                leading: const Icon(Icons.email),
                title: const Text('メールアドレス', style: TextStyle(fontSize: 12)),
                value: Text(user?.email ?? '',
                    style: const TextStyle(fontSize: 14)),
              ),
            ],
          ),

          // # Profile
          // language

          // # About
          // Privacy policy
          // Terms of service
          // Acknowledgements

          // Sign Out
          SettingsSection(
            tiles: [
              SettingsTile(
                title: Text(
                  'ログアウト',
                  style: TextStyle(
                    color: appTheme?.dangerColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: (_) => ref.read(authProvider.notifier).signOut(),
              ),
            ],
          ),

          // version

          // # Danger area
          // Delete account
        ],
      ),
    );
  }
}
