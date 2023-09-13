import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/views/bases/text_fields/unfocus_when_tap.dart';
import 'package:otomo/views/cases/chat/chat_bottom_sheet_bar.dart';
import 'package:otomo/views/cases/home/home_with_draggable_scrollable_bottom_sheet.dart';
import 'package:otomo/views/cases/home/swipe_selection_floating_action_button.dart';
import 'package:otomo/views/pages/home/cases/home_chat.dart';
import 'package:otomo/views/pages/map/map.dart';
import 'package:otomo/views/router.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const _sheetAnimationCurve = Curves.ease;

  DraggableScrollableController? _sheetController;

  bool get _canUseSheetController =>
      _sheetController != null && _sheetController!.isAttached;

  void _onSheetCreated(DraggableScrollableController controller) {
    _sheetController = controller;
  }

  void onPressedSheetLeading() {
    if (!_canUseSheetController) return;
    _sheetController!.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: _sheetAnimationCurve,
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return Positioned(
      bottom: padding.bottom,
      right: 20,
      child: FloatingActionButtonWithSwipeSelectionButtons(
        primaryButtonIcon: Icons.chat,
        topButton: SwipeSelectionButtonData(
          icon: Icons.account_circle,
          onSelected: () => ref.read(routerProvider).push(Routes.account),
        ),
        onPrimaryButtonPressed: () {
          _sheetController?.animateTo(
            0.95,
            duration: const Duration(milliseconds: 500),
            curve: _sheetAnimationCurve,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: HomeWithDraggableScrollableBottomSheet(
        initialSheetSize: 0.0,
        minSheetSize: 0.0,
        maxSheetSize: 0.95,
        snap: true,
        snapSizes: const [0.4, 0.5, 0.6],
        resizeToAvoidBottomInset: false,
        onSheetCreated: _onSheetCreated,
        behindSheetFloatingActionButton: _buildFloatingActionButton(context),
        bottomSheetBar:
            ChatBottomSheetBar(onPressedLeading: onPressedSheetLeading),
        bottomSheet: const HomeChat(),
        child: const MapPage(),
      ),
    );
  }
}
