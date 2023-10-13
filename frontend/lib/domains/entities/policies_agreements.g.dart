// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policies_agreements.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoliciesAgreementsImpl _$$PoliciesAgreementsImplFromJson(
        Map<String, dynamic> json) =>
    _$PoliciesAgreementsImpl(
      userId: json['user_id'] as String,
      agreed20231011At: json['agreed_2023-10-11_at'] == null
          ? null
          : DateTime.parse(json['agreed_2023-10-11_at'] as String),
    );

Map<String, dynamic> _$$PoliciesAgreementsImplToJson(
        _$PoliciesAgreementsImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'agreed_2023-10-11_at': instance.agreed20231011At?.toIso8601String(),
    };
