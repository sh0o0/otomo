import 'package:logger/logger.dart' as l;

var logger = Logger();

class Logger {
// TODO: Set log level
  final _l = l.Logger();

  void debug(String message) => _l.d(message);
  void info(String message) => _l.i(message);
  void warn(String message) => _l.w(message);
  void error(String message) => _l.e(message);
}
