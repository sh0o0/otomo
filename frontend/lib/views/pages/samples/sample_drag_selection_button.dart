import 'package:flutter/material.dart';
import 'package:otomo/grpc/generated/interceptors/logging.dart';
import 'package:otomo/tools/logger.dart';

class SampleDragSelectionButton extends StatefulWidget {
  const SampleDragSelectionButton({super.key});

  @override
  State<SampleDragSelectionButton> createState() =>
      _SampleDragSelectionButtonState();
}

class _SampleDragSelectionButtonState extends State<SampleDragSelectionButton> {
  bool _showButtons = false;

  Widget _buildCenterButton(BuildContext context) {
    return GestureDetector(
      onLongPress: () => setState(() {
        _showButtons = true;
      }),
      onLongPressUp: () => setState(() {
        _showButtons = false;
      }),
      onLongPressMoveUpdate: (details) {
        logger.debug('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        logger.debug(details.globalPosition.toString());
        logger.debug(details.localOffsetFromOrigin.toString());
        logger.debug(details.localPosition.toString());
        logger.debug(details.offsetFromOrigin.toString());
      },
      child: Container(
        width: 50,
        height: 50,
        color: _showButtons ? Colors.red : Colors.blue,
      ),
    );
  }

  Widget _buildTopButton(BuildContext context) {
    return Positioned(
      top: _showButtons ? -60 : null,
      child: GestureDetector(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildTopButton(context),
            _buildCenterButton(context),
          ],
        ),
      ),
    );
  }
}
