// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TextMessage _$$_TextMessageFromJson(Map<String, dynamic> json) =>
    _$_TextMessage(
      id: json['id'] as String,
      text: json['text'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      sentAt: const TimestampConverter().fromJson(json['sent_at'] as Timestamp),
    );

Map<String, dynamic> _$$_TextMessageToJson(_$_TextMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'role': _$RoleEnumMap[instance.role]!,
      'sent_at': const TimestampConverter().toJson(instance.sentAt),
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.otomo: 'otomo',
};
