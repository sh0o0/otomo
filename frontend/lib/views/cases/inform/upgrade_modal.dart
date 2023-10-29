import 'package:flutter/material.dart';
import 'package:otomo/views/bases/screens/screen_barrier.dart';
import 'package:upgrader/upgrader.dart';

class UpgradeModal extends UpgradeCard {
  UpgradeModal(
      {Key? key, Upgrader? upgrader, margin = const EdgeInsets.all(4.0)})
      : super(key: key, upgrader: upgrader, margin: margin);

  @override
  Widget buildUpgradeCard(BuildContext context, UpgradeBaseState state) {
    return ScreenBarrier(
      child: Center(child: super.buildUpgradeCard(context, state)),
    );
  }
}
