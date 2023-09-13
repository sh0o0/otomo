import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedFilledButton.large(
              onPressed: getIt<FirebaseAuth>().signOut,
              child: const Text('Sign out'),
            ),
          ],
        ),
      ),
    );
  }
}
