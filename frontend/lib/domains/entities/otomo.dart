import 'package:freezed_annotation/freezed_annotation.dart';
part 'otomo.freezed.dart';
part 'otomo.g.dart';

@freezed
class Otomo with _$Otomo {
  const Otomo._();
  @JsonSerializable(explicitToJson: true)
  const factory Otomo({
    required String userId,
    @JsonKey(fromJson: Otomo.profileFromJson) required OtomoProfile profile,
  }) = _Otomo;

  static OtomoProfile profileFromJson(Map<String, dynamic>? json) =>
      json == null ? OtomoProfile.empty() : OtomoProfile.fromJson(json);

  factory Otomo.fromJson(Map<String, dynamic> json) => _$OtomoFromJson(json);
}

@freezed
class OtomoProfile with _$OtomoProfile {
  const OtomoProfile._();
  const factory OtomoProfile({
    @JsonKey(defaultValue: '') required String language,
  }) = _OtomoProfile;

  factory OtomoProfile.fromJson(Map<String, dynamic> json) =>
      _$OtomoProfileFromJson(json);
  factory OtomoProfile.empty() => const OtomoProfile(language: '');
}
