import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/view_models/account_deletion.dart';
import 'package:otomo/view_models/user.dart';
import 'package:settings_ui/settings_ui.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context).extension<AppTheme>();
    final dangerTitleTextStyle = TextStyle(
      color: appTheme?.dangerColor,
      fontWeight: FontWeight.bold,
    );
    final dangerValueTextStyle = TextStyle(
      color: appTheme?.dangerColor,
      fontSize: 12,
    );

    final user = ref.watch(userProvider);
    final authState = ref.watch(accountDeletionProvider);
    final authNotifier = ref.read(accountDeletionProvider.notifier);

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
                title: Text('ログアウト', style: dangerTitleTextStyle),
                onPressed: (_) => authNotifier.signOut(),
              ),
            ],
          ),

          // version

          // # Danger area
          SettingsSection(
            tiles: [
              SettingsTile(
                title: Text('アカウント削除', style: dangerTitleTextStyle),
                value: (authState.value?.requiresRecentLogin ?? false)
                    ? GestureDetector(
                        onTap: () => logger.debug('message'),
                        child: Text(
                          '再ログインしてください',
                          style: dangerValueTextStyle,
                        ),
                      )
                    : null,
                onPressed: (_) => authNotifier.deleteAccount(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
