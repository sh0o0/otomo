import 'package:flutter/material.dart';

class HomeWithDraggableScrollableBottomSheet extends StatefulWidget {
  const HomeWithDraggableScrollableBottomSheet({
    super.key,
    required this.bottomSheetBar,
    required this.bottomSheet,
    required this.child,
    this.snap = false,
    this.snapSizes,
  });

  final Widget bottomSheetBar;
  final Widget bottomSheet;
  final Widget child;
  final bool snap;
  final List<double>? snapSizes;

  @override
  State<HomeWithDraggableScrollableBottomSheet> createState() =>
      _HomeWithDraggableScrollableBottomSheetState();
}

class _HomeWithDraggableScrollableBottomSheetState
    extends State<HomeWithDraggableScrollableBottomSheet> {
  static const double _sheetBarHeight = kToolbarHeight;
  static const double _maxSheetSize = 0.9;
  static const double _minSheetSize = 0.1;
  static const double _initialSheetSize = _minSheetSize;

  final _sheetController = DraggableScrollableController();

  double? _sheetHeight;

  double _initialSheetHeight(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return mediaSize.height * _initialSheetSize;
  }


  @override
  void initState() {
    _sheetController.addListener(() {
      setState(() {
        _sheetHeight = _sheetController.pixels;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          DraggableScrollableSheet(
            maxChildSize: _maxSheetSize,
            initialChildSize: _initialSheetSize,
            minChildSize: _minSheetSize,
            controller: _sheetController,
            snap: widget.snap,
            snapSizes: widget.snapSizes,
            builder: (context, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: SizedBox(
                  height: _sheetHeight ?? _initialSheetHeight(context),
                  child: Column(
                    children: [
                      SizedBox(
                        height: _sheetBarHeight,
                        child: widget.bottomSheetBar,
                      ),
                      Expanded(
                        child: widget.bottomSheet,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
