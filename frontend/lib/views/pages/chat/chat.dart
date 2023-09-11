import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/cases/chat/chat_modal_ui_leading.dart';
import 'package:otomo/views/cases/chat/chat_ui_app_bar.dart';
import 'package:otomo/views/cases/chat/otomo_chat_ui.dart';

class ModalChat extends HookConsumerWidget {
  const ModalChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    return Scaffold(
      appBar: const ChatUIAppBar(
        leading: ChatModalUILeading(),
        online: true,
        title: 'Chat',
      ),
      body: ChatUI(
        messages: state.value?.messages ?? [],
        onSendPressed: (text) => notifier.sendMessage(text),
        user: state.value?.user ?? const Author(id: ''),
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
      ),
    );
  }
}
