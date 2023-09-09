import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:otomo/tools/faker.dart';
import 'package:otomo/tools/uuid.dart';

class SampleChat extends StatefulWidget {
  const SampleChat({super.key});

  @override
  State<SampleChat> createState() => _SampleChatState();
}

class _SampleChatState extends State<SampleChat> {
  final user = types.User(id: uuid());
  final other = types.User(id: uuid());

  @override
  Widget build(BuildContext context) {
    return Chat(
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
    );
  }
}
