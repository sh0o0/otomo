import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/cases/chat/chat_modal_ui_leading.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';
import 'package:otomo/views/cases/chat/chat_ui_app_bar.dart';

class ModalChat extends HookConsumerWidget {
  const ModalChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chat = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);

    return Scaffold(
      appBar: const ChatUIAppBar(
        leading: ChatModalUILeading(),
        online: true,
        title: 'Chat',
      ),
      body: ChatUI(
        messages: chat.value?.messages ?? [],
        onSendPressed: (message) => chatNotifier.sendMessage(message.text),
        user: chat.value?.user ?? const User(id: ''),
        emptyState: chat.isLoading
            ? const Center(child: AppCircularProgressIndicator())
            : null,
        onEndReached: () => chatNotifier.listMessagesMore(),
        onMessageTap: (_, m) => chatNotifier.activateMessage(m),
        onTapCustomText: (text) {
          final latLng = text.latLng;
          if (latLng == null) return;

          chatNotifier.focusedPlaceController
              .add(Place(name: text.text, latLng: latLng));
        },
      ),
    );
  }
}
