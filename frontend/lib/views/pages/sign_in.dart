import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/sign_in.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/screens/scaffold_with_barrier_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/cases/sign_in/sign_in_button.dart';
import 'package:otomo/views/utils/error_library.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInProvider);
    final notifier = ref.watch(signInProvider.notifier);
    // final router = ref.watch(routerProvider);

    return ScaffoldWithBarrierIndicator(
      isProcessing: state.isLoading,
      body: SafeArea(
        child: EdgeLayout(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DisplayLarge('Otomo'),
                Spaces.h40,
                GoogleSignInButton(
                  text: 'Continue with Google',
                  onPressed: () => notifier.signInWithGoogle(),
                ),
                if (!Platform.isAndroid)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: AppleSignInButton(
                      text: 'Continue with Apple',
                      onPressed: () => notifier.signInWithApple(),
                    ),
                  ),
                Spaces.h32,
                // TappableText('Continue with email',
                //     onTap: () => router.push(Routes.signInWithEmailLink)),
                Visibility(
                  visible: state.hasError,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: ErrorText(ErrorLibrary.fromAny(state.error ?? '')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
