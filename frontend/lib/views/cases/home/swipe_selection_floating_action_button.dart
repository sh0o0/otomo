import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/utils/haptic.dart';

enum ButtonDirection {
  top,
  left,
  topLeft,
}

class SwipeSelectionButtonData {
  const SwipeSelectionButtonData({
    required this.icon,
    required this.onSelected,
  });
  final IconData icon;
  final VoidCallback onSelected;
}

class FloatingActionButtonWithSwipeSelectionButtons extends StatefulWidget {
  const FloatingActionButtonWithSwipeSelectionButtons({
    super.key,
    required this.primaryButtonIcon,
    this.onPrimaryButtonPressed,
    this.topButton,
    this.topLeftButton,
    this.leftButton,
  });

  final IconData primaryButtonIcon;
  final VoidCallback? onPrimaryButtonPressed;
  final SwipeSelectionButtonData? topButton;
  final SwipeSelectionButtonData? topLeftButton;
  final SwipeSelectionButtonData? leftButton;

  @override
  State<FloatingActionButtonWithSwipeSelectionButtons> createState() =>
      _FloatingActionButtonWithSwipeSelectionButtonsState();
}

class _FloatingActionButtonWithSwipeSelectionButtonsState
    extends State<FloatingActionButtonWithSwipeSelectionButtons>
    with SingleTickerProviderStateMixin {
  static const double primaryButtonSize = 58;
  static const double _multiButtonPadding = 16;
  static const double multiButtonSize = 58;
  static const double multiButtonPosition =
      primaryButtonSize + _multiButtonPadding;
  static const double listenableRange =
      primaryButtonSize + _multiButtonPadding + multiButtonSize;

  final key = GlobalKey();
  ButtonDirection? _selectedButton;
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
        onLongPress: () => _controller.forward(),
        onLongPressUp: () async {
          await _controller.reverse();
          Haptic.mediumImpact();
          _goSomePage();
          _clearSelection();
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
            if (widget.topButton != null)
              Positioned(
                right: 0,
                bottom: multiButtonPosition,
                child: _buildButton(
                  context,
                  type: ButtonDirection.top,
                  icon: widget.topButton!.icon,
                ),
              ),
            if (widget.topLeftButton != null)
              Positioned(
                bottom: multiButtonPosition,
                right: multiButtonPosition,
                child: _buildButton(
                  context,
                  type: ButtonDirection.topLeft,
                  icon: widget.topLeftButton!.icon,
                ),
              ),
            if (widget.leftButton != null)
              Positioned(
                right: multiButtonPosition,
                bottom: 0,
                child: _buildButton(
                  context,
                  type: ButtonDirection.left,
                  icon: widget.leftButton!.icon,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required ButtonDirection type,
    required IconData icon,
  }) {
    final theme = Theme.of(context);

    return SwipeSelectionButton(
      direction: type,
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
        if (target is SwipeSelectionButtonBox &&
            target.direction != _selectedButton) {
          _selectButton(target.direction);
          Haptic.lightImpact();
        }
      }
    }
  }

  void _selectButton(ButtonDirection type) {
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

class SwipeSelectionButton extends SingleChildRenderObjectWidget {
  final ButtonDirection direction;

  const SwipeSelectionButton({
    Key? key,
    required Widget child,
    required this.direction,
  }) : super(key: key, child: child);

  @override
  SwipeSelectionButtonBox createRenderObject(BuildContext context) {
    return SwipeSelectionButtonBox(direction);
  }

  @override
  void updateRenderObject(
      BuildContext context, SwipeSelectionButtonBox renderObject) {
    renderObject.direction = direction;
  }
}

class SwipeSelectionButtonBox extends RenderProxyBox {
  ButtonDirection direction;
  SwipeSelectionButtonBox(this.direction);
}
