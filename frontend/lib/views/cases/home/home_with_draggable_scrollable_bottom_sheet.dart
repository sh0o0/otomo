import 'package:flutter/material.dart';
import 'package:otomo/views/pages/samples/cases/sample_chat.dart';

class HomeWithDraggableScrollableBottomSheet extends StatefulWidget {
  const HomeWithDraggableScrollableBottomSheet({
    super.key,
    required this.bottomSheetBar,
    required this.bottomSheet,
    required this.child,
  });

  final Widget bottomSheetBar;
  final Widget bottomSheet;
  final Widget child;

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

  final _controller = DraggableScrollableController();

  double? _sheetHeight;

  double _initialSheetHeight(BuildContext context) => _getSheetHeight(context);

  double _getSheetHeight(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return mediaSize.height * _controller.size;
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        _sheetHeight = _getSheetHeight(context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Placeholder(),
          DraggableScrollableSheet(
            maxChildSize: _maxSheetSize,
            initialChildSize: _initialSheetSize,
            minChildSize: _minSheetSize,
            controller: _controller,
            builder: (context, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Container(
                  color: Colors.amber,
                  height: _sheetHeight ?? _initialSheetHeight(context),
                  child: Column(
                    children: [
                      Container(
                        height: _sheetBarHeight,
                        color: Colors.red,
                      ),
                      const Expanded(
                        child: SampleChat(),
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
