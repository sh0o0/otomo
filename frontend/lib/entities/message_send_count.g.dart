// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_send_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageSentCount _$$_MessageSentCountFromJson(Map<String, dynamic> json) =>
    _$_MessageSentCount(
      monthlySurplus: MonthlySurplusMessageSentCount.fromJson(
          json['monthly_surplus'] as Map<String, dynamic>),
      daily:
          DailyMessageSentCount.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MessageSentCountToJson(_$_MessageSentCount instance) =>
    <String, dynamic>{
      'monthly_surplus': instance.monthlySurplus,
      'daily': instance.daily,
    };

_$_MonthlySurplusMessageSentCount _$$_MonthlySurplusMessageSentCountFromJson(
        Map<String, dynamic> json) =>
    _$_MonthlySurplusMessageSentCount(
      yearMonth: YearMonth.fromJson(json['year_month'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_MonthlySurplusMessageSentCountToJson(
        _$_MonthlySurplusMessageSentCount instance) =>
    <String, dynamic>{
      'year_month': instance.yearMonth,
      'count': instance.count,
    };

_$_DailyMessageSentCount _$$_DailyMessageSentCountFromJson(
        Map<String, dynamic> json) =>
    _$_DailyMessageSentCount(
      date: Date.fromJson(json['date'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_DailyMessageSentCountToJson(
        _$_DailyMessageSentCount instance) =>
    <String, dynamic>{
      'date': instance.date,
      'count': instance.count,
    };

_$_RemainingMessageSendCount _$$_RemainingMessageSendCountFromJson(
        Map<String, dynamic> json) =>
    _$_RemainingMessageSendCount(
      monthlySurplus: RemainingMonthlySurplusMessageSendCount.fromJson(
          json['monthly_surplus'] as Map<String, dynamic>),
      daily: RemainingDailyMessageSendCount.fromJson(
          json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RemainingMessageSendCountToJson(
        _$_RemainingMessageSendCount instance) =>
    <String, dynamic>{
      'monthly_surplus': instance.monthlySurplus,
      'daily': instance.daily,
    };

_$_RemainingMonthlySurplusMessageSendCount
    _$$_RemainingMonthlySurplusMessageSendCountFromJson(
            Map<String, dynamic> json) =>
        _$_RemainingMonthlySurplusMessageSendCount(
          yearMonth:
              YearMonth.fromJson(json['year_month'] as Map<String, dynamic>),
          count: json['count'] as int,
        );

Map<String, dynamic> _$$_RemainingMonthlySurplusMessageSendCountToJson(
        _$_RemainingMonthlySurplusMessageSendCount instance) =>
    <String, dynamic>{
      'year_month': instance.yearMonth,
      'count': instance.count,
    };

_$_RemainingDailyMessageSendCount _$$_RemainingDailyMessageSendCountFromJson(
        Map<String, dynamic> json) =>
    _$_RemainingDailyMessageSendCount(
      date: Date.fromJson(json['date'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_RemainingDailyMessageSendCountToJson(
        _$_RemainingDailyMessageSendCount instance) =>
    <String, dynamic>{
      'date': instance.date,
      'count': instance.count,
    };
