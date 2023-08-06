import 'package:common/api/common_api_client.dart';
import 'package:common/api/models/data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient extends CommonApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  //For our purpose, let's imagine these are not query parameters but another url
  @override
  @GET("/?q=the+wire+characters&format=json")
  Future<Data> getData();
}
