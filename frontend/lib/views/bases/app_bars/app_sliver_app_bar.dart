import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar({
    super.key,
    this.title = Spaces.zero,
    this.actions,
  });

  final Widget title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      scrolledUnderElevation: 2,
      automaticallyImplyLeading: false,
      shape: Border(bottom: BorderSide(color: theme.dividerColor)),
      title: title,
      actions: actions,
    );
  }
}
