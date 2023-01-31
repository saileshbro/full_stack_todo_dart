import 'dart:io';

import 'package:exceptions/src/http_exception/http_exception.dart';

/// {@template unauthorized_exception}
/// This is the class for the unauthorized exception (401)
/// {@endtemplate}
class UnauthorizedException extends HttpException {
  /// {@macro unauthorized_exception}
  const UnauthorizedException({
    String message = 'Unauthorized',
    this.errors = const {},
    // coverage:ignore-start
  }) : super(message, HttpStatus.unauthorized);
  // coverage:ignore-end

  /// The errors that occurred during the request
  final Map<String, List<String>> errors;
}
