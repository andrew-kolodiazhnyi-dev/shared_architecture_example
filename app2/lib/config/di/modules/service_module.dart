import 'package:app2/config/env/env.dart';
import 'package:common/services/common_api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../api/api_client.dart';

@module
abstract class ServiceModule {
  @singleton
  CommonApiService apiService(Logger logger, ApiClient apiClient) {
    return CommonApiService(logger, apiClient, Env.baseUrl);
  }
}
