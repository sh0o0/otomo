import 'package:logger/logger.dart' as log;

var logger = Logger(level: log.Level.info);

void setNewLogger(Logger l) => logger = l;

class Logger {
  Logger({
    required log.Level level,
  }) : _logger = log.Logger(level: level);

  final log.Logger _logger;

  void debug(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _logger.d(message, stackTrace: stackTrace);
  void info(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _logger.i(message, stackTrace: stackTrace);
  void warn(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _logger.w(message, stackTrace: stackTrace);
  void error(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _logger.e(message, stackTrace: stackTrace);
}
