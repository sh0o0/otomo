import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/utils/haptic.dart';

class SwipeSelectionFloatingActionButton extends StatefulWidget {
  const SwipeSelectionFloatingActionButton({
    super.key,
    required this.primaryButtonIcon,
    this.onPrimaryButtonPressed,
  });

  final IconData primaryButtonIcon;
  final VoidCallback? onPrimaryButtonPressed;

  @override
  State<SwipeSelectionFloatingActionButton> createState() =>
      _SwipeSelectionFloatingActionButtonState();
}

class _SwipeSelectionFloatingActionButtonState
    extends State<SwipeSelectionFloatingActionButton>
    with SingleTickerProviderStateMixin {
  static const double primaryButtonSize = 58;
  static const double _multiButtonPadding = 16;
  static const double multiButtonSize = 58;
  static const double multiButtonPosition =
      primaryButtonSize + _multiButtonPadding;
  static const double listenableRange =
      primaryButtonSize + _multiButtonPadding + multiButtonSize;

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
    return Listener(
      onPointerMove: _detectTapedItem,
      onPointerUp: (event) {
        _detectTapedItem(event);
        _goSomePage();
        _clearSelection();
      },
      child: Stack(
        children: [
          _buildSwipeSelectionButtons(context),
          _buildPrimaryButton(context),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onLongPressStart: (details) => Haptic.mediumImpact(),
        onLongPress: () async {
          await _controller.forward();
          setState(() {});
        },
        onLongPressUp: () async {
          await _controller.reverse();
          setState(() {});
          Haptic.mediumImpact();
        },
        child: SizedBox(
          height: primaryButtonSize,
          width: primaryButtonSize,
          child: FloatingActionButton(
              heroTag: 'primary',
              onPressed: widget.onPrimaryButtonPressed,
              child: Icon(widget.primaryButtonIcon)),
        ),
      ),
    );
  }

  Widget _buildSwipeSelectionButtons(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return FadeScaleTransition(animation: _controller, child: child);
      },
      child: Container(
        key: key,
        color: Colors.transparent,
        height: _isAnimationRunningForwardsOrComplete
            ? listenableRange
            : primaryButtonSize,
        width: _isAnimationRunningForwardsOrComplete
            ? listenableRange
            : primaryButtonSize,
        alignment: Alignment.bottomRight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0,
              bottom: multiButtonPosition,
              child: _buildButton(
                context,
                type: ButtonType.top,
                icon: Icons.abc,
              ),
            ),
            Positioned(
              bottom: multiButtonPosition,
              right: multiButtonPosition,
              child: _buildButton(
                context,
                type: ButtonType.topLeft,
                icon: Icons.abc,
              ),
            ),
            Positioned(
              right: multiButtonPosition,
              bottom: 0,
              child: _buildButton(
                context,
                type: ButtonType.left,
                icon: Icons.abc,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required ButtonType type,
    required IconData icon,
  }) {
    final theme = Theme.of(context);

    return ButtonWidget(
      type: type,
      child: SizedBox(
        height: multiButtonSize,
        width: multiButtonSize,
        child: FloatingActionButton(
          heroTag: type.toString(),
          backgroundColor:
              _selectedButton == type ? theme.colorScheme.secondary : null,
          onPressed: () {},
          child: Icon(icon),
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
        final target = hit.target;
        if (target is ButtonBox && target.type != _selectedButton) {
          _selectButton(target.type);
          Haptic.lightImpact();
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
