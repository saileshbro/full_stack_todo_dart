import 'dart:async';

import 'package:dart_frog/dart_frog.dart';

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
}
