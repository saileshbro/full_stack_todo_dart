import 'package:dio/dio.dart';
import 'package:fullstack_todo/constants/constants.dart';
import 'package:fullstack_todo/core/network/interceptors/network_error_interceptor.dart';
import 'package:fullstack_todo/core/network/interceptors/network_request_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyModules {
  @lazySingleton
  // ignore: avoid_redundant_argument_values
  Dio get dio => Dio(BaseOptions(baseUrl: kBaseUrl))
    ..interceptors.add(const NetworkErrorInterceptor())
    ..interceptors.add(const NetworkRequestInterceptor());

  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  SnackbarService get snackbarService;

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
