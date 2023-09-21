import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/lat_lng.dart';
part 'region.freezed.dart';

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
