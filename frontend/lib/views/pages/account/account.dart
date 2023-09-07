import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedFilledButton.large(
        onPressed: getIt<FirebaseAuth>().signOut,
        child: const Text('Sign out'),
      ),
    );
  }
}
