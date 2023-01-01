import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_todo_dto.freezed.dart';
part 'update_todo_dto.g.dart';

/// {@template update_todo_dto}
/// A data transfer object (DTO) representing a request to update a todo item.
/// {@endtemplate update_todo_dto}
@freezed
class UpdateTodoDto with _$UpdateTodoDto {
  /// {@macro update_todo_dto}
  /// Creates an instance of [UpdateTodoDto].
  ///
  /// The [title], [description], and [completed] fields are optional.
  factory UpdateTodoDto({
    String? title,
    String? description,
    bool? completed,
  }) = _UpdateTodoDto;

  /// {@macro update_todo_dto}
  /// Creates an instance of [UpdateTodoDto] from a JSON object.
  factory UpdateTodoDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTodoDtoFromJson(json);

  /// Validates the [UpdateTodoDto] and returns a [ValidationFailure] if the
  /// validation fails.

  static Either<ValidationFailure, UpdateTodoDto> validated(
    Map<String, dynamic> json,
  ) {
    try {
      final errors = <String, List<String>>{};
      if (json['title'] == null || json['title'] == '') {
        errors['title'] = ['At least one field must be provided'];
      }
      if (json['description'] == null || json['description'] == '') {
        errors['description'] = ['At least one field must be provided'];
      }
      if (json['completed'] == null) {
        errors['completed'] = ['At least one field must be provided'];
      }
      if (errors.length < 3) return Right(UpdateTodoDto.fromJson(json));
      throw BadRequestException(
        message: 'Validation failed',
        errors: errors,
      );
    } on BadRequestException catch (e) {
      return Left(
        ValidationFailure(
          message: e.message,
          statusCode: e.statusCode,
          errors: e.errors,
        ),
      );
    }
  }
}
