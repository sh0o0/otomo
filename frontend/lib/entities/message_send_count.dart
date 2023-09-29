import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/date.dart';
part 'message_send_count.freezed.dart';
part 'message_send_count.g.dart';

@freezed
class MessageSentCount with _$MessageSentCount {
  const factory MessageSentCount({
    required MonthlySurplusMessageSentCount monthlySurplus,
    required DailyMessageSentCount daily,
  }) = _MessageSentCount;

  factory MessageSentCount.fromJson(Map<String, dynamic> json) =>
      _$MessageSentCountFromJson(json);
}

@freezed
class MonthlySurplusMessageSentCount with _$MonthlySurplusMessageSentCount {
  const factory MonthlySurplusMessageSentCount({
    required YearMonth yearMonth,
    required int count,
  }) = _MonthlySurplusMessageSentCount;

  factory MonthlySurplusMessageSentCount.fromJson(Map<String, dynamic> json) =>
      _$MonthlySurplusMessageSentCountFromJson(json);
}

@freezed
class DailyMessageSentCount with _$DailyMessageSentCount {
  const factory DailyMessageSentCount({
    required Date date,
    required int count,
  }) = _DailyMessageSentCount;

  factory DailyMessageSentCount.fromJson(Map<String, dynamic> json) =>
      _$DailyMessageSentCountFromJson(json);
}

@freezed
class RemainingMessageSendCount with _$RemainingMessageSendCount {
  const factory RemainingMessageSendCount({
    required RemainingMonthlySurplusMessageSendCount monthlySurplus,
    required RemainingDailyMessageSendCount daily,
  }) = _RemainingMessageSendCount;
  factory RemainingMessageSendCount.fromJson(Map<String, dynamic> json) =>
      _$RemainingMessageSendCountFromJson(json);
}

@freezed
class RemainingMonthlySurplusMessageSendCount
    with _$RemainingMonthlySurplusMessageSendCount {
  const factory RemainingMonthlySurplusMessageSendCount({
    required YearMonth yearMonth,
    required int count,
  }) = _RemainingMonthlySurplusMessageSendCount;
  factory RemainingMonthlySurplusMessageSendCount.fromJson(
          Map<String, dynamic> json) =>
      _$RemainingMonthlySurplusMessageSendCountFromJson(json);
}

@freezed
class RemainingDailyMessageSendCount with _$RemainingDailyMessageSendCount {
  const factory RemainingDailyMessageSendCount({
    required Date date,
    required int count,
  }) = _RemainingDailyMessageSendCount;
  factory RemainingDailyMessageSendCount.fromJson(Map<String, dynamic> json) =>
      _$RemainingDailyMessageSendCountFromJson(json);
}
