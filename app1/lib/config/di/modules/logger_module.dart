import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class LoggerModule {
  @singleton
  Logger logger() {
    const minLogLevel = kDebugMode ? Level.debug : Level.warning;
    return Logger(
      filter: ProductionFilter()..level = minLogLevel,
      printer: PrettyPrinter(
        methodCount: null,
      ),
    );
  }
}
