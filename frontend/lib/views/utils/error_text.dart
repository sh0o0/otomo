import 'package:otomo/entities/exception.dart';

abstract class ErrorLibrary {
  static String fromAny(Object e) {
    if (e is AppException) return fromAppException(e);
    return unknown;
  }

  static String fromAppException(AppException e) {
    if (e.causeIs(Cause.unknown)) return unknown;
    if (e.causeIs(Cause.networkError)) return networkError;
    if (e.causeIs(Cause.requiresRecentLogin)) return requiresRecentLogin;
    return unknown;
  }

  static const String unknown = 'エラーが発生しました。';
  static const String networkError = 'ネットワークエラーが発生しました。';
  static const String requiresRecentLogin = '再ログインが必要です。';
  static const String messageLocationAnalysisError = '地名の解析に失敗しました。';
}
