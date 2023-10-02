import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Playground extends StatelessWidget {
  const Playground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomeWithTwiceSideUpPanel extends StatefulWidget {
  const HomeWithTwiceSideUpPanel({
    super.key,
    required this.body,
    required this.primaryPanel,
    required this.secondaryPanel,
  });

  final Widget body;
  final Widget primaryPanel;
  final Widget secondaryPanel;

  @override
  State<HomeWithTwiceSideUpPanel> createState() =>
      _HomeWithTwiceSideUpPanelState();
}

class _HomeWithTwiceSideUpPanelState extends State<HomeWithTwiceSideUpPanel> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      panel: widget.secondaryPanel,
      body: SlidingUpPanel(
        minHeight: 0,
        maxHeight: 0,
        panel: widget.primaryPanel,
        body: widget.body,
      ),
    );
  }
}
