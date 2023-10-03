import 'package:flutter/material.dart';
import 'package:otomo/tools/uuid.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlideUpPanelAndDraggableScrollableSheet extends StatefulWidget {
  const SlideUpPanelAndDraggableScrollableSheet({super.key});

  @override
  State<SlideUpPanelAndDraggableScrollableSheet> createState() =>
      _SlideUpPanelAndDraggableScrollableSheetState();
}

class _SlideUpPanelAndDraggableScrollableSheetState
    extends State<SlideUpPanelAndDraggableScrollableSheet> {
  late final DraggableScrollableController _scrollController;

  void _onScrollReady(DraggableScrollableController controller) {
    _scrollController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return _Home(
      onScrollReady: _onScrollReady,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _scrollController.animateTo(
                0.95,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuint,
              ),
              child: Text('Secondary'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home({
    super.key,
    required this.body,
    this.onScrollReady,
  });

  final Widget body;
  final void Function(DraggableScrollableController)? onScrollReady;

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  final _scrollController = DraggableScrollableController();

  @override
  void initState() {
    widget.onScrollReady?.call(_scrollController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            minHeight: 100,
            maxHeight: size.height * 0.95,
            body: widget.body,
            panel: Container(
              color: Colors.red,
            ),
            snapPoint: 0.35,
          ),
          DraggableScrollableSheet(
            controller: _scrollController,
            initialChildSize: 0.0,
            maxChildSize: 0.95,
            minChildSize: 0.0,
            snapSizes: [0.45],
            snap: true,
            builder: (context, controller) {
              // return SingleChildScrollView(
              //   controller: controller,
              //   child: Container(
              //     color: Colors.blue,
              //     child: Column(
              //       children: [
              //         ...ListTile.divideTiles(
              //           tiles: [
              //             ListTile(title: Text(uuid())),
              //             ListTile(title: Text(uuid())),
              //             ListTile(title: Text(uuid())),
              //           ],
              //           context: context,
              //         ).toList(),
              //       ],
              //     ),
              //   ),
              // );
              // // bottomがoverflowする。
              return Container(
                color: Colors.green,
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    SliverAppBar(
                      title: Text('SliverAppBar'),
                      expandedHeight: 80,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SliverList.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(uuid()),
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Container(
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
