import 'app_logger.dart';
import 'package:logger/logger.dart';

class AppLoggerImp implements AppLogger {
  final logger = Logger();
  var appendList = <String>[];

  @override
  void debug(message, [error, StackTrace? stackTrace]) {
    logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(message, [error, StackTrace? stackTrace]) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  @override
  void info(message, [error, StackTrace? stackTrace]) {
    logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warn(message, [error, StackTrace? stackTrace]) {
    logger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void append(message) {
    appendList.add(message.toString());
  }

  @override
  void closeAppend() {
    info(appendList.join('\n'));
    appendList.clear();
  }
}
