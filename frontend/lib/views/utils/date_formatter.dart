import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final class DateFormatter {
  DateFormatter._();

  static DateFormat date(BuildContext context) =>
      DateFormat.yMMMd(Localizations.localeOf(context).languageCode);
}
