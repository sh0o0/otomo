import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/lat_lng.dart';
part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location{
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Location({
    required String googlePlaceId,
    required String longName,
    required String shortName,
    required String address,
    required List<String> types,
    required Geometry geometry,
  }) = _Location;

 factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
class Geometry with _$Geometry{
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Geometry({
    required AppLatLng latLng,
  }) = _Geometry;

 factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
}
