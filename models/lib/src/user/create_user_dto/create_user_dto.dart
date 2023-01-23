import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_dto.freezed.dart';
part 'create_user_dto.g.dart';

/// {@template create_user_dto}
/// A Data Transfer Object representing body to create a user.
/// {@endtemplate}
@freezed
class CreateUserDto with _$CreateUserDto {
  /// {@macro create_user_dto}
  factory CreateUserDto({
    required String name,
    required String email,
    required String password,
  }) = _CreateUserDto;

  /// {@macro create_user_dto}
  factory CreateUserDto.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDtoFromJson(json);

  /// Validates the [CreateUserDto] and throws a [BadRequestException] if the
  /// validation fails.
  static Either<ValidationFailure, CreateUserDto> validated(
    Map<String, dynamic> json,
  ) {
    try {
      final errors = <String, List<String>>{};
      final name = json['name'] as String? ?? '';
      final email = json['email'] as String? ?? '';
      final password = json['password'] as String? ?? '';
      if (name.isEmpty) {
        errors['name'] = ['Name is required'];
      }
      if (email.isEmpty) {
        errors['email'] = ['Email is required'];
      }
      if (password.isEmpty) {
        errors['password'] = ['Password is required'];
      }
      if (errors.isEmpty) return Right(CreateUserDto.fromJson(json));
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
