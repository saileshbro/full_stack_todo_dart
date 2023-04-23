import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:fullstack_todo/core/network/error_handler/error_handler.dart';
import 'package:fullstack_todo/data/data_source/user/user_remote_data_source/user_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:typedefs/typedefs.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);

  final UserRemoteDataSource _userDataSource;

  @override
  Future<Either<Failure, AuthenticatedUser>> loginUser(
    LoginUserDto loginUserDto,
  ) =>
      handleError(() => _userDataSource.login(loginUserDto));
  @override
  Future<Either<Failure, AuthenticatedUser>> createUser(
    CreateUserDto createUserDto,
  ) =>
      handleError(() => _userDataSource.signup(createUserDto));

  @override
  Future<Either<Failure, User>> getUserById(UserId id) =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, User>> getUserByEmail(String email) =>
      throw UnimplementedError();
}
