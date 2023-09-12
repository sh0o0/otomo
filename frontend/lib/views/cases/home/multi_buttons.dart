import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otomo/tools/logger.dart';

class MultiButtons extends StatefulWidget {
  const MultiButtons({super.key});

  @override
  State<MultiButtons> createState() => _MultiButtonsState();
}

class _MultiButtonsState extends State<MultiButtons>
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

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: _detectTapedItem,
      // onPointerUp: () {},
      child: Stack(
        key: key,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -60,
            child: _buildButton(
              context,
              type: ButtonType.top,
              icon: Icons.arrow_upward,
            ),
          ),
          Positioned(
            top: -60,
            left: -60,
            child: _buildButton(
              context,
              type: ButtonType.topLeft,
              icon: Icons.account_balance,
            ),
          ),
          Positioned(
            left: -60,
            child: _buildButton(
              context,
              type: ButtonType.left,
              icon: Icons.home,
            ),
          ),
          _buildCenterButton(context),
        ],
      ),
    );
  }

  Widget _buildCenterButton(BuildContext context) {
    return GestureDetector(
      onLongPress: () => setState(() {
        _controller.forward();
      }),
      onLongPressUp: () => setState(() {
        _controller.reverse();
      }),
      child: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required ButtonType type,
    required IconData icon,
  }) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return FadeScaleTransition(
          animation: _controller,
          child: child,
        );
      },
      child: Visibility(
        visible: _controller.status != AnimationStatus.dismissed,
        child: ButtonWidget(
          type: type,
          child: FloatingActionButton(
            backgroundColor: _selectedButton == type ? Colors.red : null,
            onPressed: () {},
            child: Icon(icon),
          ),
        ),
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
        /// temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is ButtonBox && target.type != _selectedButton) {
          logger.debug('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
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
