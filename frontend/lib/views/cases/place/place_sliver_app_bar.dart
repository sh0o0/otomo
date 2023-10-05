import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceSliverAppBar extends StatelessWidget {
  const PlaceSliverAppBar({
    super.key,
    required this.name,
    this.removeTopSafePadding = false,
    this.onClosePressed,
  });

  final String name;
  final bool removeTopSafePadding;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    const leadingWidth = 52;
    final size = MediaQuery.of(context).size;
    final titleWidth = size.width - leadingWidth;

    final textPainter = TextPainter(
      text: TextSpan(text: name, style: HeadlineMedium.styleOf(context)),
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: titleWidth - 24);
    final titleHeight = textPainter.height + 12;

    return MediaQuery.removePadding(
      context: context,
      removeTop: removeTopSafePadding,
      child: SliverAppBar(
        pinned: true,
        expandedHeight: titleHeight,
        flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1,
          titlePadding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
          title: Align(
            alignment: Alignment.topLeft,
            child: LayoutBuilder(builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width - leadingWidth,
                  maxHeight: titleWidth,
                ),
                child: HeadlineMedium(
                  name,
                  overflow: constraints.maxHeight == 40
                      ? TextOverflow.ellipsis
                      : null,
                ),
              );
            }),
          ),
        ),
        actions: onClosePressed != null
            ? [
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: onClosePressed,
                ),
              ]
            : null,
      ),
    );
  }
}
