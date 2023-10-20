import 'package:flutter/material.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/constants/links.dart';
import 'package:otomo/domains/entities/date.dart';
import 'package:otomo/domains/entities/user.dart';
import 'package:otomo/view_models/start_to_use.dart';
import 'package:otomo/views/bases/app_bars/leading_text.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';
import 'package:otomo/views/bases/forms/date_form_field.dart';
import 'package:otomo/views/bases/forms/text_field_label.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/screens/scaffold_with_barrier_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/flutter.dart';
import 'package:otomo/views/utils/launcher.dart';
import 'package:otomo/views/utils/localizations.dart';

class StartToUsePage extends StatefulHookConsumerWidget {
  const StartToUsePage({super.key});

  @override
  ConsumerState<StartToUsePage> createState() => _StartToUsePageState();
}

class _StartToUsePageState extends ConsumerState<StartToUsePage> {
  final _formKey = GlobalKey<FormState>();

  static const num _ageLimit = 13;

  Widget _termsCheckboxBuilder({
    required BuildContext context,
    required AsyncValue<StartToUseState> state,
    required StartToUse notifier,
  }) {
    return Row(
      children: [
        Checkbox(
          value: state.value?.isAgreed ?? false,
          onChanged: (value) => notifier.setIsAgreed(value ?? false),
        ),
        ParsedText(
          text: context.l10n.startToUsePageAgreeWithTerms(context.l10n.terms),
          style: BodyMedium.styleOf(context),
          parse: [
            MatchText(
              type: ParsedType.CUSTOM,
              pattern: context.l10n.terms,
              style: TappableText.styleOf(context),
              onTap: (_) => Launcher.urlString(Links.terms),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(startToUseProvider);
    final notifier = ref.read(startToUseProvider.notifier);

    return IndicatorOverlay(
      isProcessing: state.isLoading,
      child: Scaffold(
        appBar: AppBar(
          shape: const Border(),
          leadingWidth: 150,
          leading: LeadingText(
            text: context.l10n.signOut,
            onTap: () => notifier.signOut(),
          ),
        ),
        body: SafeArea(
          child: EdgeLayout(
            top: 0,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLarge(context.l10n.startToUsePageTitle),
                Spaces.h40,
                TextFieldLabel(label: context.l10n.birthday),
                Form(
                  key: _formKey,
                  child: DateFormField(
                    onConfirmed: (time) => notifier.setBirthday(time),
                    validator: (value) {
                      if (value == null) {
                        return context.l10n
                            .inputInvalidRequired(context.l10n.birthday);
                      }
                      final birthday = Date.fromDateTime(value);
                      if (birthday.age < _ageLimit) {
                        return context.l10n.inputInvalidLimitAge(_ageLimit);
                      }
                      return null;
                    },
                    initialValue: state.value?.birthday?.toDateTime(),
                  ),
                ),
                Spaces.h4,
                BodySmall(context.l10n.startToUsePageNoticeAgeLimit(_ageLimit)),
                const Spacer(),
                _termsCheckboxBuilder(
                  context: context,
                  state: state,
                  notifier: notifier,
                ),
                Spaces.h8,
                RoundedFilledButton.large(
                  verticalExpanded: true,
                  onPressed: state.value?.canSaveAgreements == true
                      ? () async {
                          if (!FlutterUtils.validateAndSaveForm(_formKey)) {
                            return;
                          }
                          await notifier.agree();
                        }
                      : null,
                  child: Text(context.l10n.next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
