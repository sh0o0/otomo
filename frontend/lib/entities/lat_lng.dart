import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/region.dart';

part 'lat_lng.freezed.dart';
part 'lat_lng.g.dart';

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
