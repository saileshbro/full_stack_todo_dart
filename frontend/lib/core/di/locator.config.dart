// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data_source/data_source.dart' as _i7;
import 'package:dio/dio.dart' as _i3;
import 'package:fullstack_todo/core/di/third_party_modules.dart' as _i13;
import 'package:fullstack_todo/data/data_source/todo_remote_data_source/todos_remote_data_source.dart'
    as _i8;
import 'package:fullstack_todo/data/data_source/todos_http_client/todos_http_client.dart'
    as _i6;
import 'package:fullstack_todo/data/repositories/todo_repository_impl.dart'
    as _i10;
import 'package:fullstack_todo/data_services/todos_data_service.dart' as _i5;
import 'package:fullstack_todo/presentation/maintain_todo/maintain_todo_viewmodel.dart'
    as _i11;
import 'package:fullstack_todo/presentation/show_todos/show_todos_viewmodel.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:repository/repository.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i4;

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
    final thirdPartyModules = _$ThirdPartyModules();
    gh.lazySingleton<_i3.Dio>(() => thirdPartyModules.dio);
    gh.lazySingleton<_i4.NavigationService>(
        () => thirdPartyModules.navigationService);
    gh.lazySingleton<_i5.TodosDataService>(() => _i5.TodosDataService());
    gh.lazySingleton<_i6.TodosHttpClient>(
        () => _i6.TodosHttpClient(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.TodoDataSource>(
        () => _i8.TodosRemoteDataSource(gh<_i6.TodosHttpClient>()));
    gh.lazySingleton<_i9.TodoRepository>(
        () => _i10.TodoRepositoryImpl(gh<_i7.TodoDataSource>()));
    gh.factory<_i11.MaintainTodoViewModel>(() => _i11.MaintainTodoViewModel(
          gh<_i5.TodosDataService>(),
          gh<_i9.TodoRepository>(),
          gh<_i4.NavigationService>(),
        ));
    gh.factory<_i12.ShowTodosViewModel>(() => _i12.ShowTodosViewModel(
          gh<_i9.TodoRepository>(),
          gh<_i5.TodosDataService>(),
          gh<_i4.NavigationService>(),
        ));
    return this;
  }
}

class _$ThirdPartyModules extends _i13.ThirdPartyModules {
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
}
