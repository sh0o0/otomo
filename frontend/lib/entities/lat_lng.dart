import 'package:freezed_annotation/freezed_annotation.dart';

part 'lat_lng.freezed.dart';
part 'lat_lng.g.dart';

@freezed
class AppLatLng with _$AppLatLng {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const AppLatLng._();
  const factory AppLatLng({
    required double latitude,
    required double longitude,
  }) = _AppLatLng;

  factory AppLatLng.fromJson(Map<String, dynamic> json) =>
      _$AppLatLngFromJson(json);
}
