import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// {@template not_allowed_request_handler}
/// This is the not allowed request handler
/// It handles all the requests that are not allowed
/// {@endtemplate}
Future<Response> notAllowedRequestHandler(RequestContext context) async {
  return Response.json(
    body: {'error': '👀 Looks like you are lost 🔦'},
    statusCode: HttpStatus.methodNotAllowed,
  );
}
