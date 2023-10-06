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

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: IntrinsicWidth(
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.map_rounded),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Open in Maps',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
