import 'package:flutter/material.dart';
import 'package:otomo/views/bases/scaffolds/app_scaffold.dart';
import 'package:otomo/views/bases/spaces/space.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          const Text('Otomo'),
          const Space(height: 40),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/sign-up'),
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
