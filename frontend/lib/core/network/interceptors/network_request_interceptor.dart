import 'package:dio/dio.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:fullstack_todo/services/user_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkRequestInterceptor extends Interceptor {
  const NetworkRequestInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = locator<UserService>().token;
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
