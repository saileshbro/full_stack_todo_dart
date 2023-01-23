import 'dart:developer';
import 'dart:io';

import 'package:backend/services/password_hasher_service.dart';
import 'package:data_source/data_source.dart';
import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:typedefs/typedefs.dart';

/// {@template user_repository_impl}
/// User repository implementation
/// {@endtemplate}

class UserRepositoryImpl implements UserRepository {
  /// {@macro user_repository_impl}
  UserRepositoryImpl(this.dataSource, this.passwordHasherService);

  /// The data source used to perform CRUD operations
  final UserDataSource dataSource;
  final PasswordHasherService passwordHasherService;

  @override
  Future<Either<Failure, User>> createUser(CreateUserDto createUserDto) async {
    try {
      // dto is already validated in the controller
      // we will hash the password here
      final hashedPassword = passwordHasherService.hashPassword(
        createUserDto.password,
      );
      final user = await dataSource.createUser(
        createUserDto.copyWith(
          password: hashedPassword,
        ),
      );
      return Right(user);
    } on ServerException catch (e) {
      log(e.message);
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  Future<Either<Failure, User>> getUserById(UserId id) async {
    try {
      final res = await dataSource.getUserById(id);
      return Right(res);
    } on NotFoundException catch (e) {
      log(e.message);
      return Left(
        ServerFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on ServerException catch (e) {
      log(e.message);
      return Left(
        ServerFailure(message: e.message),
      );
    }
  }

  @override
  Future<Either<Failure, User>> loginUser(LoginUserDto loginUserDto) async {
    try {
      final email = loginUserDto.email;
      final user = await dataSource.getUserByEmail(email);
      final password = loginUserDto.password;
      final isPasswordCorrect =
          passwordHasherService.checkPassword(password, user.password);
      if (!isPasswordCorrect) {
        throw const ServerException('Invalid email or password');
      }
      return Right(user);
    } catch (e) {
      log(e.toString());
      return const Left(
        ServerFailure(
          message: 'Invalid email or password',
          statusCode: HttpStatus.unauthorized,
        ),
      );
    }
  }
}
