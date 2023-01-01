import 'dart:async';
import 'dart:io';

import 'package:backend/controller/http_controller.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:typedefs/typedefs.dart';

/// {@template todo_controller}
/// This is the controller for the todo resource
/// Use this class to handle requests to the todo resource
/// {@endtemplate}
class TodoController extends HttpController {
  /// {@macro todo_controller}
  TodoController(this._repo);

  final TodoRepository _repo;
  @override
  FutureOr<Response> index(Request request) async {
    final res = await _repo.getTodos();
    return res.fold(
      (left) => Response.json(
        body: {'message': left.message},
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.map((e) => e.toJson()).toList(),
      ),
    );
  }

  @override
  FutureOr<Response> show(Request request, String id) async {
    final todoId = mapTodoId(id);
    if (todoId.isLeft) {
      return Response.json(
        body: {'message': todoId.left.message},
        statusCode: todoId.left.statusCode,
      );
    }
    final res = await _repo.getTodoById(todoId.right);
    return res.fold(
      (left) => Response.json(
        body: {'message': left.message},
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.toJson(),
      ),
    );
  }

  @override
  FutureOr<Response> destroy(Request request, String id) async {
    final todoId = mapTodoId(id);
    if (todoId.isLeft) {
      return Response.json(
        body: {'message': todoId.left.message},
        statusCode: todoId.left.statusCode,
      );
    }
    final res = await _repo.deleteTodo(todoId.right);
    return res.fold(
      (left) => Response.json(
        body: {'message': left.message},
        statusCode: left.statusCode,
      ),
      (right) => Response.json(body: {'message': 'OK'}),
    );
  }

  @override
  FutureOr<Response> store(Request request) async {
    final parsedBody = await parseJson(request);
    if (parsedBody.isLeft) {
      return Response.json(
        body: {'message': parsedBody.left.message},
        statusCode: parsedBody.left.statusCode,
      );
    }
    final json = parsedBody.right;
    final createTodoDto = CreateTodoDto.validated(json);
    if (createTodoDto.isLeft) {
      return Response.json(
        body: {
          'message': createTodoDto.left.message,
          'errors': createTodoDto.left.errors,
        },
        statusCode: createTodoDto.left.statusCode,
      );
    }
    final res = await _repo.createTodo(createTodoDto.right);
    return res.fold(
      (left) => Response.json(
        body: {'message': left.message},
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.toJson(),
        statusCode: HttpStatus.created,
      ),
    );
  }

  @override
  FutureOr<Response> update(Request request, String id) async {
    final parsedBody = await parseJson(request);
    final todoId = mapTodoId(id);
    if (todoId.isLeft) {
      return Response.json(
        body: {'message': todoId.left.message},
        statusCode: todoId.left.statusCode,
      );
    }
    if (parsedBody.isLeft) {
      return Response.json(
        body: {'message': parsedBody.left.message},
        statusCode: parsedBody.left.statusCode,
      );
    }

    final json = parsedBody.right;
    final updateTodoDto = UpdateTodoDto.validated(json);
    if (updateTodoDto.isLeft) {
      return Response.json(
        body: {
          'message': updateTodoDto.left.message,
          'errors': updateTodoDto.left.errors,
        },
        statusCode: updateTodoDto.left.statusCode,
      );
    }
    final res = await _repo.updateTodo(
      id: todoId.right,
      updateTodoDto: updateTodoDto.right,
    );
    return res.fold(
      (left) => Response.json(
        body: {'message': left.message},
        statusCode: left.statusCode,
      ),
      (right) => Response.json(
        body: right.toJson(),
      ),
    );
  }
}
