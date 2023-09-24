import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as types;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';

class HomeChat extends HookConsumerWidget {
  const HomeChat({
    super.key,
    this.hideBottomSheet = false,
    this.inputOptions = const types.InputOptions(),
  });

  final bool hideBottomSheet;
  final types.InputOptions inputOptions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    return ChatUI(
      messages: state.value?.messagesPage.items ?? [],
      onSendPressed: (text) => notifier.sendMessage(text),
      user: ChatState.user,
      emptyState: state.isLoading
          ? const Center(child: AppCircularProgressIndicator())
          : null,
      onEndReached: () => notifier.listMessagesMore(),
      onMessageTap: (_, m) => notifier.toggleMessageActiveWithId(m.id),
      // statusPopupBuilder: (context, message) {},
      onLocationTextTap: (loc) => notifier.focusAnalyzedLocation(loc),
      customBottomWidget: state.value?.hideTextField == true
          ? Spaces.zero
          : Animate(
              effects: const [
                FadeEffect(duration: Duration(milliseconds: 100)),
              ],
              child: types.Input(
                onSendPressed: (text) => notifier.sendMessage(text.text),
                options: inputOptions,
              ),
            ),
      onBackgroundTap: () => notifier.toggleShowOnlyMessages(),
    );
  }
}
