import 'package:flutter/material.dart';

class HomeWithDraggablePageBottomSheet extends StatefulWidget {
  const HomeWithDraggablePageBottomSheet({
    super.key,
    required this.maxSheetSize,
    required this.minSheetSize,
    required this.initialSheetSize,
    this.onSheetCreated,
    this.snap = false,
    this.snapSizes,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.behindSheetFloatingActionButtons,
    required this.pageCount,
    required this.bottomSheetBuilder,
    required this.child,
  });

  final double maxSheetSize;
  final double minSheetSize;
  final double initialSheetSize;
  final bool snap;
  final List<double>? snapSizes;
  final bool? resizeToAvoidBottomInset;
  final void Function(DraggableScrollableController controller)? onSheetCreated;
  final int pageCount;
  final Widget Function(BuildContext context, int index) bottomSheetBuilder;
  final List<Widget>? behindSheetFloatingActionButtons;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget child;

  @override
  State<HomeWithDraggablePageBottomSheet> createState() =>
      _HomeWithDraggablePageBottomSheetState();
}

class _HomeWithDraggablePageBottomSheetState
    extends State<HomeWithDraggablePageBottomSheet> {
  final _sheetController = DraggableScrollableController();

  double? _sheetSize;
  double? _sheetHeight;

  double _initialSheetHeight(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return mediaSize.height * widget.initialSheetSize;
  }

  @override
  void initState() {
    widget.onSheetCreated?.call(_sheetController);
    _sheetController.addListener(() {
      setState(() {
        _sheetSize = _sheetController.size;
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

  Widget _buildSizedBox(BuildContext context, Widget child) {
    final theme = Theme.of(context);
    return Container(
      height: _sheetHeight ?? _initialSheetHeight(context),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildTopCorner(BuildContext context, Widget child) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      body: Stack(
        children: [
          widget.child,
          ...widget.behindSheetFloatingActionButtons ?? [],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: DraggableScrollableSheet(
              maxChildSize: widget.maxSheetSize,
              initialChildSize: _sheetSize ?? widget.initialSheetSize,
              minChildSize: widget.minSheetSize,
              controller: _sheetController,
              snap: widget.snap,
              snapSizes: widget.snapSizes,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: _buildSizedBox(
                    context,
                    PageView.builder(
                      itemCount: widget.pageCount,
                      itemBuilder: (context, index) => _buildTopCorner(
                        context,
                        widget.bottomSheetBuilder(context, index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
