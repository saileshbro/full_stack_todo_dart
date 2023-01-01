import 'dart:io';

import 'package:exceptions/src/http_exception/http_exception.dart';

/// {@template bad_request_exception}
/// This is the class for the bad request exception (400)
/// {@endtemplate}
class BadRequestException extends HttpException {
  /// {@macro bad_request_exception}
  const BadRequestException({
    required String message,
    this.errors = const {},
    // coverage:ignore-start
  }) : super(message, HttpStatus.badRequest);
  // coverage:ignore-end

  /// The errors that occurred during the request
  final Map<String, List<String>> errors;
}
