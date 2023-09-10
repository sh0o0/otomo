import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/latlng.dart';

part 'place.freezed.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String name,
    required AppLatLng latLng,
  }) = _Place;
}
