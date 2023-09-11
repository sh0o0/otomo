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
  double _sheetHeight = 0.0;

  static const double _sheetBarHeight = kToolbarHeight;

  double get _sheetBodyHeight {
    final limit = MediaQuery.paddingOf(context).bottom;
    final height = _sheetHeight - _sheetBarHeight;
    return height > limit ? height : limit;
  }

  double _maxSheetHeight(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    return MediaQuery.of(context).size.height - padding.top;
  }

  double _minSheetHeight(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);
    return kToolbarHeight + padding.bottom;
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
                maxHeight: _maxSheetHeight(context),
                minHeight: _minSheetHeight(context),
              ),
              height: _sheetHeight,
              child: Column(
                children: [
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      final draggedAmount =
                          mediaSize.height - details.globalPosition.dy;
                      if (_maxSheetHeight(context) < draggedAmount ||
                          _minSheetHeight(context) > draggedAmount) return;

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
