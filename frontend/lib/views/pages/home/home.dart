import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/view_models/home.dart';
import 'package:otomo/views/bases/buttons/rounded_filled_button.dart';
import 'package:otomo/views/pages/account/account.dart';
import 'package:otomo/views/pages/home/cases/bottom_nav.dart';
import 'package:otomo/views/pages/map/map.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static final List<Widget> _pages = [
    const AppMap(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(homeIndexProvider.notifier).state = 0;
      return;
    }, const []);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _pages[ref.read(homeIndexProvider)],
          RoundedFilledButton.large(
            onPressed: getIt<FirebaseAuth>().signOut,
            child: const Text('Sign out'),
          ),
          const Positioned(
            bottom: 24,
            child: BottomNav(),
          ),
        ],
      ),
    );
  }
}
