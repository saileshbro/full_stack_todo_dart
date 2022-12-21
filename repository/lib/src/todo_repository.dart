import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';
import 'package:typedefs/typedefs.dart';

/// {@template todo_repository}
/// Base class for all todo repositories.
/// {@endtemplate}
abstract class TodoRepository {
  /// Get all todos.
  Future<Either<Failure, List<Todo>>> getTodos();

  /// Get a todo with the given [id].
  Future<Either<Failure, Todo>> getTodoById(TodoId id);

  /// Create a todo with the given [createTodoDto].
  Future<Either<Failure, Todo>> createTodo(CreateTodoDto createTodoDto);

  /// Update a todo with the given [id] and [updateTodoDto].
  Future<Either<Failure, Todo>> updateTodo({
    required TodoId id,
    required UpdateTodoDto updateTodoDto,
  });

  /// Delete a todo with the given [id].
  Future<Either<Failure, Todo>> deleteTodo(TodoId id);
}
