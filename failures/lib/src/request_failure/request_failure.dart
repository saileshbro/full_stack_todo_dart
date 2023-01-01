import 'dart:io';

import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_failure.freezed.dart';

@freezed

/// {@template request_failure}
/// Failure that occurs when the user request is invalid.
/// {@endtemplate}
class RequestFailure extends Failure with _$RequestFailure {
  /// {@macro request_failure}
  const factory RequestFailure({
    required String message,
    @Default(HttpStatus.badRequest) int statusCode,
  }) = _RequestFailure;
}
