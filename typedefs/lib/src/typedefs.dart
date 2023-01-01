import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';

/// Primary key type for a Todo.
typedef TodoId = int;

/// Maps a string to a [TodoId].
Either<Failure, TodoId> mapTodoId(String id) {
  try {
    final todoId = int.tryParse(id);
    if (todoId == null) throw const BadRequestException(message: 'Invalid id');
    return Right(todoId);
  } on BadRequestException catch (e) {
    return Left(
      RequestFailure(
        message: e.message,
        statusCode: e.statusCode,
      ),
    );
  }
}
