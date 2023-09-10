import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'latlng.freezed.dart';
part 'latlng.g.dart';

@freezed
class AppLatLng with _$AppLatLng{
  const AppLatLng._();
  const factory AppLatLng({
    required double latitude,
    required double longitude,
  }) = _AppLatLng;

  factory AppLatLng.fromJson(Map<String, dynamic> json) => _$AppLatLngFromJson(json);

  LatLng toGoogle() => LatLng(latitude, longitude);
}
