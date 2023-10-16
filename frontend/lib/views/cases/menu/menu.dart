import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';

class AppPopupMenuButton<T> extends StatelessWidget {
  const AppPopupMenuButton({super.key, required this.itemBuilder});

  final PopupMenuItemBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: itemBuilder,
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  final Widget icon;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        Spaces.w16,
        title,
      ],
    );
  }
}

