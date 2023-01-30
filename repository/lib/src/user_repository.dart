import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';
import 'package:typedefs/typedefs.dart';

/// {@template user_repository}
/// Base class for all user repositories.
/// {@endtemplate}
abstract class UserRepository {
  /// Get a user with the given [id].
  Future<Either<Failure, User>> getUserById(UserId id);

  /// Create a user with the given [createUserDto].
  Future<Either<Failure, User>> createUser(CreateUserDto createUserDto);

  /// Login a user with the given [loginUserDto].
  Future<Either<Failure, User>> loginUser(LoginUserDto loginUserDto);

  /// Get a user with the given [email].
  Future<Either<Failure, User>> getUserByEmail(String email);
}
