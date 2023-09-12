import 'package:flutter/material.dart';
import 'package:otomo/views/pages/samples/store/sample_chat.dart';

class SampleMapChat extends StatefulWidget {
  const SampleMapChat({super.key});

  @override
  State<SampleMapChat> createState() => SampleMapChatState();
}

class SampleMapChatState extends State<SampleMapChat> {
  static const double _barHeight = 80;

  double _modalHeight = 0.0;

  double get _bodyHeight {
    final bodyHeight = _modalHeight - _barHeight;
    return bodyHeight > 0 ? bodyHeight : 0;
  }

  double _maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height - 50;
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const Center(child: Text('This is map')),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.blue,
              constraints: BoxConstraints(
                maxHeight: _maxHeight(context),
                minHeight: _barHeight,
              ),
              height: _modalHeight,
              child: Column(
                children: [
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      final draggedAmount =
                          mediaSize.height - details.globalPosition.dy;
                      if (_maxHeight(context) < draggedAmount) return;
                      setState(() => _modalHeight = draggedAmount);
                    },
                    child: Container(
                      height: _barHeight,
                      width: mediaSize.width,
                      color: Colors.red,
                      child: const Text('This is bar'),
                    ),
                  ),
                  SizedBox(
                    height: _bodyHeight,
                    width: mediaSize.width,
                    child: const SampleChat(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
