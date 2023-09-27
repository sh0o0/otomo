import 'package:logger/logger.dart' as log;
import 'package:otomo/configs/app_config.dart';

var logger = Logger();

class Logger {
  final _l = log.Logger(level: appConfig.logLevel);

  void debug(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _l.d(message, stackTrace: stackTrace);
  void info(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _l.i(message, stackTrace: stackTrace);
  void warn(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _l.w(message, stackTrace: stackTrace);
  void error(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _l.e(message, stackTrace: stackTrace);
}
