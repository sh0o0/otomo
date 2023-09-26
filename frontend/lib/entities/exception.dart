class AppException implements Exception {
  const AppException({
    required this.message,
    required this.cause,
    required this.domain,
    required this.field,
  });

  factory AppException.unknown(String message) => AppException(
        message: message,
        cause: Cause.unknown,
        domain: Domain.none,
        field: Field.none,
      );

  factory AppException.orUnknown(Object e) =>
      e is AppException ? e : AppException.unknown(e.toString());

  final String message;
  final Cause cause;
  final Domain domain;
  final Field field;

  bool causeIs(Cause c) => cause == c;

  @override
  String toString() {
    return 'AppException(message: $message, cause: $cause, domain: $domain, field: $field)';
  }
}

enum Cause {
  unknown,
  networkError,
  requiresRecentLogin,
}

enum Domain {
  none,
  auth,
}

enum Field {
  none,
}
