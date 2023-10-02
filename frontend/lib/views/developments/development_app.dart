import 'package:flutter/material.dart';
import 'package:otomo/views/developments/development_home.dart';

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Playground',
      home: DevelopmentHome()
    );
  }
}
