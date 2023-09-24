// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TextMessage _$$_TextMessageFromJson(Map<String, dynamic> json) =>
    _$_TextMessage(
      id: json['id'] as String,
      clientId: json['client_id'] as String?,
      text: json['text'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      sentAt: DateTime.parse(json['sent_at'] as String),
      locationAnalysis: LocationAnalysis.fromJson(
          json['location_analysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TextMessageToJson(_$_TextMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.clientId,
      'text': instance.text,
      'role': _$RoleEnumMap[instance.role]!,
      'sent_at': instance.sentAt.toIso8601String(),
      'location_analysis': instance.locationAnalysis,
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.otomo: 'otomo',
};

_$_LocationAnalysis _$$_LocationAnalysisFromJson(Map<String, dynamic> json) =>
    _$_LocationAnalysis(
      locations: (json['locations'] as List<dynamic>)
          .map((e) => AnalyzedLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      analyzedAt: json['analyzed_at'] == null
          ? null
          : DateTime.parse(json['analyzed_at'] as String),
    );

Map<String, dynamic> _$$_LocationAnalysisToJson(_$_LocationAnalysis instance) =>
    <String, dynamic>{
      'locations': instance.locations,
      'analyzed_at': instance.analyzedAt?.toIso8601String(),
    };

_$_AnalyzedLocation _$$_AnalyzedLocationFromJson(Map<String, dynamic> json) =>
    _$_AnalyzedLocation(
      text: json['text'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnalyzedLocationToJson(_$_AnalyzedLocation instance) =>
    <String, dynamic>{
      'text': instance.text,
      'location': instance.location,
    };
