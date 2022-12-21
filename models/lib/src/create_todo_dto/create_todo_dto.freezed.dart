// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_todo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateTodoDto _$CreateTodoDtoFromJson(Map<String, dynamic> json) {
  return _CreateTodoDto.fromJson(json);
}

/// @nodoc
mixin _$CreateTodoDto {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateTodoDtoCopyWith<CreateTodoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTodoDtoCopyWith<$Res> {
  factory $CreateTodoDtoCopyWith(
          CreateTodoDto value, $Res Function(CreateTodoDto) then) =
      _$CreateTodoDtoCopyWithImpl<$Res, CreateTodoDto>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$CreateTodoDtoCopyWithImpl<$Res, $Val extends CreateTodoDto>
    implements $CreateTodoDtoCopyWith<$Res> {
  _$CreateTodoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateTodoDtoCopyWith<$Res>
    implements $CreateTodoDtoCopyWith<$Res> {
  factory _$$_CreateTodoDtoCopyWith(
          _$_CreateTodoDto value, $Res Function(_$_CreateTodoDto) then) =
      __$$_CreateTodoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$_CreateTodoDtoCopyWithImpl<$Res>
    extends _$CreateTodoDtoCopyWithImpl<$Res, _$_CreateTodoDto>
    implements _$$_CreateTodoDtoCopyWith<$Res> {
  __$$_CreateTodoDtoCopyWithImpl(
      _$_CreateTodoDto _value, $Res Function(_$_CreateTodoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_CreateTodoDto(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateTodoDto implements _CreateTodoDto {
  _$_CreateTodoDto({required this.title, required this.description});

  factory _$_CreateTodoDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreateTodoDtoFromJson(json);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'CreateTodoDto(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTodoDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateTodoDtoCopyWith<_$_CreateTodoDto> get copyWith =>
      __$$_CreateTodoDtoCopyWithImpl<_$_CreateTodoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateTodoDtoToJson(
      this,
    );
  }
}

abstract class _CreateTodoDto implements CreateTodoDto {
  factory _CreateTodoDto(
      {required final String title,
      required final String description}) = _$_CreateTodoDto;

  factory _CreateTodoDto.fromJson(Map<String, dynamic> json) =
      _$_CreateTodoDto.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTodoDtoCopyWith<_$_CreateTodoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
