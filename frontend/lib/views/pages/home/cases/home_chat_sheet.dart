import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/cases/chat/chat_auto_sized_draggable_scrollable_sheet.dart';
import 'package:otomo/views/cases/chat/chat_bottom_sheet_bar.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/utils/error_library.dart';
import 'package:otomo/views/utils/flutter.dart';

class HomeChatSheet extends StatefulHookConsumerWidget {
  const HomeChatSheet({
    super.key,
    required this.maxSheetSize,
    required this.minSheetSize,
    required this.initialSheetSize,
    this.snap = false,
    this.snapSizes,
    this.onSheetCreated,
    this.onLeadingPressed,
    this.onHeaderTap,
    this.onTextFieldTap,
  });

  final double maxSheetSize;
  final double minSheetSize;
  final double initialSheetSize;
  final bool snap;
  final List<double>? snapSizes;
  final void Function(DraggableScrollableController)? onSheetCreated;
  final VoidCallback? onLeadingPressed;
  final VoidCallback? onHeaderTap;
  final VoidCallback? onTextFieldTap;

  @override
  ConsumerState<HomeChatSheet> createState() => _HomeChatState();
}

class _HomeChatState extends ConsumerState<HomeChatSheet> {
  late final DraggableScrollableController _sheetController;

  void _onSheetCreated(DraggableScrollableController controller) {
    widget.onSheetCreated?.call(controller);
    _sheetController = controller;
    _sheetController.addListener(() {
      if (_sheetController.size < 0.5) {
        FlutterUtils.unfocus(context);
      }
    });
  }

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
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    useEffect(() {
      FlutterUtils.afterBuildCallback(notifier.initState);
      return () {};
    }, const []);

    return ChatAutoSizedDraggableScrollableSheet(
      initialChildSize: widget.initialSheetSize,
      minChildSize: widget.minSheetSize,
      maxChildSize: widget.maxSheetSize,
      snap: widget.snap,
      snapSizes: widget.snapSizes,
      onSheetCreated: _onSheetCreated,
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.onHeaderTap,
            child: SizedBox(
              height: 72,
              child: ChatBottomSheetBar(
                onLeadingPressed: widget.onLeadingPressed,
                remainingMessageSendCount:
                    state.value?.remainingMessageSendCount,
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              final bottomPadding = MediaQuery.paddingOf(context).bottom;
              final textFieldHeight = 100 + bottomPadding;
              final showTextField = constraints.maxHeight > textFieldHeight;
              return ChatUI(
                messages: state.value?.messages.items ?? [],
                isLastPage: state.value?.messages.hasMore == false,
                onSendPressed: (text) => notifier.sendMessage(text),
                user: ChatState.user,
                emptyState: _emptyState(context, state),
                onEndReached: () => notifier.listMessagesMore(),
                onMessageTap: (_, m) =>
                    notifier.toggleMessageActiveWithId(m.id),
                showStatusPopup: (message) =>
                    message.status == MessageStatus.error,
                statusPopupBuilder: (context, message) => _statusPopupBuilder(
                  context,
                  message,
                  messages: state.value?.messages.items ?? [],
                ),
                onLocationTextTap: (loc) => notifier.focusAnalyzedLocation(loc),
                customBottomWidget: Visibility(
                  visible: showTextField,
                  child: Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 100))
                    ],
                    child: types.Input(
                      onSendPressed: (text) => notifier.sendMessage(text.text),
                      options: types.InputOptions(
                        onTextFieldTap: widget.onTextFieldTap,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
