import 'package:freezed_annotation/freezed_annotation.dart';
part 'policies_agreements.freezed.dart';
part 'policies_agreements.g.dart';

@freezed
class PoliciesAgreements with _$PoliciesAgreements {
  const PoliciesAgreements._();
  const factory PoliciesAgreements({
    required String userId,
    @JsonKey(name: 'agreed_2023-10-11_at') required DateTime? agreed20231011At,
  }) = _PoliciesAgreements;

  factory PoliciesAgreements.fromJson(Map<String, dynamic> json) =>
      _$PoliciesAgreementsFromJson(json);

  bool get isAllAgreed => agreed20231011At != null;
}
