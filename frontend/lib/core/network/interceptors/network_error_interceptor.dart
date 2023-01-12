import 'package:dio/dio.dart';
import 'package:failures/failures.dart';
import 'package:fullstack_todo/core/network/exceptions/dio_network_exception.dart';

class NetworkErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    const genericInternetIssue =
        'Please check your internet connection and try again';
    try {
      if (err.response == null) {
        throw DioNetworkException(
          message: genericInternetIssue,
          statusCode: 500,
          requestOptions: err.requestOptions,
          errors: {},
        );
      }
      final failureFromServer =
          NetworkFailure.fromJson(err.response!.data as Map<String, dynamic>);
      throw DioNetworkException(
        message: failureFromServer.message,
        statusCode: err.response!.statusCode ?? failureFromServer.statusCode,
        errors: failureFromServer.errors,
        requestOptions: err.requestOptions,
      );
    } on DioNetworkException catch (e) {
      handler.reject(e);
    } catch (e) {
      handler.reject(
        DioNetworkException(
          message: genericInternetIssue,
          statusCode: 500,
          requestOptions: err.requestOptions,
          errors: {},
        ),
      );
    }
  }
}
