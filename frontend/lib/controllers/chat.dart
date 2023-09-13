import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_event.dart';
import 'package:otomo/grpc/generated/chat_service_service.pbgrpc.dart';
import 'package:otomo/grpc/generated/message.pb.dart' as gMsg;

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
    return _toMessages(resp.messages);
  }

  Stream<String> sendMessage(
    String text,
  ) {
    final req = ChatService_SendMessageRequest()..text = text;
    return _chatService.sendMessage(req).map((replyChunk) => replyChunk.text);
  }

  Stream<List<TextMessageChangedEvent>> changedEventStream({
    required String userId,
  }) =>
      FirebaseFirestore.instance
          .collection('versions/1/chats/$userId/messages')
          .snapshots()
          .map((event) => event.docChanges.map((e) {
                final data = e.doc.data();
                return TextMessageChangedEvent(
                  messageId: e.doc.id,
                  type: _toChangedEventType(e.type),
                  data: data == null ? null : _firestoreJsonToMessage(data),
                );
              }).toList())
          .asBroadcastStream();

  List<TextMessage> _toMessages(List<gMsg.Message> messages) {
    return messages.map((e) => _toMessage(e)).toList();
  }

  TextMessage _toMessage(gMsg.Message message) {
    return TextMessage(
      id: message.id,
      text: message.text,
      role: _toRole(message.role),
      sentAt: message.sentAt.toDateTime(),
    );
  }

  TextMessage _firestoreJsonToMessage(Map<String, dynamic> json) {
    final sentAt = (json['sent_at'] as Timestamp).toDate();
    return TextMessage.fromJson(json..['sent_at'] = sentAt);
  }

  Role _toRole(gMsg.Role role) {
    switch (role) {
      case gMsg.Role.USER:
        return Role.user;
      case gMsg.Role.OTOMO:
        return Role.otomo;
      default:
        throw Exception('Unknown role: $role');
    }
  }

  MessageChangedEventType _toChangedEventType(DocumentChangeType type) {
    switch (type) {
      case DocumentChangeType.added:
        return MessageChangedEventType.added;
      case DocumentChangeType.modified:
        return MessageChangedEventType.modified;
      case DocumentChangeType.removed:
        return MessageChangedEventType.removed;
    }
  }
}
