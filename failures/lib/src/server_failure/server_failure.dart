import 'dart:io';

import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_failure.freezed.dart';

@freezed

/// {@template server_failure}
/// Failure that occurs when there is issue with the query or the server
/// {@endtemplate}
class ServerFailure extends Failure with _$ServerFailure {
  /// {@macro server_failure}
  const factory ServerFailure({
    required String message,
    @Default(HttpStatus.internalServerError) int statusCode,
  }) = _ServerFailure;
}
