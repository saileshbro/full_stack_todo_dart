import 'package:backend/db/database_connection.dart';
import 'package:data_source/data_source.dart';
import 'package:exceptions/exceptions.dart';
import 'package:models/models.dart';
import 'package:postgres/postgres.dart';
import 'package:typedefs/typedefs.dart';

/// {@template todo_data_source_impl}
/// Todo data source implementation
/// This class is used to connect to the database and perform CRUD operations
/// {@endtemplate}
class TodoDataSourceImpl implements TodoDataSource {
  /// {@macro todo_data_source_impl}
  const TodoDataSourceImpl(this._databaseConnection);
  final DatabaseConnection _databaseConnection;
  @override
  Future<Todo> createTodo(CreateTodoDto todo) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodoById(TodoId id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getAllTodo() async {
    throw UnimplementedError();
  }

  @override
  Future<Todo> getTodoById(TodoId id) async {
    throw UnimplementedError();
  }

  @override
  Future<Todo> updateTodo({
    required TodoId id,
    required UpdateTodoDto todo,
  }) async {
    throw UnimplementedError();
  }
}
