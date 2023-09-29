import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/text_fields/unfocus.dart';
import 'package:otomo/views/cases/chat/chat_bottom_sheet_bar.dart';
import 'package:otomo/views/cases/home/home_with_draggable_scrollable_bottom_sheet.dart';
import 'package:otomo/views/pages/home/cases/home_chat.dart';
import 'package:otomo/views/pages/map/index.dart';
import 'package:otomo/view_models/router.dart';
import 'package:otomo/views/utils/controller.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const _sheetAnimationCurve = Curves.easeOutQuint;
  static const _sheetAnimationDuration = Duration(milliseconds: 800);
  static const _maxSheetSize = 0.95;
  static const _minSheetSize = 0.0;
  static const _limitCanShowKeyboard = 0.45;
  static const _sheetSnaps = [_limitCanShowKeyboard];

  DraggableScrollableController? _sheetController;

  void _assertCanUseSheetController() {
    assert(_sheetController != null && _sheetController!.isAttached);
  }

  void _onSheetCreated(DraggableScrollableController controller) {
    _sheetController = controller;
    controller.addListener(() {
      _assertCanUseSheetController();
      if (_sheetController!.size < _limitCanShowKeyboard) {
        ViewUtilsController.I.unfocus(context);
      }
    });
  }

  void _onPressedSheetLeading(BuildContext context) {
    _assertCanUseSheetController();

    _sheetController!.animateTo(
      _minSheetSize,
      duration: _sheetAnimationDuration,
      curve: _sheetAnimationCurve,
    );
  }

  void _onChatTextFieldTap(BuildContext context) {
    _assertCanUseSheetController();
    _sheetController?.animateTo(
      _maxSheetSize,
      duration: _sheetAnimationDuration,
      curve: _sheetAnimationCurve,
    );
  }

  List<Widget> _buildFloatingActionButtons(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return [
      Positioned(
        bottom: padding.bottom,
        right: 20,
        child: FloatingActionButton(
          heroTag: 'chat',
          child: const Icon(Icons.chat),
          onPressed: () {
            _sheetController?.animateTo(
              _maxSheetSize,
              duration: _sheetAnimationDuration,
              curve: _sheetAnimationCurve,
            );
          },
        ),
      ),
      Positioned(
        top: padding.top,
        left: 20,
        child: FloatingActionButton(
          heroTag: 'account',
          mini: true,
          child: const Icon(Icons.account_circle_rounded),
          onPressed: () => ref.read(routerProvider).push(Routes.settings),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final activatedTextMessageStreamSub = ref
          .read(chatProvider.notifier)
          .activatedTextMessageStream
          .listen((textMsg) {
        _assertCanUseSheetController();

        _sheetController!.animateTo(_limitCanShowKeyboard,
            duration: _sheetAnimationDuration, curve: _sheetAnimationCurve);
      });
      return () => activatedTextMessageStreamSub.cancel();
    }, const []);

    final chatState = ref.watch(chatProvider);

    return Unfocus(
      child: HomeWithDraggableScrollableBottomSheet(
        initialSheetSize: _minSheetSize,
        maxSheetSize: _maxSheetSize,
        minSheetSize: _minSheetSize,
        snap: true,
        snapSizes: _sheetSnaps,
        resizeToAvoidBottomInset: false,
        onSheetCreated: _onSheetCreated,
        behindSheetFloatingActionButtons: _buildFloatingActionButtons(context),
        bottomSheetBar: ChatBottomSheetBar(
          onPressedLeading: () => _onPressedSheetLeading(context),
          remainingMessageSendCount: chatState.value?.remainingMessageSendCount,
        ),
        bottomSheet: HomeChat(
          inputOptions: InputOptions(
            onTextFieldTap: () => _onChatTextFieldTap(context),
          ),
        ),
        child: const MapPage(),
      ),
    );
  }
}
