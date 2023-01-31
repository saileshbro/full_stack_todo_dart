import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

/// {@template unimplemented_handler}
/// This is the unimplemented handler
/// It handles all the requests that are not implemented
/// {@endtemplate}

Future<Response> unimplementedHandler([RequestContext? context]) async {
  return Response.json(
    body: {'error': '👀 Not implemented yet'},
    statusCode: HttpStatus.notImplemented,
  );
}
