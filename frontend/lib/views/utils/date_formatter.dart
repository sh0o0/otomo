import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:otomo/views/utils/localizations.dart';

final class DateFormatter {
  DateFormatter._();

  static DateFormat date(BuildContext context) =>
      DateFormat.yMMMd(localeOf(context).languageCode);
}
