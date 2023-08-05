import 'package:common/bloc/list_page/list_page_cubit.dart';
import 'package:common/services/common_api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class BlocModule {
  @singleton
  ListPageCubit listPageCubit(
    Logger logger,
    CommonApiService commonApiService,
  ) {
    return ListPageCubit(
      logger,
      commonApiService,
    );
  }
}
