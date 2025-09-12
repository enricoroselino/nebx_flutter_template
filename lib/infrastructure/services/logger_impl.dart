import 'package:nebx_flutter_template/infrastructure/interfaces/logger.dart';
import 'package:logger/logger.dart';

class LoggerImpl implements ILogger {
  final Logger _logger;

  LoggerImpl()
    : _logger = Logger(
        printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 5,
          colors: true,
          printEmojis: true,
          dateTimeFormat: DateTimeFormat.dateAndTime,
        ),
      );

  @override
  void info(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  @override
  void debug(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  @override
  void warn(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  @override
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
