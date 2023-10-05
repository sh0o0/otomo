import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/tools/app_package_info.dart';
import 'package:otomo/view_models/user.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/danger/danger_text.dart';
import 'package:otomo/views/cases/settings/app_settings_list.dart';
import 'package:otomo/views/cases/settings/app_settings_section.dart';
import 'package:otomo/views/cases/settings/app_settings_tile.dart';
import 'package:otomo/views/router.dart';
import 'package:otomo/views/routes.dart';
import 'package:otomo/views/utils/links.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  Widget _buildSettingsList(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountProvider);
    final accountNotifier = ref.read(accountProvider.notifier);
    return AppSettingsList(
      shrinkWrap: true,
      sections: [
        AppSettingsSection(
          title: const Text('アカウント'),
          tiles: [
            AppSettingsTile(
              leading: const Icon(Icons.email),
              title: const BodySmall('メールアドレス'),
              value: Text(account?.email ?? ''),
            ),
          ],
        ),

        // # Profile
        // language

        // # About
        // Privacy policy
        // Terms of service
        // Acknowledgements

        AppSettingsSection(
          title: const Text('ヘルプ'),
          tiles: [
            AppSettingsTile(
              title: const Text('お問い合わせ'),
              leading: const Icon(Icons.question_mark_rounded),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: (_) =>
                  Launcher.inquiry(account?.uid ?? '', account?.email ?? ''),
            ),
          ],
        ),

        AppSettingsSection(
          tiles: [
            AppSettingsTile(
              title: const DangerText('ログアウト'),
              onPressed: (_) => accountNotifier.signOut(),
            ),
          ],
        ),

        // version

        // # Danger area
        AppSettingsSection(
          tiles: [
            AppSettingsTile(
                title: const DangerText('アカウント削除'),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                onPressed: (_) =>
                    ref.read(routerProvider).push(Routes.accountDeletion)),
          ],
        ),
      ],
    );
  }

  Widget _buildVersion(BuildContext context) {
    return BodySmall(
      'バージョン ${AppPackageInfo.version} (${AppPackageInfo.buildNumber})',
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TitleMedium('設定', style: TextStyles.bold),
        actions: const [CloseButton()],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildSettingsList(context, ref), _buildVersion(context)],
      ),
    );
  }
}
