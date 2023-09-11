import 'package:injectable/injectable.dart';
import 'package:otomo/grpc/generated/chat_service_service.pbgrpc.dart';
import 'package:otomo/grpc/generated/message.pb.dart';
import 'package:otomo/entities/message.dart' as msg;

@injectable
class ChatControllerImpl {
  ChatControllerImpl(this._chatService);

  final ChatServiceClient _chatService;

  Future<List<msg.TextMessage>> listMessages(
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

  List<msg.TextMessage> _toMessages(List<Message> messages) {
    return messages.map((e) => _toMessage(e)).toList();
  }

  msg.TextMessage _toMessage(Message message) {
    return msg.TextMessage(
      id: message.id,
      text: message.text,
      role: _toRole(message.role),
      sentAt: message.sentAt.toDateTime(),
    );
  }

  msg.Role _toRole(Role role) {
    switch (role) {
      case Role.USER:
        return msg.Role.user;
      case Role.OTOMO:
        return msg.Role.otomo;
      default:
        throw Exception('Unknown role: $role');
    }
  }
}
