import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:otomo/tools/faker.dart';
import 'package:otomo/tools/uuid.dart';
import 'package:otomo/views/cases/chat/chat_modal_ui_leading.dart';
import 'package:otomo/views/cases/chat/chat_ui.dart';
import 'package:otomo/views/cases/chat/chat_ui_app_bar.dart';

class SampleModal2 extends StatefulWidget {
  const SampleModal2({super.key});

  @override
  State<SampleModal2> createState() => _SampleModal2State();
}

class _SampleModal2State extends State<SampleModal2> {
  final user = types.User(id: uuid());
  final other = types.User(id: uuid());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Placeholder(),
        Positioned(
          bottom: 0,
          child: SizedBox(
            height: 100,
            child: Scaffold(
              appBar: const ChatUIAppBar(
                leading: ChatModalUILeading(),
                online: true,
                title: 'Chat',
              ),
              body: ChatUI(
                messages: [
                  types.TextMessage(
                    author: user,
                    id: uuid(),
                    text: defaultFaker.lorem.sentence(),
                  ),
                  types.TextMessage(
                    author: user,
                    id: uuid(),
                    text: defaultFaker.lorem.sentence(),
                  ),
                  types.TextMessage(
                    author: user,
                    id: uuid(),
                    text: defaultFaker.lorem.sentence(),
                  ),
                  types.TextMessage(
                    author: user,
                    id: uuid(),
                    text: defaultFaker.lorem.sentence(),
                  ),
                  types.TextMessage(
                    author: user,
                    id: uuid(),
                    text: defaultFaker.lorem.sentence(),
                  ),
                ],
                onSendPressed: (m) {},
                user: user,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
