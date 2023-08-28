import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum LoggingType {
  info,
  verbose,
  warning,
  error,
  wtf,
}

class AppLogger {
  static bool loggingEnabled = true;
  AppLogger._();
  static AppLogger? _instance;
  static Logger? _loggerInstance;
  static AppLogger get instance {
    if (_instance == null) {
      _instance = AppLogger._();
      _loggerInstance = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
        ),
      );
    }
    return _instance!;
  }

  // Blue text
  void _logInfo(Object? msg) {
    _loggerInstance!.i(msg);
  }

// Green text
  void _logVerbose(Object? msg) {
    _loggerInstance!.v(msg);
  }

// Yellow text
  void _logWarning(Object? msg) {
    _loggerInstance!.w(msg);
  }

// Red text
  void _logError(Object? msg) {
    _loggerInstance!.e(msg);
  }

// Red text
  void _logWtf(Object? msg) {
    _loggerInstance!.wtf(msg);
  }

  static log(Object? object, [LoggingType type = LoggingType.info]) {
    if (loggingEnabled && kDebugMode) {
      switch (type) {
        case LoggingType.info:
          instance._logInfo(object);
          break;
        case LoggingType.verbose:
          instance._logVerbose(object);
          break;
        case LoggingType.warning:
          instance._logWarning(object);
          break;
        case LoggingType.error:
          instance._logError(object);
          break;
        case LoggingType.wtf:
          instance._logWtf(object);
          break;
      }
    }
  }
}
