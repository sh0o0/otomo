import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:otomo/viewmodels/home/home.dart';
import 'package:otomo/views/pages/chat/chat.dart';

const double _navBarHeight = 64.0;
const double _navBarRadius = _navBarHeight / 2;
const double _centerButtonSize = 72.0;
const double _centerButtonBottom = 8.0;
const double _navHeight = _centerButtonSize + _centerButtonBottom;
const EdgeInsets _iconPadding = EdgeInsets.symmetric(horizontal: 16.0);

class BottomNavigation extends HookConsumerWidget {
  const BottomNavigation({
    super.key,
  });

  Widget _buildIconPadding(BuildContext context, Widget icon) {
    return Padding(
      padding: _iconPadding,
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarTheme = Theme.of(context).bottomNavigationBarTheme;
    final homeIndexNotifier = ref.read(homeIndexProvider.notifier);
    final currentHomeIndex = ref.watch(homeIndexProvider);

    return SizedBox(
      height: _navHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: _navBarHeight,
            decoration: BoxDecoration(
              color: navBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(_navBarRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildIconPadding(
                  context,
                  _NavButton(
                    icon: Icons.travel_explore_rounded,
                    isSelected: currentHomeIndex == 0,
                    onTap: () => homeIndexNotifier.state = 0,
                  ),
                ),
                const SizedBox(width: 72),
                _buildIconPadding(
                  context,
                  _NavButton(
                    icon: Icons.person_rounded,
                    isSelected: currentHomeIndex == 1,
                    onTap: () => homeIndexNotifier.state = 1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: _centerButtonBottom,
            child: _CenterButton(
              onTap: () => showBarModalBottomSheet(
                context: context,
                builder: (_) => const Chat(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final bool isSelected;
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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? navBarTheme.selectedItemColor
              : navBarTheme.unselectedItemColor,
        ),
        child: Icon(
          icon,
          size: navBarTheme.selectedIconTheme!.size,
          color: isSelected
              ? navBarTheme.selectedIconTheme!.color
              : navBarTheme.unselectedIconTheme!.color,
        ),
      ),
    );
  }
}

class _CenterButton extends StatelessWidget {
  const _CenterButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final navBarTheme = Theme.of(context).bottomNavigationBarTheme;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: _centerButtonSize,
            width: _centerButtonSize,
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
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chat_rounded,
            color: navBarTheme.unselectedIconTheme!.color,
          )
        ],
      ),
    );
  }
}
