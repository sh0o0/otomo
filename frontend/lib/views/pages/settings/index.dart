import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/view_models/user.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/settings/app_settings_list.dart';
import 'package:otomo/views/cases/settings/app_settings_section.dart';
import 'package:otomo/views/cases/settings/app_settings_tile.dart';
import 'package:otomo/views/router.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = Theme.of(context).extension<AppTheme>();
    final dangerTitleTextStyle = TextStyle(
      color: appTheme?.dangerColor,
      fontWeight: FontWeight.bold,
    );

    final user = ref.watch(userProvider);
    final userNotifier = ref.read(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const TitleMedium('設定', style: TextStyles.bold),
      ),
      body: AppSettingsList(
        sections: [
          AppSettingsSection(
            title: const BodyMedium('アカウント'),
            tiles: [
              AppSettingsTile(
                leading: const Icon(Icons.email),
                title: const BodySmall('メールアドレス'),
                value: BodyMedium(user?.email ?? ''),
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
          AppSettingsSection(
            tiles: [
              AppSettingsTile(
                title: BodyMedium('ログアウト', style: dangerTitleTextStyle),
                onPressed: (_) => userNotifier.signOut(),
              ),
            ],
          ),

          // version

          // # Danger area
          AppSettingsSection(
            tiles: [
              AppSettingsTile(
                  title: BodyMedium('アカウント削除', style: dangerTitleTextStyle),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onPressed: (_) =>
                      ref.read(routerProvider).push(Routes.accountDeletion)),
            ],
          ),
        ],
      ),
    );
  }
}
