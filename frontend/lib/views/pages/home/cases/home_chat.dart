import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/cases/chat/chat_bottom_sheet_bar.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/utils/error_library.dart';
import 'package:otomo/views/utils/flutter.dart';

class HomeChat extends StatefulHookConsumerWidget {
  const HomeChat({
    super.key,
    this.onLeadingPressed,
    this.onTextFieldTap,
  });

  final VoidCallback? onLeadingPressed;
  final VoidCallback? onTextFieldTap;

  @override
  ConsumerState<HomeChat> createState() => _HomeChatState();
}

class _HomeChatState extends ConsumerState<HomeChat>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
          ? ErrorLibrary.messageLocationAnalysis
          : ErrorLibrary.fromAny(textMessage.message.error!)),
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
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    useEffect(() {
      afterBuildCallback(notifier.initState);
      return () {};
    }, const []);

    return Column(
      children: [
        SizedBox(
          height: 72,
          child: ChatBottomSheetBar(
            onLeadingPressed: widget.onLeadingPressed,
            remainingMessageSendCount: state.value?.remainingMessageSendCount,
          ),
        ),
        Expanded(
          child: ChatUI(
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
                      options: types.InputOptions(
                        onTextFieldTap: widget.onTextFieldTap,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
