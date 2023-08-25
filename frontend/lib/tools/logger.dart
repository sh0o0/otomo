import 'package:logger/logger.dart' as l;
import 'package:otomo/configs/app_config.dart';

var logger = Logger();

class Logger {
  final _l = l.Logger(level: appConfig.logLevel);

  void debug(String message) => _l.d(message);
  void info(String message) => _l.i(message);
  void warn(String message) => _l.w(message);
  void error(String message) => _l.e(message);
}
