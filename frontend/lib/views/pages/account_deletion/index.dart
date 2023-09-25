import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/view_models/account_deletion.dart';
import 'package:otomo/views/bases/layouts/side_space_layout.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';

class AccountDeletionPage extends HookConsumerWidget {
  const AccountDeletionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'アカウント削除',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SideSpaceLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spaces.h16,
            Text(
              'アカウントが削除されます。',
              style: theme.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Spaces.h16,
            const Text(
                '''アカウントを削除すると、あなたのすべてデータが削除されます。その後、同じメールアドレスやソーシャルログインで再度会員登録していただきましてもアカウトのデータは復元できませんのでご注意ください。
また、削除されたアカウントについては、Otomo運営事務局のサポート外となります'''),
            Spaces.h40,
            Center(
              child: TappableText(
                'アカウント削除',
                onTap: () =>
                    ref.read(accountDeletionProvider.notifier).deleteAccount(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: appTheme?.dangerColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: appTheme?.dangerColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
