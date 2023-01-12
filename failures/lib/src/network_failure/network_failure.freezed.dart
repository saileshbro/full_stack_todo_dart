// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkFailure _$NetworkFailureFromJson(Map<String, dynamic> json) {
  return _NetworkFailure.fromJson(json);
}

/// @nodoc
mixin _$NetworkFailure {
  String get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  Map<String, List<String>> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkFailureCopyWith<NetworkFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkFailureCopyWith<$Res> {
  factory $NetworkFailureCopyWith(
          NetworkFailure value, $Res Function(NetworkFailure) then) =
      _$NetworkFailureCopyWithImpl<$Res, NetworkFailure>;
  @useResult
  $Res call({String message, int statusCode, Map<String, List<String>> errors});
}

/// @nodoc
class _$NetworkFailureCopyWithImpl<$Res, $Val extends NetworkFailure>
    implements $NetworkFailureCopyWith<$Res> {
  _$NetworkFailureCopyWithImpl(this._value, this._then);

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
abstract class _$$_NetworkFailureCopyWith<$Res>
    implements $NetworkFailureCopyWith<$Res> {
  factory _$$_NetworkFailureCopyWith(
          _$_NetworkFailure value, $Res Function(_$_NetworkFailure) then) =
      __$$_NetworkFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int statusCode, Map<String, List<String>> errors});
}

/// @nodoc
class __$$_NetworkFailureCopyWithImpl<$Res>
    extends _$NetworkFailureCopyWithImpl<$Res, _$_NetworkFailure>
    implements _$$_NetworkFailureCopyWith<$Res> {
  __$$_NetworkFailureCopyWithImpl(
      _$_NetworkFailure _value, $Res Function(_$_NetworkFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = null,
    Object? errors = null,
  }) {
    return _then(_$_NetworkFailure(
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
@JsonSerializable()
class _$_NetworkFailure implements _NetworkFailure {
  const _$_NetworkFailure(
      {required this.message,
      required this.statusCode,
      final Map<String, List<String>> errors = const {}})
      : _errors = errors;

  factory _$_NetworkFailure.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkFailureFromJson(json);

  @override
  final String message;
  @override
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkFailure &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode,
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkFailureCopyWith<_$_NetworkFailure> get copyWith =>
      __$$_NetworkFailureCopyWithImpl<_$_NetworkFailure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkFailureToJson(
      this,
    );
  }
}

abstract class _NetworkFailure implements NetworkFailure {
  const factory _NetworkFailure(
      {required final String message,
      required final int statusCode,
      final Map<String, List<String>> errors}) = _$_NetworkFailure;

  factory _NetworkFailure.fromJson(Map<String, dynamic> json) =
      _$_NetworkFailure.fromJson;

  @override
  String get message;
  @override
  int get statusCode;
  @override
  Map<String, List<String>> get errors;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkFailureCopyWith<_$_NetworkFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
