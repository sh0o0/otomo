import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/home.dart';
import 'package:otomo/views/bases/text_fields/unfocus.dart';
import 'package:otomo/views/pages/home/cases/home_chat_sheet.dart';
import 'package:otomo/views/pages/home/cases/home_place_details_sheet.dart';
import 'package:otomo/views/pages/map.dart';
import 'package:otomo/views/router.dart';
import 'package:otomo/views/routes.dart';
import 'package:otomo/views/utils/flutter.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  double get screenHeight => MediaQuery.of(context).size.height;
  double get maxSheetSize =>
      1 / screenHeight * (screenHeight - MediaQuery.paddingOf(context).top);
  double get chatMinSheetSize => 1 / screenHeight * 100;
  final placeDetailsMinSheetSize = 0.0;
  double get chatSheetInitialSheetSize => chatMinSheetSize;
  double get placeDetailsSheetInitialSheetSize => placeDetailsMinSheetSize;
  final snapSizes = [0.45];

  final _placeDetailsSheetController = DraggableScrollableController();
  late final HomeController _homeController;

  void _onChatSheetCreated(DraggableScrollableController controller) {
    _homeController = HomeController(
      chatSheet: controller,
      placeDetailsSheet: _placeDetailsSheetController,
      maxSize: maxSheetSize,
      chatMinSize: chatMinSheetSize,
      placeDetailsMinSize: placeDetailsMinSheetSize,
      snapSize: snapSizes.first,
    );
  }

  List<Widget> _buildFloatingActionButtons(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return [
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
        if (textMsg.locationAnalysis.locations.isEmpty) return;
        FlutterUtils.afterBuildCallback(() {
          _homeController.moveChatSheetToSnap();
        });
      });
      final focusedPlaceStreamSub =
          notifier.focusedPlaceStream.listen((location) {
        FlutterUtils.afterBuildCallback(() async {
          _homeController.openPlaceDetailsSheet();
        });
      });

      final focusedAnalyzedLocationStreamSub = ref
          .read(homeProvider.notifier)
          .focusedAnalyzedLocationStream
          .listen((loc) {
        FlutterUtils.afterBuildCallback(() {
          _homeController.moveChatSheetToSnap();
        });
      });

      return () {
        activatedTextMessageStreamSub.cancel();
        focusedPlaceStreamSub.cancel();
        focusedAnalyzedLocationStreamSub.cancel();
      };
    }, const []);

    return Unfocus(
      child: Scaffold(
        body: Stack(
          children: [
            const MapPage(),
            ..._buildFloatingActionButtons(context),
            HomeChatSheet(
              maxSheetSize: maxSheetSize,
              minSheetSize: chatMinSheetSize,
              initialSheetSize: chatSheetInitialSheetSize,
              snap: true,
              snapSizes: snapSizes,
              onHeaderTap: () => _homeController.openChatSheet(),
              onTextFieldTap: () => _homeController.openChatSheet(),
              onLeadingPressed: () => _homeController.closeChatSheet(),
              onSheetCreated: _onChatSheetCreated,
            ),
            HomePlaceDetailsSheet(
              sheetController: _placeDetailsSheetController,
              maxSheetSize: maxSheetSize,
              minSheetSize: placeDetailsMinSheetSize,
              initialSheetSize: placeDetailsSheetInitialSheetSize,
              snap: true,
              snapSizes: snapSizes,
            )
          ],
        ),
      ),
    );
  }
}

class HomeController {
  const HomeController({
    required this.chatSheet,
    required this.placeDetailsSheet,
    required this.maxSize,
    required this.chatMinSize,
    required this.placeDetailsMinSize,
    required this.snapSize,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeOutExpo,
  });

  final DraggableScrollableController chatSheet;
  final DraggableScrollableController placeDetailsSheet;
  final double maxSize;
  final double chatMinSize;
  final double placeDetailsMinSize;
  final double snapSize;
  final Duration animationDuration;
  final Curve animationCurve;

  void openChatSheet() {
    chatSheet.animateTo(
      maxSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  void closeChatSheet() {
    chatSheet.animateTo(
      chatMinSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  void moveChatSheetToSnap() {
    chatSheet.animateTo(
      snapSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }

  void openPlaceDetailsSheet() {
    if (chatSheet.size > snapSize) {
      chatSheet.animateTo(
        snapSize,
        duration: animationDuration,
        curve: animationCurve,
      );
    }

    placeDetailsSheet.animateTo(
      maxSize,
      duration: animationDuration,
      curve: animationCurve,
    );
  }
}
