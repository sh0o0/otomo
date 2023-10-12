class AppException implements Exception {
  const AppException({
    this.message = '',
    this.cause = Cause.unknown,
    this.domain = Domain.none,
    this.field = Field.none,
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
  invalidArgument,
}

enum Domain {
  none,
  auth,
  user,
  message,
  messageChangedEvent,
  policiesAgreements,
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
      case Domain.policiesAgreements:
        return 'PoliciesAgreements';
    }
  }
}

enum Field {
  none,
  id,
  birthday,
}
