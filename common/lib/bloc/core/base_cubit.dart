import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  final Logger logger;
  BaseCubit({
    required S initialState,
    required this.logger,
  }) : super(initialState);

  void handleError(String message);

  Future<void> makeCall(AsyncCallback callback) async {
    try {
      return await callback();
      //Here it is possible to handle and proccess errors and exception within bloc
      //And send parsed info for users
    } catch (exception, stacktrace) {
      logger.e(
        exception.toString(),
        stackTrace: stacktrace,
      );
      handleError(exception.toString());
    }
  }
}
