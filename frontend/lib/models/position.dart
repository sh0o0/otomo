import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/models/latlng.dart';
part 'position.freezed.dart';

@freezed
class Position with _$Position{
  const factory Position({
    required AppLatLng latlng,
  }) = _Position;
}
