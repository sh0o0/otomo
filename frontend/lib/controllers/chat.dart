import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/controllers/converter.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_changed_event.dart';
import 'package:otomo/grpc/generated/chat_service_service.pbgrpc.dart';

@injectable
class ChatControllerImpl {
  ChatControllerImpl(this._chatService);

  final ChatServiceClient _chatService;

  Future<List<TextMessage>> listMessages(
    String userId,
    int? pageSize,
    String? pageStartAfterMessageId,
  ) async {
    final req = ChatService_ListMessagesRequest()
      ..userId = userId
      ..pageSize = pageSize ?? 0
      ..pageStartAfterMessageId = pageStartAfterMessageId ?? '';
    final resp = await _chatService.listMessages(req);
    return ControllerConverter.I.message
        .grpcToEntityList(resp.messages);
  }

  Stream<String> sendMessage(
    String text,
  ) {
    final req = ChatService_SendMessageRequest()..text = text;
    return _chatService.sendMessage(req).map((replyChunk) => replyChunk.text);
  }

  Stream<List<TextMessageChangedEvent>> messageChangedEventsStream({
    required String userId,
  }) =>
      FirebaseFirestore.instance
          .collection('versions/1/chats/$userId/messages')
          .snapshots()
          .map((event) => event.docChanges.map((e) {
                final data = e.doc.data();
                return TextMessageChangedEvent(
                  messageId: e.doc.id,
                  type: ControllerConverter.I.changedEventType
                      .firestoreToEntity(e.type),
                  data: data == null
                      ? null
                      : ControllerConverter.I.message
                          .firestoreJsonToEntity(data),
                );
              }).toList())
          .asBroadcastStream();
}
