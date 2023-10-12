import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:otomo/constants/links.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/bases/app_bars/leading_text.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';
import 'package:otomo/views/bases/forms/date_form_field.dart';
import 'package:otomo/views/bases/forms/text_field_label.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/launcher.dart';

class PoliciesAgreementPage extends StatelessWidget {
  const PoliciesAgreementPage({super.key});

  Widget _termsCheckboxBuilder(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text.rich(
          TextSpan(children: [
            TextSpan(
              text: '利用規約',
              style: TappableText.styleOf(context),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Launcher.urlString(Links.terms),
            ),
            const TextSpan(text: 'に同意する'),
          ]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(),
        leadingWidth: 150,
        leading: LeadingText(
          text: 'サインアウト',
          onTap: () {},
        ),
      ),
      body: SafeArea(
        child: EdgeLayout(
          top: 0,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleLarge('利用を開始'),
              Spaces.h40,
              const TextFieldLabel(label: '生年月日'),
              DateFormField(
                onConfirmed: (date) {
                  logger.debug(date.toIso8601String());
                },
                validator: RequiredValidator(errorText: '生年月日を入力してください'),
              ),
              Spaces.h4,
              const BodySmall('年齢制限のため生年月日を取得させていただきます。13歳未満の方はご利用することができません。'),
              const Spacer(),
              _termsCheckboxBuilder(context),
              Spaces.h8,
              RoundedFilledButton.large(
                onPressed: () {},
                verticalExpanded: true,
                child: const Text('次へ'),
              ),
              Spaces.h16,
            ],
          ),
        ),
      ),
    );
  }
}
