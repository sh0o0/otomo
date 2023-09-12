import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:otomo/grpc/generated/interceptors/logging.dart';
import 'package:otomo/tools/logger.dart';

class SampleDragSelectionButton extends StatefulWidget {
  const SampleDragSelectionButton({super.key});

  @override
  State<SampleDragSelectionButton> createState() =>
      _SampleDragSelectionButtonState();
}

class _SampleDragSelectionButtonState extends State<SampleDragSelectionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _showButtons = false;

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 100),
      vsync: this,
    )..addStatusListener((AnimationStatus status) {
        setState(() {
          // setState needs to be called to trigger a rebuild because
          // the 'HIDE FAB'/'SHOW FAB' button needs to be updated based
          // the latest value of [_controller.status].
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCenterButton(BuildContext context) {
    return GestureDetector(
      onLongPress: () => setState(() {
        _controller.forward();
        _showButtons = true;
      }),
      onLongPressUp: () => setState(() {
        _controller.reverse();
        _showButtons = false;
      }),
      onLongPressMoveUpdate: (details) {
        logger.debug('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
        logger.debug(details.globalPosition.toString());
        logger.debug(details.localOffsetFromOrigin.toString());
        logger.debug(details.localPosition.toString());
        logger.debug(details.offsetFromOrigin.toString());
      },
      child: FloatingActionButton(
        backgroundColor: _showButtons ? Colors.red : Colors.blue,
        onPressed: () {},
      ),
    );
  }

  Widget _buildTopButton(BuildContext context) {
    return Positioned(
      top: _showButtons ? -60 : null,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return FadeScaleTransition(
            animation: _controller,
            child: child,
          );
        },
        child: Visibility(
          visible: _controller.status != AnimationStatus.dismissed,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );

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
