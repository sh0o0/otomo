import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/sign_in.dart';
import 'package:otomo/views/bases/layouts/safe_area_layout.dart';
import 'package:otomo/views/bases/layouts/side_space_layout.dart';
import 'package:otomo/views/bases/screens/scaffold_with_barrier_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/sign_in/sign_in_button.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/utils/error_library.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final state = ref.watch(signInProvider);
    final notifier = ref.watch(signInProvider.notifier);

    return ScaffoldWithBarrierIndicator(
      isProcessing: state.isLoading,
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
                  onPressed: () => notifier.signInWithGoogle(),
                ),
                Spaces.h16,
                SignInButton(
                  Buttons.apple,
                  text: 'Continue with Apple',
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10000),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  clipBehavior: Clip.hardEdge,
                  onPressed: () => notifier.signInWithApple(),
                ),

                Visibility(
                  visible: state.hasError,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ErrorText(ErrorLibrary.fromAny(state.error ?? '')),
                  ),
                )
                // Spaces.h24,
                // TappableText(
                //   'Continue with email',
                //   textStyle: theme.textTheme.bodyLarge?.copyWith(
                //     decoration: TextDecoration.underline,
                //   ),
                //   onTap: () => context.push(Routes.signInWithEmailLink),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
