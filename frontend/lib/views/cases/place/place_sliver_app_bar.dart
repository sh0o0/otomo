import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceSliverAppBar extends StatelessWidget {
  const PlaceSliverAppBar({
    super.key,
    required this.name,
    this.removeTopPadding = false,
  });

  final String name;
  final bool removeTopPadding;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: removeTopPadding,
      child: SliverAppBar(
        pinned: true,
        title: Align(
          alignment: Alignment.centerLeft,
          child: TitleLarge(name),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
