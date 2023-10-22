import 'package:freezed_annotation/freezed_annotation.dart';
part 'otomo.freezed.dart';
part 'otomo.g.dart';

@freezed
class Otomo with _$Otomo {
  const Otomo._();
  @JsonSerializable(explicitToJson: true)
  const factory Otomo({
    required String userId,
    required OtomoProfile profile,
  }) = _Otomo;

  factory Otomo.fromJson(Map<String, dynamic> json) => _$OtomoFromJson(json);
}

@freezed
class OtomoProfile with _$OtomoProfile {
  const OtomoProfile._();
  const factory OtomoProfile({
    required String? language,
  }) = _OtomoProfile;

  factory OtomoProfile.fromJson(Map<String, dynamic> json) =>
      _$OtomoProfileFromJson(json);
}
