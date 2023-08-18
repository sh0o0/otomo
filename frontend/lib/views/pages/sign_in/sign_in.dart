import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/viewmodels/sign_in/sign_in.dart';
import 'package:otomo/views/bases/layouts/safe_area_layout.dart';
import 'package:otomo/views/bases/layouts/side_space_layout.dart';
import 'package:otomo/views/bases/screens/app_scaffold.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/cases/buttons/sign_in_button.dart';
import 'package:otomo/views/router.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return AppScaffold(
      body: SafeAreaLayout(
        child: SideSpaceLayout(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Otomo', style: theme.textTheme.displayLarge),
                Spaces.h40,
                GoogleSignInButton(
                  text: 'Continue with Google',
                  onPressed: () =>
                      ref.read(signInProvider.notifier).signInWithGoogle(),
                ),
                Spaces.h24,
                TappableText(
                  'Continue with email',
                  textStyle: theme.textTheme.bodyLarge?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  onTap: () => context.push(Routes.signInWithEmailLink),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
