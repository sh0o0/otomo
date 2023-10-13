import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class AppLatLng with _$AppLatLng {
  const AppLatLng._();
  const factory AppLatLng({
    required double latitude,
    required double longitude,
  }) = _AppLatLng;

  factory AppLatLng.fromJson(Map<String, dynamic> json) =>
      _$AppLatLngFromJson(json);
}

extension AppLatLngListExtension on Iterable<AppLatLng> {
  AppLatLng? center() {
    if (isEmpty) return null;

    double lat = 0;
    double lng = 0;

    for (final ll in this) {
      lat += ll.latitude;
      lng += ll.longitude;
    }

    final len = length;
    return AppLatLng(latitude: lat / len, longitude: lng / len);
  }

  Region? edge() {
    if (isEmpty) return null;

    double northeastLat = first.latitude;
    double northeastLng = first.longitude;
    double southwestLat = first.latitude;
    double southwestLng = first.longitude;

    for (final ll in this) {
      if (northeastLat < ll.latitude) {
        northeastLat = ll.latitude;
      }
      if (northeastLng < ll.longitude) {
        northeastLng = ll.longitude;
      }
      if (southwestLat > ll.latitude) {
        southwestLat = ll.latitude;
      }
      if (southwestLng > ll.longitude) {
        southwestLng = ll.longitude;
      }
    }

    return Region(
      northeast: AppLatLng(latitude: northeastLat, longitude: northeastLng),
      southwest: AppLatLng(latitude: southwestLat, longitude: southwestLng),
    );
  }
}

@freezed
class Position with _$Position {
  const factory Position({
    required AppLatLng latLng,
  }) = _Position;
}

@freezed
class Region with _$Region {
  const Region._();
  const factory Region({
    required AppLatLng northeast,
    required AppLatLng southwest,
  }) = _Region;

  bool isIn(AppLatLng latlng) {
    // 赤道で180 -> -180に変わるので、範囲内にあるのに範囲外扱いになってしまう。
    // 赤道を跨いでいる時、northeast.longitude = 180 + (180 - northeast.longitude)
    final northeastlng = southwest.longitude > northeast.longitude
        ? 360 + northeast.longitude
        : northeast.longitude;

    final result = latlng.latitude < northeast.latitude &&
        latlng.latitude > southwest.latitude &&
        latlng.longitude < northeastlng &&
        latlng.longitude > southwest.longitude;
    return result;
  }
}
