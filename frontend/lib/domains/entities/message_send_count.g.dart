// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_send_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageSentCountImpl _$$MessageSentCountImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageSentCountImpl(
      monthlySurplus: MonthlySurplusMessageSentCount.fromJson(
          json['monthly_surplus'] as Map<String, dynamic>),
      daily:
          DailyMessageSentCount.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MessageSentCountImplToJson(
        _$MessageSentCountImpl instance) =>
    <String, dynamic>{
      'monthly_surplus': instance.monthlySurplus,
      'daily': instance.daily,
    };

_$MonthlySurplusMessageSentCountImpl
    _$$MonthlySurplusMessageSentCountImplFromJson(Map<String, dynamic> json) =>
        _$MonthlySurplusMessageSentCountImpl(
          yearMonth:
              YearMonth.fromJson(json['year_month'] as Map<String, dynamic>),
          count: json['count'] as int,
        );

Map<String, dynamic> _$$MonthlySurplusMessageSentCountImplToJson(
        _$MonthlySurplusMessageSentCountImpl instance) =>
    <String, dynamic>{
      'year_month': instance.yearMonth,
      'count': instance.count,
    };

_$DailyMessageSentCountImpl _$$DailyMessageSentCountImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyMessageSentCountImpl(
      date: Date.fromJson(json['date'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$DailyMessageSentCountImplToJson(
        _$DailyMessageSentCountImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'count': instance.count,
    };

_$RemainingMessageSendCountImpl _$$RemainingMessageSendCountImplFromJson(
        Map<String, dynamic> json) =>
    _$RemainingMessageSendCountImpl(
      monthlySurplus: RemainingMonthlySurplusMessageSendCount.fromJson(
          json['monthly_surplus'] as Map<String, dynamic>),
      daily: RemainingDailyMessageSendCount.fromJson(
          json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RemainingMessageSendCountImplToJson(
        _$RemainingMessageSendCountImpl instance) =>
    <String, dynamic>{
      'monthly_surplus': instance.monthlySurplus,
      'daily': instance.daily,
    };

_$RemainingMonthlySurplusMessageSendCountImpl
    _$$RemainingMonthlySurplusMessageSendCountImplFromJson(
            Map<String, dynamic> json) =>
        _$RemainingMonthlySurplusMessageSendCountImpl(
          yearMonth:
              YearMonth.fromJson(json['year_month'] as Map<String, dynamic>),
          count: json['count'] as int,
        );

Map<String, dynamic> _$$RemainingMonthlySurplusMessageSendCountImplToJson(
        _$RemainingMonthlySurplusMessageSendCountImpl instance) =>
    <String, dynamic>{
      'year_month': instance.yearMonth,
      'count': instance.count,
    };

_$RemainingDailyMessageSendCountImpl
    _$$RemainingDailyMessageSendCountImplFromJson(Map<String, dynamic> json) =>
        _$RemainingDailyMessageSendCountImpl(
          date: Date.fromJson(json['date'] as Map<String, dynamic>),
          count: json['count'] as int,
        );

Map<String, dynamic> _$$RemainingDailyMessageSendCountImplToJson(
        _$RemainingDailyMessageSendCountImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'count': instance.count,
    };
