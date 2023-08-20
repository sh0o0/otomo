import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:otomo/views/cases/chat/chat_modal_ui_leading.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';
import 'package:otomo/views/cases/chat/chat_ui_app_bar.dart';
import 'package:uuid/uuid.dart';

class ModalChat extends StatelessWidget {
  const ModalChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatUIAppBar(
        leading: ChatModalUILeading(),
        online: true,
        title: 'Chat',
      ),
      body: ChatUI(
        messages: [],
        onSendPressed: (_) {},
        user: types.User(id: Uuid().v4()),
      ),
    );
  }
}
