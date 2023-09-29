import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/sign_in.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';
import 'package:otomo/views/bases/layouts/side_space_layout.dart';
import 'package:otomo/views/bases/spaces/space.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/text_fields/rounded_text_form_field.dart';
import 'package:otomo/views/bases/text_fields/text_field_label.dart';
import 'package:otomo/views/bases/text_fields/unfocus.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/flutter.dart';

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
        appBar: AppBar(automaticallyImplyLeading: true),
        body: SideSpaceLayout(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleLarge('Continue with email'),
                Spaces.h40,
                const TextFieldLabel(label: 'Email'),
                Form(
                  key: _formKey,
                  child: RoundedTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'メールアドレス',
                      onChanged: (value) => setState(() => _email = value),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'メールアドレスを入力してください。'),
                          EmailValidator(errorText: 'メールアドレスが正しくありません。'),
                        ],
                      )),
                ),
                const Space(height: 80),
                RoundedFilledButton.large(
                  verticalExpanded: true,
                  onPressed: _email.isEmpty
                      ? null
                      : () async {
                          if (!validateAndSaveForm(_formKey)) return;
                          await ref
                              .read(signInProvider.notifier)
                              .sendSignInEmailLink(_email);
                        },
                  child: const Text('認証メールを送信'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
