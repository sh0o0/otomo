import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otomo/views/bases/layouts/safe_area_layout.dart';
import 'package:otomo/views/bases/screens/app_scaffold.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      body: SafeAreaLayout(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Otomo', style: theme.textTheme.displayLarge),
              Spaces.h40,
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
    );
  }
}
