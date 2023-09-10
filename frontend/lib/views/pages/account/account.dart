import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/pages/samples/sample_map_chat.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedFilledButton.large(
            onPressed: getIt<FirebaseAuth>().signOut,
            child: const Text('Sign out'),
          ),
          Spaces.h8,
          RoundedFilledButton.large(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SampleMapChat())),
            child: const Text('Sample Map Chat'),
          ),
        ],
      ),
    );
  }
}
