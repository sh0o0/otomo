import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:otomo/view_models/home.dart';
import 'package:otomo/views/pages/chat/chat.dart';

const double _navBarHeight = 64.0;
const double _navBarRadius = _navBarHeight / 2;
const double _centerButtonBottom = 8.0;
const double _navHeight = _CenterButton.size + _centerButtonBottom;
const EdgeInsets _iconPadding = EdgeInsets.symmetric(horizontal: 16.0);

class BottomNav extends HookConsumerWidget {
  const BottomNav({
    super.key,
  });

  Widget _buildIconButtonPadding(BuildContext context, Widget icon) {
    return Padding(
      padding: _iconPadding,
      child: icon,
    );
  }

  Widget _buildBottomNavBar(
    BuildContext context,
    WidgetRef ref,
  ) {
    final theme = Theme.of(context);
    final navBarTheme = theme.bottomNavigationBarTheme;

    return Container(
      height: _navBarHeight,
      decoration: BoxDecoration(
        color: navBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(_navBarRadius),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onBackground.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: _buildBottomNavContent(context, ref),
    );
  }

  Widget _buildBottomNavContent(BuildContext context, WidgetRef ref) {
    final homeIndexNotifier = ref.read(homeIndexProvider.notifier);
    final currentHomeIndex = ref.watch(homeIndexProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIconButtonPadding(
          context,
          _IconButton(
            icon: Icons.travel_explore_rounded,
            selected: currentHomeIndex == 0,
            onTap: () => homeIndexNotifier.state = 0,
          ),
        ),
        const SizedBox(width: 72),
        _buildIconButtonPadding(
          context,
          _IconButton(
            icon: Icons.person_rounded,
            selected: currentHomeIndex == 1,
            onTap: () => homeIndexNotifier.state = 1,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: _navHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildBottomNavBar(context, ref),
          Positioned(
            bottom: _centerButtonBottom,
            child: _CenterButton(
              onTap: () => showBarModalBottomSheet(
                context: context,
                builder: (_) => const ModalChat(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _CenterButton extends StatelessWidget {
  const _CenterButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  static const double size = 72;

  @override
  Widget build(BuildContext context) {
    final navBarTheme = Theme.of(context).bottomNavigationBarTheme;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: navBarTheme.backgroundColor,
            ),
          ),
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: navBarTheme.backgroundColor,
              border: Border.all(
                color: navBarTheme.selectedItemColor!,
                width: 5,
              ),
              boxShadow: [
                BoxShadow(
                  color: navBarTheme.selectedItemColor!,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chat_rounded,
            color: navBarTheme.selectedItemColor,
          )
        ],
      ),
    );
  }
}


class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final navBarTheme = Theme.of(context).bottomNavigationBarTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: navBarTheme.selectedIconTheme!.size,
          color: selected
              ? navBarTheme.selectedIconTheme!.color
              : navBarTheme.unselectedIconTheme!.color,
        ),
      ),
    );
  }
}
