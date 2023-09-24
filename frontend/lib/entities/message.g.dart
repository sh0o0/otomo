// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TextMessage _$$_TextMessageFromJson(Map<String, dynamic> json) =>
    _$_TextMessage(
      id: json['id'] as String,
      clientId: json['clientId'] as String?,
      text: json['text'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      sentAt: DateTime.parse(json['sentAt'] as String),
      locationAnalysis: LocationAnalysis.fromJson(
          json['locationAnalysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TextMessageToJson(_$_TextMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'text': instance.text,
      'role': _$RoleEnumMap[instance.role]!,
      'sentAt': instance.sentAt.toIso8601String(),
      'locationAnalysis': instance.locationAnalysis,
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
      analyzedAt: json['analyzedAt'] == null
          ? null
          : DateTime.parse(json['analyzedAt'] as String),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$_LocationAnalysisToJson(_$_LocationAnalysis instance) =>
    <String, dynamic>{
      'locations': instance.locations,
      'analyzedAt': instance.analyzedAt?.toIso8601String(),
      'error': instance.error,
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
