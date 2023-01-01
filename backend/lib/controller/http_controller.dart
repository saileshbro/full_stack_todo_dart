import 'dart:async';
import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';

/// {@template http_controller}
/// This is the base class for all http controllers
/// Use this class to handle requests to the resource
/// Inspired by Laravel's controllers
/// {@endtemplate}
abstract class HttpController {
  /// index - GET /resource
  FutureOr<Response> index(Request request);

  /// store - POST /resource
  FutureOr<Response> store(Request request);

  /// show - GET /resource/{id}
  FutureOr<Response> show(Request request, String id);

  /// update - PUT /resource/{id}
  FutureOr<Response> update(Request request, String id);

  /// destroy - DELETE /resource/{id}
  FutureOr<Response> destroy(Request request, String id);

  /// Parses the request body into a json map
  /// Returns a [ValidationFailure] if the body is invalid
  Future<Either<Failure, Map<String, dynamic>>> parseJson(
    Request request,
  ) async {
    try {
      final body = await request.body();
      if (body.isEmpty) {
        throw const BadRequestException(message: 'Invalid body');
      }
      late final Map<String, dynamic> json;
      try {
        json = jsonDecode(body) as Map<String, dynamic>;
        return Right(json);
      } catch (e) {
        throw const BadRequestException(message: 'Invalid body');
      }
    } on BadRequestException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          errors: {},
        ),
      );
    }
  }
}
