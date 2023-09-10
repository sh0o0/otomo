import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/view_models/boundary/message.dart';

class Converter {
  Converter._();

  static LatLng latLngToGoogle(AppLatLng ll) =>
      LatLng(ll.latitude, ll.longitude);

  static MessageData chatMessageToMessageData(chat.Message message) =>
      MessageData(
        id: message.id,
        role: chatUserToRole(message.author),
        sentAt: DateTime.fromMillisecondsSinceEpoch(message.createdAt!),
        remoteId: message.remoteId,
        status: chatStatusToMessageStatus(message.status!),
      );

  static List<chat.TextMessage> textMessageDataToChatTextMessageList(
    List<TextMessageData> messages,
  ) =>
      messages.map(textMessageDataToChatTextMessage).toList();

  static chat.TextMessage textMessageDataToChatTextMessage(
    TextMessageData textMessage,
  ) =>
      chat.TextMessage(
        id: textMessage.message.id,
        text: textMessage.text,
        author: roleToChatUser(textMessage.message.role),
        remoteId: textMessage.message.remoteId,
        createdAt: textMessage.message.sentAt.millisecondsSinceEpoch,
        status: messageStatusToChatStatus(textMessage.message.status),
      );

  static chat.User roleToChatUser(Role role) => chat.User(id: role.toString());

  static Role chatUserToRole(chat.User user) {
    switch (user.id) {
      case 'user':
        return Role.user;
      case 'otomo':
        return Role.otomo;
      default:
        throw Exception('Unknown role: ${user.id}');
    }
  }

  static chat.Status messageStatusToChatStatus(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return chat.Status.sent;
      case MessageStatus.sending:
        return chat.Status.sending;
      case MessageStatus.error:
        return chat.Status.error;
    }
  }

  static MessageStatus chatStatusToMessageStatus(chat.Status status) {
    switch (status) {
      case chat.Status.sent:
        return MessageStatus.sent;
      case chat.Status.sending:
        return MessageStatus.sending;
      case chat.Status.error:
        return MessageStatus.error;
      default:
        throw Exception('Unknown status: $status');
    }
  }
}
