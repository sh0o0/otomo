import 'package:flutter/material.dart';
import 'package:otomo/constants/analytics_event.dart';
import 'package:otomo/tools/analytics.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/menu/menu.dart';
import 'package:otomo/views/utils/launcher.dart';
import 'package:otomo/views/utils/localizations.dart';

class PlaceSliverAppBar extends StatefulWidget {
  const PlaceSliverAppBar({
    super.key,
    required this.name,
    required this.placeId,
    this.removeTopSafePadding = false,
    this.onClosePressed,
  });

  final String name;
  final String placeId;
  final bool removeTopSafePadding;
  final VoidCallback? onClosePressed;

  @override
  State<PlaceSliverAppBar> createState() => _PlaceSliverAppBarState();
}

class _PlaceSliverAppBarState extends State<PlaceSliverAppBar> {
  Widget _moreHoriz(BuildContext context) {
    return AppPopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          height: 40,
          onTap: () {
            Analytics.logEvent(
                event: AnalyticsEvents.google_map_opened,
                parameters: {
                  'place_id': widget.placeId,
                  'place_name': widget.name
                });
            Launcher.searchOnGoogleMap(
              query: widget.name,
              placeId: widget.placeId,
            );
          },
          child: MenuItem(
            icon: const Icon(Icons.map_rounded),
            title: Text(context.l10n.openOnGoogleMap),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const actionsWidth = 96;
    const titlePadding = 8.0;
    final size = MediaQuery.of(context).size;
    final titleWidth = size.width - actionsWidth - titlePadding;

    final textPainter = TextPainter(
      text: TextSpan(text: widget.name, style: HeadlineMedium.styleOf(context)),
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: titleWidth - 20);
    final titleHeight = textPainter.height + 16;

    return MediaQuery.removePadding(
      context: context,
      removeTop: widget.removeTopSafePadding,
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
                constraints: BoxConstraints(maxWidth: titleWidth),
                child: HeadlineMedium(
                  widget.name,
                  overflow: constraints.maxHeight == 40
                      ? TextOverflow.ellipsis
                      : null,
                ),
              );
            }),
          ),
        ),
        actions: [
          _moreHoriz(context),
          if (widget.onClosePressed != null)
            CloseButton(onPressed: widget.onClosePressed),
        ],
      ),
    );
  }
}
