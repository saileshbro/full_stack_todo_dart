// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_todo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateTodoDto _$UpdateTodoDtoFromJson(Map<String, dynamic> json) {
  return _UpdateTodoDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateTodoDto {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTodoDtoCopyWith<UpdateTodoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTodoDtoCopyWith<$Res> {
  factory $UpdateTodoDtoCopyWith(
          UpdateTodoDto value, $Res Function(UpdateTodoDto) then) =
      _$UpdateTodoDtoCopyWithImpl<$Res, UpdateTodoDto>;
  @useResult
  $Res call({String? title, String? description, bool? completed});
}

/// @nodoc
class _$UpdateTodoDtoCopyWithImpl<$Res, $Val extends UpdateTodoDto>
    implements $UpdateTodoDtoCopyWith<$Res> {
  _$UpdateTodoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateTodoDtoCopyWith<$Res>
    implements $UpdateTodoDtoCopyWith<$Res> {
  factory _$$_UpdateTodoDtoCopyWith(
          _$_UpdateTodoDto value, $Res Function(_$_UpdateTodoDto) then) =
      __$$_UpdateTodoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? description, bool? completed});
}

/// @nodoc
class __$$_UpdateTodoDtoCopyWithImpl<$Res>
    extends _$UpdateTodoDtoCopyWithImpl<$Res, _$_UpdateTodoDto>
    implements _$$_UpdateTodoDtoCopyWith<$Res> {
  __$$_UpdateTodoDtoCopyWithImpl(
      _$_UpdateTodoDto _value, $Res Function(_$_UpdateTodoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$_UpdateTodoDto(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      completed: freezed == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateTodoDto implements _UpdateTodoDto {
  _$_UpdateTodoDto({this.title, this.description, this.completed});

  factory _$_UpdateTodoDto.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateTodoDtoFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? completed;

  @override
  String toString() {
    return 'UpdateTodoDto(title: $title, description: $description, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateTodoDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateTodoDtoCopyWith<_$_UpdateTodoDto> get copyWith =>
      __$$_UpdateTodoDtoCopyWithImpl<_$_UpdateTodoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateTodoDtoToJson(
      this,
    );
  }
}

abstract class _UpdateTodoDto implements UpdateTodoDto {
  factory _UpdateTodoDto(
      {final String? title,
      final String? description,
      final bool? completed}) = _$_UpdateTodoDto;

  factory _UpdateTodoDto.fromJson(Map<String, dynamic> json) =
      _$_UpdateTodoDto.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  bool? get completed;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateTodoDtoCopyWith<_$_UpdateTodoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
