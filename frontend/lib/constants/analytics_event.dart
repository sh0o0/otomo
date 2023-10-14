// ignore_for_file: constant_identifier_names

enum AnalyticsEvents {
  google_map_opened,
  message_activated,
  message_deactivated,
}

extension AnalyticsEventsEx on AnalyticsEvents {
  String get name => toString().split('.').last;
}
