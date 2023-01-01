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
    throw UnimplementedError();
  }

  @override
  FutureOr<Response> show(Request request, String id) async {
    throw UnimplementedError();
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
