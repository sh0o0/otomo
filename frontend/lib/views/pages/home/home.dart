import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/views/cases/chat/chat_bottom_sheet_bar.dart';
import 'package:otomo/views/cases/home/home_with_draggable_scrollable_bottom_sheet.dart';
import 'package:otomo/views/pages/home/cases/chat.dart';
import 'package:otomo/views/pages/map/map.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  DraggableScrollableController? _sheetController;

  void onSheetCreated(DraggableScrollableController controller) {
    _sheetController = controller;
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return Positioned(
      bottom: padding.bottom,
      right: 20,
      child: FloatingActionButton(
        heroTag: 'behindSheetFloatingActionButton',
        onPressed: () {
          _sheetController?.animateTo(
            0.6,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 500),
          );
        },
        child: const Icon(Icons.chat),
      ),
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
      behindSheetFloatingActionButton: _buildFloatingActionButton(context),
      bottomSheetBar: const ChatBottomSheetBar(),
      bottomSheet: const HomeChat(),
      child: const MapPage(),
    );
  }
}
