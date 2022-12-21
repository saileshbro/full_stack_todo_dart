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
}
