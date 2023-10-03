import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/home.dart';
import 'package:otomo/views/bases/text_fields/unfocus.dart';
import 'package:otomo/views/cases/home/home_with_bottom_panel_and_sheet.dart';
import 'package:otomo/views/pages/home/cases/home_chat.dart';
import 'package:otomo/views/pages/home/cases/home_place_details.dart';
import 'package:otomo/views/pages/map.dart';
import 'package:otomo/views/router.dart';

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

  late final PanelAndSheetController _controller;

  void _onHomeReady(PanelAndSheetController controller) {
    _controller = controller;
    // _controller.panelController.addListener(() {
    //   _assertCanUseSheetController();
    //   if (_sheetController!.size < _limitCanShowKeyboard) {
    //     ViewUtilsController.I.unfocus(context);
    //   }
    // });
  }

  void _onPanelLeadingPressed(BuildContext context) {
    _controller.panelController.close();
  }

  void _onChatTextFieldTap(BuildContext context) {
    _controller.panelController.animatePanelToSnapPoint();
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
            // _sheetController?.animateTo(
            //   _maxSheetSize,
            //   duration: _sheetAnimationDuration,
            //   curve: _sheetAnimationCurve,
            // );
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
      final notifier = ref.read(homeProvider.notifier);
      final activatedTextMessageStreamSub =
          notifier.activatedTextMessageStream.listen((textMsg) {
        _controller.panelController.animatePanelToSnapPoint();
      });
      final focusedPlaceStreamSub =
          notifier.focusedPlaceStream.listen((location) {
        _controller.openSheet();
      });

      return () {
        activatedTextMessageStreamSub.cancel();
        focusedPlaceStreamSub.cancel();
      };
    }, const []);

    final size = MediaQuery.of(context).size;

    return Unfocus(
      child: HomeWithBottomPanelAndSheet(
        body: const MapPage(),
        panel: HomeChat(
          onLeadingPressed: () => _onPanelLeadingPressed(context),
          onHeaderTap: () => _controller.panelController.open(),
          onTextFieldTap: () => _onChatTextFieldTap(context),
        ),
        sheetBuilder: (context, controller) => HomePlaceDetailsScrollView(
          scrollController: controller,
        ),
        panelMinHeight: 100,
        panelMaxHeight: size.height * 0.95,
        panelSnapPoint: 0.3,
        sheetMaxSize: 0.95,
        sheetMinSize: 0.0,
        sheetInitialSize: 0.0,
        snap: true,
        sheetSnapSizes: const [0.45],
        onReady: _onHomeReady,
      ),
    );
  }
}
