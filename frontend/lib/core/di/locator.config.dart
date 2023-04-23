// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data_source/data_source.dart' as _i18;
import 'package:dio/dio.dart' as _i3;
import 'package:fullstack_todo/core/di/third_party_modules.dart' as _i23;
import 'package:fullstack_todo/core/network/interceptors/network_error_interceptor.dart'
    as _i5;
import 'package:fullstack_todo/core/network/interceptors/network_request_interceptor.dart'
    as _i6;
import 'package:fullstack_todo/data/data_source/todo/todo_remote_data_source/todos_remote_data_source.dart'
    as _i19;
import 'package:fullstack_todo/data/data_source/todo/todos_http_client/todos_http_client.dart'
    as _i10;
import 'package:fullstack_todo/data/data_source/user/user_http_client/user_http_client.dart'
    as _i11;
import 'package:fullstack_todo/data/data_source/user/user_remote_data_source/user_remote_data_source.dart'
    as _i12;
import 'package:fullstack_todo/data/repositories/todo_repository_impl.dart'
    as _i20;
import 'package:fullstack_todo/data/repositories/user_repository_impl.dart'
    as _i14;
import 'package:fullstack_todo/data_services/todos_data_service.dart' as _i9;
import 'package:fullstack_todo/presentation/authentication/authentication_viewmodel.dart'
    as _i16;
import 'package:fullstack_todo/presentation/maintain_todo/maintain_todo_viewmodel.dart'
    as _i21;
import 'package:fullstack_todo/presentation/show_todos/show_todos_viewmodel.dart'
    as _i22;
import 'package:fullstack_todo/presentation/startup/startup_viewmodel.dart'
    as _i17;
import 'package:fullstack_todo/services/shared_preferences_service.dart' as _i8;
import 'package:fullstack_todo/services/user_service.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:repository/repository.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyModules = _$ThirdPartyModules();
    gh.lazySingleton<_i3.Dio>(() => thirdPartyModules.dio);
    gh.lazySingleton<_i4.NavigationService>(
        () => thirdPartyModules.navigationService);
    gh.lazySingleton<_i5.NetworkErrorInterceptor>(
        () => _i5.NetworkErrorInterceptor());
    gh.lazySingleton<_i6.NetworkRequestInterceptor>(
        () => _i6.NetworkRequestInterceptor());
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => thirdPartyModules.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i8.SharedPreferencesService>(
        () => _i8.SharedPreferencesService(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i4.SnackbarService>(
        () => thirdPartyModules.snackbarService);
    gh.lazySingleton<_i9.TodosDataService>(() => _i9.TodosDataService());
    gh.lazySingleton<_i10.TodosHttpClient>(
        () => _i10.TodosHttpClient(gh<_i3.Dio>()));
    gh.lazySingleton<_i11.UserHttpClient>(
        () => _i11.UserHttpClient(gh<_i3.Dio>()));
    gh.lazySingleton<_i12.UserRemoteDataSource>(
        () => _i12.UserRemoteDataSource(gh<_i11.UserHttpClient>()));
    gh.lazySingleton<_i13.UserRepository>(
        () => _i14.UserRepositoryImpl(gh<_i12.UserRemoteDataSource>()));
    gh.lazySingleton<_i15.UserService>(
        () => _i15.UserService(gh<_i8.SharedPreferencesService>()));
    gh.factory<_i16.AuthenticationViewModel>(() => _i16.AuthenticationViewModel(
          gh<_i13.UserRepository>(),
          gh<_i4.NavigationService>(),
          gh<_i8.SharedPreferencesService>(),
          gh<_i4.SnackbarService>(),
        ));
    gh.factory<_i17.StartupViewModel>(() => _i17.StartupViewModel(
          gh<_i4.NavigationService>(),
          gh<_i15.UserService>(),
        ));
    gh.lazySingleton<_i18.TodoDataSource>(
        () => _i19.TodosRemoteDataSource(gh<_i10.TodosHttpClient>()));
    gh.lazySingleton<_i13.TodoRepository>(
        () => _i20.TodoRepositoryImpl(gh<_i18.TodoDataSource>()));
    gh.factory<_i21.MaintainTodoViewModel>(() => _i21.MaintainTodoViewModel(
          gh<_i9.TodosDataService>(),
          gh<_i13.TodoRepository>(),
          gh<_i4.NavigationService>(),
        ));
    gh.factory<_i22.ShowTodosViewModel>(() => _i22.ShowTodosViewModel(
          gh<_i13.TodoRepository>(),
          gh<_i9.TodosDataService>(),
          gh<_i4.NavigationService>(),
        ));
    return this;
  }
}

class _$ThirdPartyModules extends _i23.ThirdPartyModules {
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.SnackbarService get snackbarService => _i4.SnackbarService();
}
