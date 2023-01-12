import 'package:data_source/data_source.dart';
import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:typedefs/typedefs.dart';

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this._todoDataSource);
  final TodoDataSource _todoDataSource;

  @override
  Future<Either<Failure, Todo>> createTodo(CreateTodoDto createTodoDto) =>
      handleError(() => _todoDataSource.createTodo(createTodoDto));

  @override
  Future<Either<Failure, void>> deleteTodo(TodoId id) =>
      handleError(() => _todoDataSource.deleteTodoById(id));

  @override
  Future<Either<Failure, Todo>> getTodoById(TodoId id) =>
      handleError(() => _todoDataSource.getTodoById(id));

  @override
  Future<Either<Failure, List<Todo>>> getTodos() =>
      handleError(_todoDataSource.getAllTodo);

  @override
  Future<Either<Failure, Todo>> updateTodo({
    required TodoId id,
    required UpdateTodoDto updateTodoDto,
  }) =>
      handleError(
        () => _todoDataSource.updateTodo(id: id, todo: updateTodoDto),
      );

  Future<Either<Failure, T>> handleError<T>(
    Future<T> Function() callback,
  ) async {
    try {
      final res = await callback();
      return Right(res);
    } on NetworkException catch (e) {
      return Left(
        NetworkFailure(
          message: e.message,
          statusCode: e.statusCode,
          errors: e.errors,
        ),
      );
    }
  }
}
