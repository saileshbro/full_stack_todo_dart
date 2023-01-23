import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user_dto.freezed.dart';
part 'login_user_dto.g.dart';

@freezed

/// {@template login_user_dto}
/// Data transfer object for logging in a user.
/// {@endtemplate}
class LoginUserDto with _$LoginUserDto {
  /// {@macro login_user_dto}
  factory LoginUserDto({
    required String email,
    required String password,
  }) = _LoginUserDto;

  /// {@macro login_user_dto}
  factory LoginUserDto.fromJson(Map<String, dynamic> json) =>
      _$LoginUserDtoFromJson(json);

  /// Validates the [LoginUserDto] and throws a [BadRequestException] if the
  /// validation fails.
  static Either<ValidationFailure, LoginUserDto> validated(
    Map<String, dynamic> json,
  ) {
    try {
      final errors = <String, List<String>>{};
      final email = json['email'] as String? ?? '';
      final password = json['password'] as String? ?? '';
      if (email.isEmpty) {
        errors['email'] = ['Email is required'];
      }
      if (password.isEmpty) {
        errors['password'] = ['Password is required'];
      }
      if (errors.isEmpty) return Right(LoginUserDto.fromJson(json));
      throw BadRequestException(
        message: 'Validation failed',
        errors: errors,
      );
    } on BadRequestException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          errors: e.errors,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
