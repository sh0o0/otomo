import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otomo/views/bases/layouts/app_safe_area.dart';
import 'package:otomo/views/bases/screens/app_scaffold.dart';
import 'package:otomo/views/bases/text_fields/rounded_text_form_field.dart';

class SignInWithEmailLinkPage extends StatelessWidget {
  const SignInWithEmailLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      body: AppSafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              ),
              Text(
                'Continue with email',
                style: theme.textTheme.headlineMedium,
              ),
              RoundedTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Email',
              )
              // Button
            ],
          ),
        ),
      ),
    );
  }
}
