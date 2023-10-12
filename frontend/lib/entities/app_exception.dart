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
  permissionDenied,
  notFound,
}

enum Domain {
  none,
  auth,
  user,
  message,
  messageChangedEvent,
}

extension DomainExtension on Domain {
  String get name {
    switch (this) {
      case Domain.none:
        return '';
      case Domain.auth:
        return 'Auth';
      case Domain.user:
        return 'User';
      case Domain.message:
        return 'Message';
      case Domain.messageChangedEvent:
        return 'MessageChangedEvent';
    }
  }
}

enum Field {
  none,
  id,
}
