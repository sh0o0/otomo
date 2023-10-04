import 'package:flutter/material.dart';

class HomeWithTwiceBottomSheet extends StatefulWidget {
  const HomeWithTwiceBottomSheet({
    super.key,
    required this.body,
    required this.primarySheetBuilder,
    required this.secondarySheetBuilder,
    this.sheetMaxSize = 0.95,
    this.sheetMinSize = 0.0,
    this.primarySheetInitialSize = 0.1,
    this.secondarySheetInitialSize = 0.0,
    this.sheetSnapSize = 0.45,
    this.onReady,
    this.floatingActionButtons,
  });

  final Widget body;
  final Widget Function(BuildContext, ScrollController) primarySheetBuilder;
  final Widget Function(BuildContext, ScrollController) secondarySheetBuilder;
  final double sheetMaxSize;
  final double sheetMinSize;
  final double primarySheetInitialSize;
  final double secondarySheetInitialSize;
  final double sheetSnapSize;
  final void Function(TwiceBottomSheetController)? onReady;
  final List<Widget>? floatingActionButtons;

  @override
  State<HomeWithTwiceBottomSheet> createState() =>
      _HomeWithTwiceBottomSheetState();
}

class _HomeWithTwiceBottomSheetState extends State<HomeWithTwiceBottomSheet> {
  late final TwiceBottomSheetController _controller;

  @override
  void initState() {
    _controller = TwiceBottomSheetController(
      primary: DraggableScrollableController(),
      secondary: DraggableScrollableController(),
      maxSize: widget.sheetMaxSize,
      minSize: widget.sheetMinSize,
      snapSize: widget.sheetSnapSize,
    );
    widget.onReady?.call(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.body,
          ...widget.floatingActionButtons ?? [],
          DraggableScrollableSheet(
            controller: _controller.primary,
            initialChildSize: widget.primarySheetInitialSize,
            maxChildSize: widget.sheetMaxSize,
            minChildSize: widget.sheetMinSize,
            snap: true,
            snapSizes: [widget.sheetSnapSize],
            builder: widget.primarySheetBuilder,
          ),
          DraggableScrollableSheet(
            controller: _controller.secondary,
            initialChildSize: widget.secondarySheetInitialSize,
            maxChildSize: widget.sheetMaxSize,
            minChildSize: widget.sheetMinSize,
            snap: true,
            snapSizes: [widget.sheetSnapSize],
            builder: widget.secondarySheetBuilder,
          )
        ],
      ),
    );
  }
}

class TwiceBottomSheetController {
  const TwiceBottomSheetController({
    required this.primary,
    required this.secondary,
    required this.maxSize,
    required this.minSize,
    required this.snapSize,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeOutExpo,
  });

  final DraggableScrollableController primary;
  final DraggableScrollableController secondary;
  final double maxSize;
  final double minSize;
  final double snapSize;
  final Duration animationDuration;
  final Curve animationCurve;

  void openPrimary() {
    primary.animateTo(
      maxSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  void closePrimary() {
    primary.animateTo(
      minSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  void movePrimaryToSnap() {
    primary.animateTo(
      snapSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  void openSheet() {
    if (primary.size > snapSize) {
      primary.animateTo(
        snapSize,
        duration: animationDuration,
        curve: animationCurve,
      );
    }

    secondary.animateTo(
      maxSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }
}
