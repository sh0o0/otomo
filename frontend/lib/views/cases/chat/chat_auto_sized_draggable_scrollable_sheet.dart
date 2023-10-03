import 'package:flutter/material.dart';
import 'package:otomo/views/bases/sheets/sheet_form.dart';

class ChatAutoSizedDraggableScrollableSheet extends StatefulWidget {
  const ChatAutoSizedDraggableScrollableSheet({
    super.key,
    required this.maxChildSize,
    required this.minChildSize,
    required this.initialChildSize,
    this.onSheetCreated,
    this.snap = false,
    this.snapSizes,
    required this.child,
  });

  final double maxChildSize;
  final double minChildSize;
  final double initialChildSize;
  final bool snap;
  final List<double>? snapSizes;
  final void Function(DraggableScrollableController controller)? onSheetCreated;
  final Widget child;

  @override
  State<ChatAutoSizedDraggableScrollableSheet> createState() =>
      _ChatAutoSizedDraggableScrollableSheetState();
}

class _ChatAutoSizedDraggableScrollableSheetState
    extends State<ChatAutoSizedDraggableScrollableSheet> {
  final _sheetController = DraggableScrollableController();

  double? _sheetHeight;

  double _initialSheetHeight(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return mediaSize.height * widget.initialChildSize;
  }

  @override
  void initState() {
    widget.onSheetCreated?.call(_sheetController);
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
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      maxChildSize: widget.maxChildSize,
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      controller: _sheetController,
      snap: widget.snap,
      snapSizes: widget.snapSizes,
      builder: (context, controller) {
        return Container(
          color: theme.colorScheme.background,
          child: SingleChildScrollView(
            controller: controller,
            child: SheetForm(
              child: SizedBox(
                height: _sheetHeight ?? _initialSheetHeight(context),
                child: widget.child,
              ),
            ),
          ),
        );
      },
    );
  }
}
