import 'package:models/models.dart';
import 'package:typedefs/typedefs.dart';

/// {@template todo_data_source}
/// An interface for a todos data source.
/// 🔍 This interface defines a set of functions for interacting
/// with a data source that stores todo items.
/// {@endtemplate}
///
abstract class TodoDataSource {
  /// Returns a list of all todo items in the data source
  Future<List<Todo>> getAllTodo();

  /// Returns a todo item with the given [id] from the data source
  /// If no todo item with the given [id] exists, returns `null`
  Future<Todo> getTodoById(TodoId id);

  /// Creates a new todo item in the data source
  Future<Todo> createTodo(CreateTodoDto todo);

  /// Updates an existing todo item in the data source
  Future<Todo> updateTodo({
    required TodoId id,
    required UpdateTodoDto todo,
  });

  /// Deletes a todo item with the given [id] from the data source
  Future<void> deleteTodoById(TodoId id);
}
