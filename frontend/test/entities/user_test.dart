import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/entities/date.dart';
import 'package:otomo/entities/user.dart';

void main() {
  final now = DateTime.now();
  group('User class', () {
    group('age getter', () {
      test('should return 13 when birthday is 13 years ago', () {
        final birthday =
            Date(year: now.year - 13, month: now.month, day: now.day);
        final user = User(id: 'id', birthday: birthday);
        expect(user.age, 13);
      });
      test('should return 12 when birthday is 12 years ago', () {
        final birthday =
            Date(year: now.year - 12, month: now.month, day: now.day);
        final user = User(id: 'id', birthday: birthday);
        expect(user.age, 12);
      });
    });
  });
}
