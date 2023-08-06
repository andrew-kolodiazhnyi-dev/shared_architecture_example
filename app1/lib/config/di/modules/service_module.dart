import 'package:common/services/common_api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../api/api_client.dart';
import '../../env/env.dart';

@module
abstract class ServiceModule {
  @singleton
  CommonApiService apiService(Logger logger, ApiClient apiClient) {
    return CommonApiService(logger, apiClient, Env.baseUrl);
  }
}
