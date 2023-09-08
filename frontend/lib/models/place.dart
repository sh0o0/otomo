import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'place.freezed.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String name,
    required AppLatLng latLng,
  }) = _Place;
}

@freezed
class AppLatLng with _$AppLatLng {
  const AppLatLng._();
  const factory AppLatLng({
    required double latitude,
    required double longitude,
  }) = _AppLatLng;

  LatLng toGoogle() => LatLng(latitude, longitude);
}

