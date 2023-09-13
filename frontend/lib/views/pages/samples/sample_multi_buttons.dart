import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:otomo/grpc/generated/interceptors/logging.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/utils/haptic.dart';

class SampleMultiButtons extends StatefulWidget {
  const SampleMultiButtons({super.key});

  @override
  State<SampleMultiButtons> createState() => _SampleMultiButtonsState();
}

class _SampleMultiButtonsState extends State<SampleMultiButtons>
    with SingleTickerProviderStateMixin {
  final key = GlobalKey();
  ButtonType? _selectedButton;
  late AnimationController _controller;

  bool get _isAnimationRunningForwardsOrComplete {
    switch (_controller.status) {
      case AnimationStatus.forward:
      case AnimationStatus.completed:
        return true;
      case AnimationStatus.reverse:
      case AnimationStatus.dismissed:
        return false;
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 100),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomRight,
          child: Listener(
            onPointerMove: _detectTapedItem,
            onPointerUp: (event) {
              _detectTapedItem(event);
              _goSomePage();
              _clearSelection();
            },
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return FadeScaleTransition(
                      animation: _controller,
                      child: child,
                    );
                  },
                  child: Container(
                    key: key,
                    color: Colors.black12,
                    height: _isAnimationRunningForwardsOrComplete ? 150 : 58,
                    width: _isAnimationRunningForwardsOrComplete ? 150 : 58,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          bottom: 60,
                          right: 0,
                          child: ButtonWidget(
                            type: ButtonType.top,
                            child: FloatingActionButton(
                              heroTag: 'top',
                              backgroundColor: _selectedButton == ButtonType.top
                                  ? Colors.red
                                  : null,
                              onPressed: () {},
                              child: const Icon(Icons.abc),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 60,
                          bottom: 0,
                          child: ButtonWidget(
                            type: ButtonType.left,
                            child: FloatingActionButton(
                              heroTag: 'left',
                              backgroundColor:
                                  _selectedButton == ButtonType.left
                                      ? Colors.red
                                      : null,
                              onPressed: () {},
                              child: const Icon(Icons.abc),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 60,
                          right: 60,
                          child: ButtonWidget(
                            type: ButtonType.topLeft,
                            child: FloatingActionButton(
                              heroTag: 'topLeft',
                              backgroundColor:
                                  _selectedButton == ButtonType.topLeft
                                      ? Colors.red
                                      : null,
                              onPressed: () {},
                              child: const Icon(Icons.abc),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onLongPressStart: (details) => Haptic.mediumImpact(),
                    onLongPress: () => setState(() {
                      _controller.forward();
                    }),
                    onLongPressUp: () => setState(() {
                      _controller.reverse();
                    }),
                    child: FloatingActionButton(
                      heroTag: 'center',
                      onPressed: () {},
                      child: const Icon(Icons.abc),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required ButtonType type,
    required IconData icon,
  }) {
    return ButtonWidget(
      type: type,
      child: FloatingActionButton(
        backgroundColor: _selectedButton == type ? Colors.red : null,
        onPressed: () {},
        child: Icon(icon),
      ),
    );
  }

  void _detectTapedItem(PointerEvent event) {
    final RenderBox box =
        key.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        final target = hit.target;
        if (target is ButtonBox) {
          _selectButton(target.type);
        }
      }
    }
  }

  void _selectButton(ButtonType type) {
    setState(() {
      _selectedButton = type;
    });
  }

  void _goSomePage() {
    logger.debug('go $_selectedButton');
  }

  void _clearSelection() {
    setState(() {
      _selectedButton = null;
    });
  }
}

enum ButtonType {
  top,
  left,
  topLeft,
}

class ButtonWidget extends SingleChildRenderObjectWidget {
  final ButtonType type;

  const ButtonWidget({
    Key? key,
    required Widget child,
    required this.type,
  }) : super(key: key, child: child);

  @override
  ButtonBox createRenderObject(BuildContext context) {
    return ButtonBox(type);
  }

  @override
  void updateRenderObject(BuildContext context, ButtonBox renderObject) {
    renderObject.type = type;
  }
}

class ButtonBox extends RenderProxyBox {
  ButtonType type;
  ButtonBox(this.type);
}
