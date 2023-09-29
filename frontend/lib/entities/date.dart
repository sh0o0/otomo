import 'package:freezed_annotation/freezed_annotation.dart';
part 'date.freezed.dart';
part 'date.g.dart';

@freezed
class Date with _$Date {
  const factory Date({
    required int year,
    required int month,
    required int day,
  }) = _Date;

  factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);
}

@freezed
class YearMonth with _$YearMonth {
  const factory YearMonth({
    required int year,
    required int month,
  }) = _YearMonth;

  factory YearMonth.fromJson(Map<String, dynamic> json) =>
      _$YearMonthFromJson(json);
}
