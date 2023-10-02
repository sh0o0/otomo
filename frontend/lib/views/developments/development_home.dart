import 'package:flutter/material.dart';
import 'package:otomo/views/app.dart';
import 'package:otomo/views/developments/playground.dart';

class DevelopmentHome extends StatelessWidget {
  const DevelopmentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const App(),
              )),
              child: const Text('App'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Playground(),
              )),
              child: const Text('Playground'),
            )
          ],
        ),
      ),
    );
  }
}
