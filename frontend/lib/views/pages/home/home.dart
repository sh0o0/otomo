import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/viewmodels/home/home.dart';
import 'package:otomo/views/pages/account/account.dart';
import 'package:otomo/views/pages/home/bases/bottom_navigation.dart';
import 'package:otomo/views/pages/map/map.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});

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
          const Positioned(
            bottom: 24,
            child: BottomNavigation(),
          ),
        ],
      ),
    );
  }
}
