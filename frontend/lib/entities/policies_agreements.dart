import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/date.dart';
import 'package:otomo/entities/user.dart';

part 'policies_agreements.freezed.dart';
part 'policies_agreements.g.dart';

@freezed
class PoliciesAgreements with _$PoliciesAgreements {
  const PoliciesAgreements._();
  const factory PoliciesAgreements({
    required String userId,
    @JsonKey(name: 'agreed_2023-10-11_at') required DateTime? agreed20231011At,
  }) = _PoliciesAgreements;

  factory PoliciesAgreements.disagree(String userId) => PoliciesAgreements(
        userId: userId,
        agreed20231011At: null,
      );
  factory PoliciesAgreements.fromJson(Map<String, dynamic> json) =>
      _$PoliciesAgreementsFromJson(json);

  bool get isAgreed => agreed20231011At != null;

  static bool canAgree(Date birthday) => birthday.age >= 13;
}
