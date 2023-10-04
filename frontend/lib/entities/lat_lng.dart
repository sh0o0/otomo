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

class AppLatLngList extends Iterable<AppLatLng> {
  const AppLatLngList(this.list);

  final List<AppLatLng> list;

  @override
  Iterator<AppLatLng> get iterator => list.iterator;

  AppLatLng? center() {
    if (list.isEmpty) return null;

    double lat = 0;
    double lng = 0;

    for (final ll in list) {
      lat += ll.latitude;
      lng += ll.longitude;
    }

    final len = list.length;
    return AppLatLng(latitude: lat / len, longitude: lng / len);
  }

  Region? edge() {
    if (list.isEmpty) return null;

    final first = list.first;

    double northeastLat = first.latitude;
    double northeastLng = first.longitude;
    double southwestLat = first.latitude;
    double southwestLng = first.longitude;

    for (final ll in list) {
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
