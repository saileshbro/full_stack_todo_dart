// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValidationFailure {
  String get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  Map<String, List<String>> get errors => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidationFailureCopyWith<ValidationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationFailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(
          ValidationFailure value, $Res Function(ValidationFailure) then) =
      _$ValidationFailureCopyWithImpl<$Res, ValidationFailure>;
  @useResult
  $Res call({String message, int statusCode, Map<String, List<String>> errors});
}

/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res, $Val extends ValidationFailure>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidationFailureCopyWith<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  factory _$$_ValidationFailureCopyWith(_$_ValidationFailure value,
          $Res Function(_$_ValidationFailure) then) =
      __$$_ValidationFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int statusCode, Map<String, List<String>> errors});
}

/// @nodoc
class __$$_ValidationFailureCopyWithImpl<$Res>
    extends _$ValidationFailureCopyWithImpl<$Res, _$_ValidationFailure>
    implements _$$_ValidationFailureCopyWith<$Res> {
  __$$_ValidationFailureCopyWithImpl(
      _$_ValidationFailure _value, $Res Function(_$_ValidationFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? errors = null,
  }) {
    return _then(_$_ValidationFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// @nodoc

class _$_ValidationFailure implements _ValidationFailure {
  const _$_ValidationFailure(
      {required this.message,
      this.statusCode = HttpStatus.badRequest,
      final Map<String, List<String>> errors = const {}})
      : _errors = errors;

  @override
  final String message;
  @override
  @JsonKey()
  final int statusCode;
  final Map<String, List<String>> _errors;
  @override
  @JsonKey()
  Map<String, List<String>> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'ValidationFailure(message: $message, statusCode: $statusCode, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidationFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode,
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidationFailureCopyWith<_$_ValidationFailure> get copyWith =>
      __$$_ValidationFailureCopyWithImpl<_$_ValidationFailure>(
          this, _$identity);
}

abstract class _ValidationFailure implements ValidationFailure {
  const factory _ValidationFailure(
      {required final String message,
      final int statusCode,
      final Map<String, List<String>> errors}) = _$_ValidationFailure;

  @override
  String get message;
  @override
  int get statusCode;
  @override
  Map<String, List<String>> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_ValidationFailureCopyWith<_$_ValidationFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
