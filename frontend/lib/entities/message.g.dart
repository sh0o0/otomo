// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextMessageImpl _$$TextMessageImplFromJson(Map<String, dynamic> json) =>
    _$TextMessageImpl(
      id: json['id'] as String,
      clientId: json['client_id'] as String?,
      text: json['text'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      sentAt: DateTime.parse(json['sent_at'] as String),
      locationAnalysis: LocationAnalysis.fromJson(
          json['location_analysis'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TextMessageImplToJson(_$TextMessageImpl instance) =>
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

_$LocationAnalysisImpl _$$LocationAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationAnalysisImpl(
      locations: (json['locations'] as List<dynamic>)
          .map((e) => AnalyzedLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      analyzedAt: json['analyzed_at'] == null
          ? null
          : DateTime.parse(json['analyzed_at'] as String),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$LocationAnalysisImplToJson(
        _$LocationAnalysisImpl instance) =>
    <String, dynamic>{
      'locations': instance.locations,
      'analyzed_at': instance.analyzedAt?.toIso8601String(),
      'error': instance.error,
    };

_$AnalyzedLocationImpl _$$AnalyzedLocationImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyzedLocationImpl(
      text: json['text'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnalyzedLocationImplToJson(
        _$AnalyzedLocationImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'location': instance.location,
    };
