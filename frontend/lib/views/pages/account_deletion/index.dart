import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/view_models/account_deletion.dart';
import 'package:otomo/views/bases/layouts/side_space_layout.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/warn/warn_text.dart';

class AccountDeletionPage extends HookConsumerWidget {
  const AccountDeletionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();

    final state = ref.watch(accountDeletionProvider);
    final requiresRecentLogin = state.value?.requiresRecentLogin ?? false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const TitleMedium('アカウント削除', style: TextStyles.bold),
      ),
      body: SideSpaceLayout(
        child: Column(
          children: [
            Spaces.h16,
            const Align(
              alignment: Alignment.centerLeft,
              child: TitleSmall(
                'アカウントが削除されます。',
                style: TextStyles.bold,
              ),
            ),
            Spaces.h16,
            const BodyMedium(
                '''アカウントを削除すると、あなたのすべてデータが削除されます。その後、同じメールアドレスやソーシャルログインで再度会員登録していただきましてもアカウトのデータは復元できませんのでご注意ください。
また、削除されたアカウントについては、Otomo運営事務局のサポート外となります'''),
            Spaces.h40,
            Center(
              child: TappableText(
                'アカウント削除',
                onTap: requiresRecentLogin
                    ? () {}
                    : () => ref
                        .read(accountDeletionProvider.notifier)
                        .deleteAccount(),
                style: requiresRecentLogin
                    ? TextStyles.disabled(context)
                        ?.copyWith(decoration: TextDecoration.none)
                    : TextStyle(
                        color: appTheme?.dangerColor,
                        fontWeight: FontWeight.bold,
                        decorationColor: appTheme?.dangerColor,
                      ),
              ),
            ),
            Spaces.h8,
            GestureDetector(
              child: WarnText(
                requiresRecentLogin ? '再ログインが必要です。' : null,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: WarnText.colorOf(context)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
