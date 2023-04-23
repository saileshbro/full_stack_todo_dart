import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';

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
