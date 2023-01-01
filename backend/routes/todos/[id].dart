import 'dart:io';

import 'package:backend/todo/controller/todo_controller.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final todoController = context.read<TodoController>();
  switch (context.request.method) {
    case HttpMethod.get:
      return todoController.show(context.request, id);
    case HttpMethod.put:
    case HttpMethod.patch:
      return todoController.update(context.request, id);
    case HttpMethod.delete:
      return todoController.destroy(context.request, id);
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.post:
      return Response.json(
        body: {'error': '👀 Looks like you are lost 🔦'},
        statusCode: HttpStatus.methodNotAllowed,
      );
  }
}
