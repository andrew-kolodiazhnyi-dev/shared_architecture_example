import '../api/common_api_client.dart';
import '../api/models/data.dart';
import 'core/base_service.dart';

class CommonApiService extends BaseService {
  final CommonApiClient _commonApiClient;
  final String _baseUrl;
  CommonApiService(super.logger, this._commonApiClient, this._baseUrl);

  String get baseUrl => _baseUrl;

  String getFullImageUrl(String imageUrl) {
    return '$baseUrl$imageUrl?format=json';
  }

  Future<Data> getData() async {
    return await makeCall(() async => await _commonApiClient.getData());
  }
}
