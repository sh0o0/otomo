import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/domains/entities/date.dart';
import 'package:otomo/domains/entities/user.dart';

void main() {
  final now = DateTime.now();
  group('BirthdayEx class', () {
    group('age getter', () {
      test('should return 13 when birthday is 13 years ago', () {
        final birthday =
            Date(year: now.year - 13, month: now.month, day: now.day);
        expect(birthday.age, 13);
      });
      test('should return 12 when birthday is 12 years ago', () {
        final birthday =
            Date(year: now.year - 12, month: now.month, day: now.day);
        expect(birthday.age, 12);
      });
    });
  });
}
