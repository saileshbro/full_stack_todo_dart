import 'dart:developer';

import 'package:data_source/data_source.dart';
import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:typedefs/typedefs.dart';

/// {@template todo_repository_impl}
/// Todo repository implementation
/// {@endtemplate}
class TodoRepositoryImpl implements TodoRepository {
  /// {@macro todo_repository_impl}
  TodoRepositoryImpl(this.dataSource);

  /// The data source used to perform CRUD operations
  final TodoDataSource dataSource;

  @override
  Future<Either<Failure, Todo>> createTodo(CreateTodoDto createTodoDto) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTodo(TodoId id) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Todo>> getTodoById(TodoId id) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Todo>> updateTodo({
    required TodoId id,
    required UpdateTodoDto updateTodoDto,
  }) async {
    throw UnimplementedError();
  }
}
