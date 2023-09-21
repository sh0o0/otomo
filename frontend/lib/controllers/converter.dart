import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otomo/entities/changed_event.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/grpc/generated/message.pb.dart' as grpc_msg;

class ControllerConverter {
  ControllerConverter._();
  static final _instance = ControllerConverter._();
  static ControllerConverter get I => _instance;

  final message = _Message();
  final messageChunk = _MessageChunk();
  final changedEventType = _ChangedEventType();
}

class _Message {
  final _role = _Role();

  List<TextMessage> grpcToEntityList(List<grpc_msg.Message> messages) {
    return messages.map((e) => grpcToEntity(e)).toList();
  }

  TextMessage grpcToEntity(grpc_msg.Message message) {
    return TextMessage(
      id: message.id,
      text: message.text,
      role: _role.grpcToEntity(message.role),
      sentAt: message.sentAt.toDateTime(),
      clientId: message.clientId.hasValue() ? message.clientId.value : null,
    );
  }

  TextMessage firestoreJsonToEntity(Map<String, dynamic> json) {
    final sentAt = (json['sent_at'] as Timestamp).toDate();
    return TextMessage.fromJson(json..['sent_at'] = sentAt.toIso8601String());
  }
}

class _MessageChunk {
  final _role = _Role();

  TextMessageChunk grpcToEntity(grpc_msg.MessageChunk chunk) {
    return TextMessageChunk(
      messageId: chunk.messageId,
      text: chunk.text,
      role: _role.grpcToEntity(chunk.role),
      sentAt: chunk.sentAt.toDateTime(),
      clientId: chunk.clientId.hasValue() ? chunk.clientId.value : null,
      isLast: chunk.isLast,
    );
  }
}

class _ChangedEventType {
  ChangedEventType firestoreToEntity(DocumentChangeType type) {
    switch (type) {
      case DocumentChangeType.added:
        return ChangedEventType.added;
      case DocumentChangeType.modified:
        return ChangedEventType.modified;
      case DocumentChangeType.removed:
        return ChangedEventType.removed;
    }
  }
}

class _Role {
  Role grpcToEntity(grpc_msg.Role role) {
    switch (role) {
      case grpc_msg.Role.USER:
        return Role.user;
      case grpc_msg.Role.OTOMO:
        return Role.otomo;
      default:
        throw Exception('Unknown role: $role');
    }
  }
}
