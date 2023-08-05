import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

abstract class BaseService {
  final Logger logger;

  BaseService(this.logger);

  Future<T> makeCall<T>(AsyncValueGetter<T> function) async {
    try {
      return await function();
    }
    //Here, it is possible to handle and proccess all kind of errors and exceptions.
    on DioException catch (exception) {
      logger.e(
        exception.message,
        error: exception.error,
        stackTrace: exception.stackTrace,
      );
      rethrow;
    } catch (exception, stacktrace) {
      logger.e(exception.toString(), stackTrace: stacktrace);
      rethrow;
    }
  }
}
