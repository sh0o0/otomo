import 'package:flutter/material.dart';

class HomeWithDraggableBottomSheet extends StatefulWidget {
  const HomeWithDraggableBottomSheet({
    super.key,
    required this.bottomSheetBar,
    required this.bottomSheet,
    required this.child,
  });

  final Widget bottomSheetBar;
  final Widget bottomSheet;
  final Widget child;

  @override
  State<HomeWithDraggableBottomSheet> createState() =>
      HomeWithDraggableBottomSheetState();
}

class HomeWithDraggableBottomSheetState
    extends State<HomeWithDraggableBottomSheet> {
  static const double _sheetBarHeight = kToolbarHeight;

  double _sheetHeight = 0.0;

  double get _sheetBodyHeight {
    final height = _sheetHeight - _sheetBarHeight;
    return height > 0 ? height : 0;
  }

  double _sheetMaxHeight(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    return MediaQuery.of(context).size.height - padding.top;
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          Positioned(
            bottom: 0,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: _sheetMaxHeight(context),
                minHeight: _sheetBarHeight,
              ),
              height: _sheetHeight,
              child: Column(
                children: [
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      final draggedAmount =
                          mediaSize.height - details.globalPosition.dy;
                      if (_sheetMaxHeight(context) < draggedAmount) return;
                      setState(() => _sheetHeight = draggedAmount);
                    },
                    child: SizedBox(
                      height: _sheetBarHeight,
                      width: mediaSize.width,
                      child: widget.bottomSheetBar,
                    ),
                  ),
                  SizedBox(
                    height: _sheetBodyHeight,
                    width: mediaSize.width,
                    child: widget.bottomSheet,
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
