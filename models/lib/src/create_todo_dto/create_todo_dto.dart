import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_todo_dto.freezed.dart';
part 'create_todo_dto.g.dart';

/// A data transfer object (DTO) to create a new todo item
@freezed
class CreateTodoDto with _$CreateTodoDto {
  /// Creates an instance of [CreateTodoDto].
  ///
  /// The [title] and [description] fields are required.
  factory CreateTodoDto({
    required String title,
    required String description,
  }) = _CreateTodoDto;

  /// Creates an instance of [CreateTodoDto] from a JSON object.
  factory CreateTodoDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoDtoFromJson(json);
}
