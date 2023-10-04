import 'package:flutter/material.dart';
import 'package:otomo/views/app.dart';
import 'package:otomo/development/views/stored/slide_up_panel_and_draggable_scrollable_sheet.dart';

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
                builder: (context) => const SlideUpPanelAndDraggableScrollableSheet(),
              )),
              child: const Text('Playground'),
            )
          ],
        ),
      ),
    );
  }
}
