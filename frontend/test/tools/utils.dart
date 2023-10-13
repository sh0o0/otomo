import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/domains/entities/app_exception.dart';

final _functionNameRegex = RegExp(r"'(.*?)'");

void exceptAppException(
  Object e, {
  Cause cause = Cause.unknown,
  Domain domain = Domain.none,
  Field field = Field.none,
}) {
  expect(
    true,
    e is AppException &&
        e.cause == cause &&
        e.domain == domain &&
        e.field == field,
  );
}
