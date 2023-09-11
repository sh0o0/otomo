import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/lat_lng.dart';
part 'position.freezed.dart';

@freezed
class Position with _$Position{
  const factory Position({
    required AppLatLng latLng,
  }) = _Position;
}
