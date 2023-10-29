import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/sign_in_with_email_link.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';
import 'package:otomo/views/bases/forms/rounded_text_form_field.dart';
import 'package:otomo/views/bases/forms/text_field_label.dart';
import 'package:otomo/views/bases/forms/unfocus.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/inform/inform_dialog.dart';
import 'package:otomo/views/utils/flutter.dart';
import 'package:otomo/views/utils/localizations.dart';

class SignInWithEmailLinkPage extends StatefulHookConsumerWidget {
  const SignInWithEmailLinkPage({super.key});

  @override
  ConsumerState<SignInWithEmailLinkPage> createState() =>
      _SignInWithEmailLinkPageState();
}

class _SignInWithEmailLinkPageState
    extends ConsumerState<SignInWithEmailLinkPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          shape: const Border(),
        ),
        body: SafeArea(
          child: EdgeLayout(
            top: 0,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLarge(context.l10n.signInWithEmailLinkPageTitle),
                Spaces.h40,
                TextFieldLabel(label: context.l10n.email),
                Form(
                  key: _formKey,
                  child: RoundedTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'abc@example.com',
                    onChanged: (value) => setState(() => _email = value),
                    onSaved: (value) => setState(() => _email = value!),
                    validator: MultiValidator(
                      [
                        RequiredValidator(
                            errorText: context.l10n
                                .inputInvalidRequired(context.l10n.email)),
                        EmailValidator(
                            errorText:
                                context.l10n.inputInvalid(context.l10n.email)),
                      ],
                    ),
                    autofocus: true,
                  ),
                ),
                const Spacer(),
                RoundedFilledButton.large(
                  verticalExpanded: true,
                  onPressed: _email.isEmpty
                      ? null
                      : () async {
                          if (!FlutterUtils.validateAndSaveForm(_formKey)) {
                            return;
                          }
                          await ref
                              .read(signInWithEmailLinkProvider.notifier)
                              .sendSignInEmailLink(_email);
                          FlutterUtils.afterBuildCallback(() {
                            InformDialog(
                              context: context,
                              btnOkText: context.l10n.ok,
                              btnOkOnPress: () {},
                              body: BodyMedium(context
                                  .l10n.signInWithEmailLinkPageNoticeSentEmail),
                            ).show();
                          });
                        },
                  child: Text(
                      context.l10n.signInWithEmailLinkPageNoticeSendAuthEmail),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
