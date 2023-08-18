import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otomo/views/bases/layouts/safe_area_layout.dart';
import 'package:otomo/views/bases/layouts/side_space_layout.dart';
import 'package:otomo/views/bases/screens/app_scaffold.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/tappable_text.dart';
import 'package:otomo/views/cases/buttons/sign_in_button.dart';
import 'package:otomo/views/router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () async {
                    // Trigger the authentication flow
                    final GoogleSignInAccount? googleUser = await GoogleSignIn(
                      scopes: [
                        'email',
                      ],
                    ).signIn();

                    // Obtain the auth details from the request
                    final GoogleSignInAuthentication? googleAuth =
                        await googleUser?.authentication;

                    // Create a new credential
                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth?.accessToken,
                      idToken: googleAuth?.idToken,
                    );

                    // Once signed in, return the UserCredential
                    final user = await FirebaseAuth.instance
                        .signInWithCredential(credential);

                    print(user);
                  },
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
