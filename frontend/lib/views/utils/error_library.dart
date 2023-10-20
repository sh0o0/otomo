import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:otomo/configs/l10n/app_localizations.dart';
import 'package:otomo/constants/firebase_exception_code.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/views/utils/localizations.dart';

abstract class ErrorLibrary {
  static String fromAnyOf(BuildContext context, Object error) =>
      _fromAny(error, l10n: context.l10n);

  static String _fromAny(
    Object error, {
    required AppLocalizations l10n,
  }) {
    if (error is AppException) return _fromAppException(error, l10n: l10n);
    if (error is SocketException) {
      return _fromSocketException(error, l10n: l10n);
    }
    if (error is GrpcError) return _fromGrpcError(error, l10n: l10n);
    if (error is FirebaseAuthException) {
      return _fromFirebaseAuthException(error, l10n: l10n);
    }
    return l10n.errorUnauthenticated;
  }

  static String _fromAppException(
    AppException e, {
    required AppLocalizations l10n,
  }) {
    if (e.causeIs(Cause.unknown)) return l10n.errorUnknown;
    if (e.causeIs(Cause.networkError)) return l10n.errorNetwork;
    if (e.causeIs(Cause.requiresRecentLogin)) {
      return l10n.errorRequiresRecentLogin;
    }
    return l10n.errorUnknown;
  }

  static String _fromSocketException(
    SocketException e, {
    required AppLocalizations l10n,
  }) {
    return l10n.errorNetwork;
  }

  static String _fromGrpcError(
    GrpcError e, {
    required AppLocalizations l10n,
  }) {
    final detail = e.details?.isEmpty == true ? null : e.details![0];

    switch (e.code) {
      case StatusCode.invalidArgument:
        return l10n.errorInvalidArgument;
      case StatusCode.notFound:
        return l10n.errorNotFound;
      case StatusCode.alreadyExists:
        return l10n.errorAlreadyExist;
      case StatusCode.permissionDenied:
        return l10n.errorPermissionDenied;
      case StatusCode.unauthenticated:
        return l10n.errorUnauthenticated;
      case StatusCode.resourceExhausted:
        if (detail == null) return l10n.errorUnknown;
        if (detail is ErrorInfo) {
          if (detail.domain == Domain.message.name) {
            return l10n.errorLimitSendMessage;
          }
        }
        return l10n.errorNetwork;
      default:
        return l10n.errorNetwork;
    }
  }

  static String _fromFirebaseAuthException(
    FirebaseAuthException e, {
    required AppLocalizations l10n,
  }) {
    switch (e.code) {
      case FirebaseExceptionCode.requiresRecentLogin:
        return l10n.errorRequiresRecentLogin;
      case FirebaseExceptionCode.internalError:
      case FirebaseExceptionCode.networkRequestFailed:
        return l10n.errorNetwork;
      default:
        return l10n.errorUnknown;
    }
  }
}
