import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/src/serializers/date_time_converter.dart';
import 'package:typedefs/typedefs.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

/// A class representing a todo item.
@freezed
class Todo with _$Todo {
  /// Creates an instance of [Todo].
  ///
  /// The [id], [title] fields are required.
  /// The [completed] field is optional
  /// and has a default value of false
  /// The [description] field is optional
  /// and has a default value of an empty string.
  /// The [createdAt] field is required and represents the date and time
  /// when the todo item was created.
  /// The [updatedAt] field is optional and represents the date and time
  /// when the todo item was last updated.
  factory Todo({
    required TodoId id,
    required UserId userId,
    required String title,
    @Default('') String description,
    @Default(false) bool completed,
    @DateTimeConverter() required DateTime createdAt,
    @DateTimeConverterNullable() DateTime? updatedAt,
  }) = _Todo;

  /// Creates an instance of [Todo] from a JSON object.
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
