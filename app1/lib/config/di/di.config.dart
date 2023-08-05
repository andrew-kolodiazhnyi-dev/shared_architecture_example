// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:common/bloc/list_page/list_page_cubit.dart' as _i6;
import 'package:common/services/common_api_service.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;

import '../../api/api_client.dart' as _i3;
import 'modules/api_module.dart' as _i8;
import 'modules/bloc_module.dart' as _i9;
import 'modules/logger_module.dart' as _i10;
import 'modules/service_module.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiModule = _$ApiModule();
    final loggerModule = _$LoggerModule();
    final serviceModule = _$ServiceModule();
    final blocModule = _$BlocModule();
    gh.singleton<_i3.ApiClient>(apiModule.apiClient());
    gh.singleton<_i4.Logger>(loggerModule.logger());
    gh.singleton<_i5.CommonApiService>(serviceModule.apiService(
      gh<_i4.Logger>(),
      gh<_i3.ApiClient>(),
    ));
    gh.singleton<_i6.ListPageCubit>(blocModule.listPageCubit(
      gh<_i4.Logger>(),
      gh<_i5.CommonApiService>(),
    ));
    return this;
  }
}

class _$ServiceModule extends _i7.ServiceModule {}

class _$ApiModule extends _i8.ApiModule {}

class _$BlocModule extends _i9.BlocModule {}

class _$LoggerModule extends _i10.LoggerModule {}
