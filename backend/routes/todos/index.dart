import 'dart:io';

import 'package:backend/todo/controller/todo_controller.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final controller = context.read<TodoController>();
  switch (context.request.method) {
    case HttpMethod.get:
      return controller.index(context.request);
    case HttpMethod.post:
      return controller.store(context.request);
    case HttpMethod.put:
    case HttpMethod.patch:
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
      return Response.json(
        body: {'error': '👀 Looks like you are lost 🔦'},
        statusCode: HttpStatus.methodNotAllowed,
      );
  }
}
