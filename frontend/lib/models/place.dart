import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/models/latlng.dart';

part 'place.freezed.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String name,
    required AppLatLng latLng,
  }) = _Place;
}
