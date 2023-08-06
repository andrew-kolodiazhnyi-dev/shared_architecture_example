import 'models/data.dart';

abstract class CommonApiClient {
  Future<Data> getData();
}
