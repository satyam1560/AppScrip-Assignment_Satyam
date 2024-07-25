// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'api_client_module.dart' as _i430;
import 'src/core/network/api_client.dart' as _i1005;
import 'src/features/users/data/datasources/post_datasource.dart' as _i994;
import 'src/features/users/data/repositories/user_repository_impl.dart'
    as _i1042;
import 'src/features/users/domain/repositories/user_repository.dart' as _i327;
import 'src/features/users/domain/usecases/user_usecase.dart' as _i287;
import 'src/features/users/presentation/bloc/users_bloc.dart' as _i959;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final aPIClientModule = _$APIClientModule();
    gh.singleton<_i1005.ApiClient>(() => aPIClientModule.apiClient());
    gh.singleton<_i994.UserDataSource>(
        () => _i994.UserDataSource(apiClient: gh<_i1005.ApiClient>()));
    gh.factory<String>(
      () => aPIClientModule.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i327.UserRepository>(() =>
        _i1042.UserRepositoryImpl(todoDataSource: gh<_i994.UserDataSource>()));
    gh.lazySingleton<_i287.UserUsecase>(
        () => _i287.UserUsecase(userRepo: gh<_i327.UserRepository>()));
    gh.lazySingleton<_i959.UserBloc>(
        () => _i959.UserBloc(userUsecase: gh<_i287.UserUsecase>()));
    return this;
  }
}

class _$APIClientModule extends _i430.APIClientModule {}
