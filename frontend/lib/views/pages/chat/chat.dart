import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_parsed_text/flutter_parsed_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/bases/indicators/app_circular_progress_indicator.dart';
import 'package:otomo/views/cases/chat/chat_modal_ui_leading.dart';
import 'package:otomo/views/cases/chat/otomo_chat_ui.dart';
import 'package:otomo/views/cases/chat/chat_ui_app_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ModalChat extends HookConsumerWidget {
  const ModalChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(chatProvider);
    final notifier = ref.read(chatProvider.notifier);

    return Scaffold(
      appBar: const ChatUIAppBar(
        leading: ChatModalUILeading(),
        online: true,
        title: 'Chat',
      ),
      body: OtomoChatUI(
        messages: state.value?.messages ?? [],
        onSendPressed: (text) => notifier.sendMessage(text),
        emptyState: state.isLoading
            ? const Center(child: AppCircularProgressIndicator())
            : null,
        onEndReached: () => notifier.listMessagesMore(),
        onMessageTap: (_, m) => notifier.activateMessageWithId(m.id),
        textMessageOptions: TextMessageOptions(
          isTextSelectable: false,
          onLinkPressed: launchUrlString,
          matchers: [
            MatchText(
              pattern: CustomText.regExp.pattern,
              onTap: (text) {
                final customText = CustomText.fromFirstMatch(text);
                final latLng = customText.latLng;
                if (latLng == null) return;

                notifier.focusedPlaceController
                    .add(Place(name: customText.text, latLng: latLng));
              },
              renderWidget: ({required pattern, required text}) {
                final customText = CustomText.fromFirstMatch(text);
                return RichText(
                  text: TextSpan(
                    text: customText.text,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.primary),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
