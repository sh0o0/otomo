import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/l10n/app_localizations.dart';
import 'package:otomo/constants/locales.dart';
import 'package:otomo/view_models/otomo_profile.dart';
import 'package:otomo/views/bases/forms/rounded_dropdown_buttom_form_field.dart';
import 'package:otomo/views/bases/forms/text_field_label.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/chat/otomo_avatar.dart';
import 'package:otomo/views/utils/localizations.dart';

class OtomoProfilePage extends ConsumerWidget {
  const OtomoProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(otomoProfileVMProvider);
    final notifier = ref.read(otomoProfileVMProvider.notifier);

    final language = state.value?.profile.language;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(context.l10n.otomoProfilePageTitle),
        actions: const [CloseButton()],
      ),
      body: EdgeLayout(
        child: Column(
          children: [
            const OtomoAvatar(radius: 48),
            Spaces.h8,
            TitleMedium(context.l10n.otomo),
            Spaces.h24,
            TextFieldLabel(label: context.l10n.speakLanguage),
            RoundedDropdownButtonFormField(
              value: language?.isNotEmpty == true ? Locale(language!) : null,
              items: AppLocalizations.supportedLocales
                  .where((e) => _languageMapping[e.languageCode] != null)
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(_languageMapping[e.languageCode]!),
                    ),
                  )
                  .toList(),
              onChanged: (value) =>
                  notifier.updateLanguage(value!.languageCode),
            ),
          ],
        ),
      ),
    );
  }
}

final Map<String?, String> _languageMapping = {
  Locales.ja.languageCode: '日本語',
  Locales.en.languageCode: 'English',
};
