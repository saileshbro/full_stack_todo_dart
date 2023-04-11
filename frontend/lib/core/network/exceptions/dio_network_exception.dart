import 'package:dio/dio.dart';
import 'package:exceptions/exceptions.dart';

class DioNetworkException extends DioError implements NetworkException {
  DioNetworkException({
    required this.message,
    required this.statusCode,
    required this.errors,
    required super.requestOptions,
  });

  @override
  final int statusCode;
  @override
  // ignore: overridden_fields
  final String message;
  @override
  final Map<String, List<String>> errors;
}
