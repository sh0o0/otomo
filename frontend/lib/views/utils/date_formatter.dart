import 'package:intl/intl.dart';
import 'package:otomo/constants/locales.dart';

final class DateFormatter {
  DateFormatter._();

  static final jaDate = DateFormat.yMMMd(Locales.ja.languageCode);
}
