import 'dart:io';

import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_failure.freezed.dart';

/// {@template validation_failure}
/// Failure that occurs when the validation of a request fails.
/// {@endtemplate}
@freezed
class ValidationFailure extends Failure with _$ValidationFailure {
  /// {@macro validation_failure}
  const factory ValidationFailure({
    required String message,
    @Default(HttpStatus.badRequest) int statusCode,
    required Map<String, List<String>> errors,
  }) = _ValidationFailure;
}
