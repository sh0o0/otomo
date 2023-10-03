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
import 'package:otomo/views/utils/flutter.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final TwiceBottomSheetController _controller;

  void _onHomeReady(TwiceBottomSheetController controller) {
    _controller = controller;
    _controller.primary.addListener(() {
      if (_controller.primary.size < 0.5) {
        FlutterUtils.unfocus(context);
      }
    });
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
          onPressed: () => _controller.openPrimary(),
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
        _controller.movePrimaryToSnap();
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

    return Unfocus(
      child: HomeWithTwiceBottomSheet(
        body: const MapPage(),
        primarySheetBuilder: (context, controller) => HomeChatScrollView(
          scrollController: controller,
          onLeadingPressed: () => _controller.closePrimary(),
          onHeaderTap: () => _controller.openPrimary(),
          onTextFieldTap: () => _controller.openPrimary(),
        ),
        secondarySheetBuilder: (context, controller) =>
            HomePlaceDetailsScrollView(scrollController: controller),
        onReady: _onHomeReady,
        floatingActionButtons: _buildFloatingActionButtons(context),
      ),
    );
  }
}
