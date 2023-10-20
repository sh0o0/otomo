import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/router.dart';
import 'package:otomo/view_models/sign_in.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/screens/scaffold_with_barrier_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/cases/logo/text_logo.dart';
import 'package:otomo/views/cases/sign_in/sign_in_button.dart';
import 'package:otomo/views/routes.dart';
import 'package:otomo/views/utils/error_library.dart';
import 'package:otomo/views/utils/localizations.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInProvider);
    final notifier = ref.watch(signInProvider.notifier);
    final router = ref.watch(routerProvider);

    return IndicatorOverlay(
      isProcessing: state.isLoading,
      child: Scaffold(
        body: SafeArea(
          child: EdgeLayout(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextLogo.large(),
                  Spaces.h40,
                  GoogleSignInButton(
                    text: context.l10n.signInWithGoogle,
                    onPressed: () => notifier.signInWithGoogle(),
                  ),
                  if (!Platform.isAndroid)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AppleSignInButton(
                        text: context.l10n.signInWithApple,
                        onPressed: () => notifier.signInWithApple(),
                      ),
                    ),
                  Spaces.h32,
                  TappableText(context.l10n.signInWithEmail,
                      onTap: () => router.push(Routes.signInWithEmailLink)),
                  Visibility(
                    visible: state.hasError,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: ErrorText(
                          ErrorLibrary.fromAnyOf(context, state.error ?? '')),
                    ),
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
