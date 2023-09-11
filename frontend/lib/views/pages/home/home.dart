import 'package:flutter/material.dart';
import 'package:otomo/views/cases/home/home_with_draggable_scrollable_bottom_sheet.dart';
import 'package:otomo/views/cases/chat/chat_bottom_sheet_bar.dart';
import 'package:otomo/views/pages/samples/cases/sample_chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DraggableScrollableController? _sheetController;

  void onSheetCreated(DraggableScrollableController controller) {
    _sheetController = controller;
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _sheetController?.animateTo(
          0.6,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      },
      child: const Icon(Icons.chat),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeWithDraggableScrollableBottomSheet(
      initialSheetSize: 0.1,
      minSheetSize: 0.0,
      maxSheetSize: 0.9,
      snap: true,
      snapSizes: const [0.3, 0.6],
      onSheetCreated: onSheetCreated,
      floatingActionButton: _buildFloatingActionButton(context),
      bottomSheetBar: const ChatBottomSheetBar(),
      bottomSheet: const SampleChat(),
      child: const Placeholder(),
    );
  }
}
