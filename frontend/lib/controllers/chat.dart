import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/boundary/chat.dart';
import 'package:otomo/controllers/converter.dart';
import 'package:otomo/controllers/pagination.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/message_changed_event.dart';
import 'package:otomo/grpc/generated/chat_service.pbgrpc.dart';
import 'package:otomo/grpc/generated/google/protobuf/wrappers.pb.dart';

@injectable
class ChatControllerImpl {
  ChatControllerImpl(this._chatService);

  final ChatServiceClient _chatService;

  Future<Pagination<TextMessage>> listMessages(
    String userId,
    int? pageSize,
    String? pageStartAfterMessageId,
  ) async {
    final req = ChatService_ListMessagesRequest()
      ..userId = userId
      ..pageSize = pageSize ?? 0
      ..pageStartAfterMessageId = pageStartAfterMessageId ?? '';
    final resp = await _chatService.listMessages(req);
    return Pagination(
      items: ControllerConverter.I.message.grpcToEntityList(resp.messages),
      hasMore: resp.hasMore,
    );
  }

  Future<SendMessageOutput> sendMessage({
    required String userId,
    required String text,
    String? clientId,
  }) async {
    final clientIdVal = StringValue();
    if (clientId != null) {
      clientIdVal.value = clientId;
    }

    final req = ChatService_SendMessageRequest()
      ..userId = userId
      ..text = text
      ..clientId = clientIdVal;
    final resp = await _chatService.sendMessage(req);
    return SendMessageOutput.fromResponse(resp);
  }

  Stream<TextMessageChunk> messagingStream({
    required String userId,
  }) =>
      _chatService
          .messagingStream(
            ChatService_MessagingStreamRequest()..userId = userId,
          )
          .map((event) =>
              ControllerConverter.I.messageChunk.grpcToEntity(event.chunk))
          .asBroadcastStream();

  Stream<List<TextMessageChangedEvent>> recentMessageChangedEventsStream({
    required String userId,
  }) =>
      getIt<FirebaseFirestore>()
          .collection('versions/1/chats/$userId/messages')
          .where('sent_at', isGreaterThan: Timestamp.now())
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

  Future<GetRemainingMessageSendCountOutput> getRemainingMessageSendCount(
    String userId,
  ) async {
    final req = ChatService_GetRemainingSendCountRequest()..userId = userId;
    final resp = await _chatService.getRemainingSendCount(req);
    return GetRemainingMessageSendCountOutput.fromResponse(resp);
  }
}
