class AppException implements Exception {
  AppException({
    required this.message,
    required this.cause,
    required this.domain,
    required this.field,
  });
  final String message;
  final Cause cause;
  final Domain domain;
  final Field field;

  @override
  String toString() {
    return 'AppException(message: $message, cause: $cause, domain: $domain, field: $field)';
  }
}

enum Cause {
  requiresRecentLogin,
}

enum Domain {
  none,
  auth,
}

enum Field {
  none,
}
