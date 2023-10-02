import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otomo/tools/logger.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  late final HomeController _homeController;

  void _onControllerReady(HomeController controller) {
    _homeController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return HomeWithTwiceSideUpPanel(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _homeController.openSecondaryPanel();
              },
              child: Text('Open Secondary Panel'),
            ),
          ],
        ),
      ),
      primaryPanel: Container(color: Colors.red),
      secondaryPanel: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.green,
              child: Center(child: Text('Header')),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) => ListTile(title: Text('$index')),
              ),
            ),
          ],
        ),
      ),
      onControllerReady: _onControllerReady,
    );
  }
}

class HomeWithTwiceSideUpPanel extends StatefulWidget {
  const HomeWithTwiceSideUpPanel({
    super.key,
    required this.body,
    required this.primaryPanel,
    required this.secondaryPanel,
    this.onControllerReady,
  });

  final Widget body;
  final Widget primaryPanel;
  final Widget secondaryPanel;
  final void Function(HomeController)? onControllerReady;

  @override
  State<HomeWithTwiceSideUpPanel> createState() =>
      _HomeWithTwiceSideUpPanelState();
}

class _HomeWithTwiceSideUpPanelState extends State<HomeWithTwiceSideUpPanel> {
  final HomeController _homeController = HomeController(
    primaryPanelController: PanelController(),
    secondaryPanelController: PanelController(),
  );

  @override
  void initState() {
    widget.onControllerReady?.call(_homeController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        controller: _homeController.secondaryPanelController,
        panel: widget.secondaryPanel,
        minHeight: 0,
        snapPoint: 0.4,
        maxHeight: size.height * 0.95,
        header: Text('Header'),
        body: SlidingUpPanel(
          controller: _homeController.primaryPanelController,
          minHeight: 100,
          maxHeight: size.height * 0.95,
          snapPoint: 0.4,
          parallaxEnabled: true,
          panel: widget.primaryPanel,
          body: widget.body,
          header: Text('Header'),
        ),
      ),
    );
  }
}

class HomeController {
  HomeController({
    required this.primaryPanelController,
    required this.secondaryPanelController,
  });

  final PanelController primaryPanelController;
  final PanelController secondaryPanelController;

  static const slideDuration = Duration(milliseconds: 800);
  static const slideCurve = Curves.easeInOutQuint;

  void openSecondaryPanel() {
    if (primaryPanelController.isPanelOpen) {
      primaryPanelController.animatePanelToSnapPoint(
        duration: slideDuration,
        curve: slideCurve,
      );
    }
    secondaryPanelController.open();
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  const CustomScrollBehavior(this._scrollController);

  final ScrollController _scrollController;

  bool get atEdge => _scrollController.position.atEdge;
  bool get zeroPosition => _scrollController.position.pixels == 0;
  bool get isTop => atEdge && zeroPosition;
  ScrollDirection get direction =>
      _scrollController.position.userScrollDirection;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    logger.debug('getScrollPhysics');
    return const AlwaysScrollableScrollPhysics();
    // if (!_scrollController.hasClients) {
    //   return const AlwaysScrollableScrollPhysics();
    // }
    // if (isTop && direction == ScrollDirection.reverse) {
    //   return const NeverScrollableScrollPhysics();
    // }
    // return const AlwaysScrollableScrollPhysics();
  }
}
