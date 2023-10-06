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
      placeExtraction: PlaceExtraction.fromJson(
          json['place_extraction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TextMessageImplToJson(_$TextMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.clientId,
      'text': instance.text,
      'role': _$RoleEnumMap[instance.role]!,
      'sent_at': instance.sentAt.toIso8601String(),
      'place_extraction': instance.placeExtraction,
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.otomo: 'otomo',
};

_$PlaceExtractionImpl _$$PlaceExtractionImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceExtractionImpl(
      places: (json['places'] as List<dynamic>)
          .map((e) => ExtractedPlace.fromJson(e as Map<String, dynamic>))
          .toList(),
      processedAt: json['processed_at'] == null
          ? null
          : DateTime.parse(json['processed_at'] as String),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$PlaceExtractionImplToJson(
        _$PlaceExtractionImpl instance) =>
    <String, dynamic>{
      'places': instance.places,
      'processed_at': instance.processedAt?.toIso8601String(),
      'error': instance.error,
    };

_$ExtractedPlaceImpl _$$ExtractedPlaceImplFromJson(Map<String, dynamic> json) =>
    _$ExtractedPlaceImpl(
      text: json['text'] as String,
      geocodedPlace: GeocodedPlace.fromJson(
          json['geocoded_place'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExtractedPlaceImplToJson(
        _$ExtractedPlaceImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'geocoded_place': instance.geocodedPlace,
    };

_$GeocodedPlaceImpl _$$GeocodedPlaceImplFromJson(Map<String, dynamic> json) =>
    _$GeocodedPlaceImpl(
      googlePlaceId: json['google_place_id'] as String,
      latLng: AppLatLng.fromJson(json['lat_lng'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeocodedPlaceImplToJson(_$GeocodedPlaceImpl instance) =>
    <String, dynamic>{
      'google_place_id': instance.googlePlaceId,
      'lat_lng': instance.latLng,
    };
