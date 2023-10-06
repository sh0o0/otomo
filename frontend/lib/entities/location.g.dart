// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      googlePlaceId: json['google_place_id'] as String,
      address: json['address'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'google_place_id': instance.googlePlaceId,
      'address': instance.address,
      'types': instance.types,
      'geometry': instance.geometry,
    };

_$GeometryImpl _$$GeometryImplFromJson(Map<String, dynamic> json) =>
    _$GeometryImpl(
      latLng: AppLatLng.fromJson(json['lat_lng'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeometryImplToJson(_$GeometryImpl instance) =>
    <String, dynamic>{
      'lat_lng': instance.latLng,
    };
