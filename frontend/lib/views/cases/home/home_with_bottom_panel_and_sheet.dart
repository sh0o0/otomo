import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeWithBottomPanelAndSheet extends StatefulWidget {
  const HomeWithBottomPanelAndSheet({
    super.key,
    required this.body,
    required this.panel,
    required this.sheetBuilder,
    required this.panelMinHeight,
    required this.panelMaxHeight,
    required this.panelSnapPoint,
    required this.sheetMaxSize,
    required this.sheetMinSize,
    required this.sheetInitialSize,
    required this.snap,
    required this.sheetSnapSizes,
    required this.onReady,
  });

  final Widget body;
  final Widget panel;
  final Widget Function(BuildContext, ScrollController) sheetBuilder;
  final double panelMinHeight;
  final double panelMaxHeight;
  final double panelSnapPoint;
  final double sheetMaxSize;
  final double sheetMinSize;
  final double sheetInitialSize;
  final bool snap;
  final List<double>? sheetSnapSizes;
  final void Function(PanelAndSheetController)? onReady;

  @override
  State<HomeWithBottomPanelAndSheet> createState() =>
      _HomeWithBottomPanelAndSheetState();
}

class _HomeWithBottomPanelAndSheetState
    extends State<HomeWithBottomPanelAndSheet> {
  late final PanelAndSheetController _controller;

  @override
  void initState() {
    _controller = PanelAndSheetController(
      panelController: PanelController(),
      sheetController: DraggableScrollableController(),
      sheetMaxSize: widget.sheetMaxSize,
    );
    widget.onReady?.call(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: _controller.panelController,
            minHeight: widget.panelMinHeight,
            maxHeight: widget.panelMaxHeight,
            snapPoint: widget.panelSnapPoint,
            body: widget.body,
            panel: widget.panel,
          ),
          DraggableScrollableSheet(
            controller: _controller.sheetController,
            initialChildSize: widget.sheetInitialSize,
            maxChildSize: widget.sheetMaxSize,
            minChildSize: widget.sheetMinSize,
            snap: widget.snap,
            snapSizes: widget.sheetSnapSizes,
            builder: widget.sheetBuilder,
          )
        ],
      ),
    );
  }
}

class PanelAndSheetController {
  const PanelAndSheetController({
    required this.panelController,
    required this.sheetController,
    required this.sheetMaxSize,
    this.animationDuration = const Duration(milliseconds: 800),
    this.animationCurve = Curves.easeOutQuint,
  });

  final PanelController panelController;
  final DraggableScrollableController sheetController;
  final double sheetMaxSize;
  final Duration animationDuration;
  final Curve animationCurve;

  void openSheet() {
    if (panelController.isPanelOpen) {
      panelController.animatePanelToSnapPoint();
    }

    sheetController.animateTo(
      sheetMaxSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }
}
