import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:backend/controller/http_controller.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
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
    throw UnimplementedError();
  }

  @override
  FutureOr<Response> store(Request request) async {
    throw UnimplementedError();
  }

  @override
  FutureOr<Response> update(Request request, String id) async {
    throw UnimplementedError();
  }

}
