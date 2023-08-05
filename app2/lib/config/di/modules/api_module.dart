import 'dart:convert';

import 'package:app2/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../env/env.dart';

@module
abstract class ApiModule {
  @singleton
  ApiClient apiClient() {
    return ApiClient(
      Dio()
        ..options.baseUrl = Env.baseUrl
        ..options.headers = {'Content-Type': 'application/json'}
        ..options.sendTimeout = const Duration(seconds: 10)
        ..options.connectTimeout = const Duration(seconds: 10)
        ..options.receiveTimeout = const Duration(seconds: 10)
        ..interceptors.add(
          LogInterceptor(
            requestBody: true,
            requestHeader: true,
            responseBody: true,
            responseHeader: true,
          ),
        )
        ..interceptors.add(
          //This interceptor is needed to convert application/x-javascript
          //to application/json, because this server do not provide application/json
          InterceptorsWrapper(
            onResponse: (response, handler) {
              if (response.requestOptions.method == HttpMethod.GET) {
                response.data = jsonDecode(response.data as String);
              }
              return handler.next(response);
            },
          ),
        ),
    );
  }
}
