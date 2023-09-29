import 'package:freezed_annotation/freezed_annotation.dart';
part 'date.freezed.dart';
part 'date.g.dart';

@freezed
class Date with _$Date {
  Date._();
  const factory Date({
    required int year,
    required int month,
    required int day,
  }) = _Date;

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
  factory Date.empty() => const Date(year: 0, month: 0, day: 0);

  bool get isZero => year == 0 && month == 0 && day == 0;
}

@freezed
class YearMonth with _$YearMonth {
  YearMonth._();
  const factory YearMonth({
    required int year,
    required int month,
  }) = _YearMonth;

  factory YearMonth.fromJson(Map<String, dynamic> json) =>
      _$YearMonthFromJson(json);

  factory YearMonth.empty() => const YearMonth(year: 0, month: 0);

  bool get isZero => year == 0 && month == 0;
}
