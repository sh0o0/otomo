import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/view_models/account_deletion.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/warn/warn_text.dart';
import 'package:otomo/views/utils/localizations.dart';

class AccountDeletionPage extends HookConsumerWidget {
  const AccountDeletionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>();

    final state = ref.watch(accountDeletionProvider);
    final notifier = ref.read(accountDeletionProvider.notifier);
    final requiresRecentLogin = state.value?.requiresRecentLogin ?? false;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: TitleMedium(
          context.l10n.accountDeletionPageTitle,
          style: TextStyles.bold,
        ),
      ),
      body: EdgeLayout(
        child: Column(
          children: [
            Spaces.h16,
            Align(
              alignment: Alignment.centerLeft,
              child: TitleSmall(
                context.l10n.accountDeletionPageWarn,
                style: TextStyles.bold,
              ),
            ),
            Spaces.h16,
            BodyMedium(context.l10n.accountDeletionPageExplanation),
            Spaces.h40,
            Center(
              child: TappableText(
                context.l10n.accountDeletion,
                onTap: requiresRecentLogin
                    ? () {}
                    : () => notifier.deleteAccount(),
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
              onTap: () => notifier.reauthenticate(),
              child: WarnText(
                requiresRecentLogin
                    ? context.l10n.errorRequiresRecentLogin
                    : null,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: WarnText.colorOf(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
