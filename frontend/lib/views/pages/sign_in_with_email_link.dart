import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/sign_in_with_email_link.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/spaces/space.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/forms/rounded_text_form_field.dart';
import 'package:otomo/views/bases/forms/text_field_label.dart';
import 'package:otomo/views/bases/forms/unfocus.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/inform/inform_dialog.dart';
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
    final size = MediaQuery.of(context).size;
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          shape: const Border(),
        ),
        body: EdgeLayout(
          side: size.width * 0.1,
          child: Center(
            child: SizedBox(
              width: size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleLarge('メールアドレスでサインイン'),
                  Spaces.h40,
                  const TextFieldLabel(label: 'メールアドレス'),
                  Form(
                    key: _formKey,
                    child: RoundedTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'abc@example.com',
                      onChanged: (value) => setState(() => _email = value),
                      onSaved: (value) => setState(() => _email = value!),
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'メールアドレスを入力してください。'),
                          EmailValidator(errorText: 'メールアドレスが正しくありません。'),
                        ],
                      ),
                    ),
                  ),
                  const Space(height: 80),
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
                                btnOkText: 'OK',
                                btnOkOnPress: () {},
                                body: const BodyMedium(
                                    'メールアドレスに認証リンクをお送りしましたので、リンクをタップして認証を完了してください。\n\n※ メールが届いてない場合、迷惑メールボックスに入っている、もしくは、メールアドレスが間違っている可能性があります。'),
                              ).show();
                            });
                          },
                    child: const Text('認証メールを送信'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
