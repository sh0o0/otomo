// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otomo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtomoImpl _$$OtomoImplFromJson(Map<String, dynamic> json) => _$OtomoImpl(
      userId: json['user_id'] as String,
      profile: Otomo.profileFromJson(json['profile'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$OtomoImplToJson(_$OtomoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'profile': instance.profile.toJson(),
    };

_$OtomoProfileImpl _$$OtomoProfileImplFromJson(Map<String, dynamic> json) =>
    _$OtomoProfileImpl(
      language: json['language'] as String?,
    );

Map<String, dynamic> _$$OtomoProfileImplToJson(_$OtomoProfileImpl instance) =>
    <String, dynamic>{
      'language': instance.language,
    };
