export './bad_request_exception.dart';
export './not_found_exception.dart';

/// {@template http_exception}
/// This is the base class for all http exceptions
/// Use this class to throw http exceptions
/// {@endtemplate}
abstract class HttpException implements Exception {
  /// {@macro http_exception}
  const HttpException(this.message, this.statusCode);

  /// The message to be displayed
  final String message;

  /// The status code to be returned
  final int statusCode;

  @override
  String toString() => '$runtimeType: $message';
}
