import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/utils/error_library.dart';

class HomeChat extends HookConsumerWidget {
  const HomeChat({
    super.key,
    this.hideBottomSheet = false,
    this.inputOptions = const types.InputOptions(),
  });

  final bool hideBottomSheet;
  final types.InputOptions inputOptions;

  Widget _statusPopupBuilder(
    BuildContext context,
    MessageData message, {
    required List<TextMessageData> messages,
  }) {
    final textMessage = messages.firstWhere((m) => m.message.id == message.id);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: theme.colorScheme.background,
          borderRadius: BorderRadius.circular(16)),
      child: Text(textMessage.locationAnalysis.hasError
          ? ErrorLibrary.messageLocationAnalysisError
          : ErrorLibrary.fromAppException(textMessage.message.error!)),
    );
  }

  Widget? _emptyState(BuildContext context, AsyncValue<ChatState> state) {
    if (state.isLoading) const Center(child: AppCircularProgressIndicator());
    if (state.hasError) {
      return Center(child: ErrorText(ErrorLibrary.fromAny(state.error!)));
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await notifier.initState();
      });
      return () {};
    }, const []);

    return ChatUI(
      messages: state.value?.messages.items ?? [],
      isLastPage: state.value?.messages.hasMore == false,
      onSendPressed: (text) => notifier.sendMessage(text),
      user: ChatState.user,
      emptyState: _emptyState(context, state),
      onEndReached: () => notifier.listMessagesMore(),
      onMessageTap: (_, m) => notifier.toggleMessageActiveWithId(m.id),
      showStatusPopup: (message) => message.status == MessageStatus.error,
      statusPopupBuilder: (context, message) => _statusPopupBuilder(
        context,
        message,
        messages: state.value?.messages.items ?? [],
      ),
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
    );
  }
}
