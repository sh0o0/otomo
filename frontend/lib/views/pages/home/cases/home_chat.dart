import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as types;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';
import 'package:otomo/views/utils/animation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomeChat extends StatefulHookConsumerWidget {
  const HomeChat({
    super.key,
    this.hideBottomSheet = false,
    this.inputOptions = const types.InputOptions(),
  });

  final bool hideBottomSheet;
  final types.InputOptions inputOptions;

  @override
  ConsumerState<HomeChat> createState() => _HomeChatState();
}

class _HomeChatState extends ConsumerState<HomeChat>
    with SingleTickerProviderStateMixin {
  final _scrollController = AutoScrollController();
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool get _isAnimationRunningForwardsOrComplete =>
      isAnimationRunningForwardsOrComplete(_animationController.status);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation =
        Tween<double>(begin: 0, end: 100).animate(_animationController);

    _scrollController.addListener(() {
      final scrollDirection = _scrollController.position.userScrollDirection;
      logger.debug(scrollDirection.toString());
      if (scrollDirection == ScrollDirection.reverse) {
        if (!_isAnimationRunningForwardsOrComplete) {
          _animationController.forward();
        }
      } else {
        if (_isAnimationRunningForwardsOrComplete) {
          _animationController.reverse();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    return ChatUI(
      messages: state.value?.messages ?? [],
      onSendPressed: (text) => notifier.sendMessage(text),
      user: ChatState.user,
      scrollController: _scrollController,
      emptyState: state.isLoading
          ? const Center(child: AppCircularProgressIndicator())
          : null,
      onEndReached: () => notifier.listMessagesMore(),
      onMessageTap: (_, m) => notifier.activateMessageWithId(m.id),
      onCustomTextTap: (customText) {
        final latLng = customText.latLng;
        if (latLng == null) return;
        notifier.focusPlace(Place(name: customText.text, latLng: latLng));
      },
      customBottomWidget: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: types.Input(
              onSendPressed: (text) => notifier.sendMessage(text.text),
              options: widget.inputOptions,
            ),
            // return state.value?.hideTextField == true
            //     ? Spaces.zero
          );
        },
      ),
      onBackgroundTap: () => notifier.toggleShowOnlyMessages(),
    );
  }
}
