// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginUserDto _$LoginUserDtoFromJson(Map<String, dynamic> json) {
  return _LoginUserDto.fromJson(json);
}

/// @nodoc
mixin _$LoginUserDto {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginUserDtoCopyWith<LoginUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUserDtoCopyWith<$Res> {
  factory $LoginUserDtoCopyWith(
          LoginUserDto value, $Res Function(LoginUserDto) then) =
      _$LoginUserDtoCopyWithImpl<$Res, LoginUserDto>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginUserDtoCopyWithImpl<$Res, $Val extends LoginUserDto>
    implements $LoginUserDtoCopyWith<$Res> {
  _$LoginUserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginUserDtoCopyWith<$Res>
    implements $LoginUserDtoCopyWith<$Res> {
  factory _$$_LoginUserDtoCopyWith(
          _$_LoginUserDto value, $Res Function(_$_LoginUserDto) then) =
      __$$_LoginUserDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginUserDtoCopyWithImpl<$Res>
    extends _$LoginUserDtoCopyWithImpl<$Res, _$_LoginUserDto>
    implements _$$_LoginUserDtoCopyWith<$Res> {
  __$$_LoginUserDtoCopyWithImpl(
      _$_LoginUserDto _value, $Res Function(_$_LoginUserDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_LoginUserDto(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginUserDto implements _LoginUserDto {
  _$_LoginUserDto({required this.email, required this.password});

  factory _$_LoginUserDto.fromJson(Map<String, dynamic> json) =>
      _$$_LoginUserDtoFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginUserDto(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginUserDto &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginUserDtoCopyWith<_$_LoginUserDto> get copyWith =>
      __$$_LoginUserDtoCopyWithImpl<_$_LoginUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginUserDtoToJson(
      this,
    );
  }
}

abstract class _LoginUserDto implements LoginUserDto {
  factory _LoginUserDto(
      {required final String email,
      required final String password}) = _$_LoginUserDto;

  factory _LoginUserDto.fromJson(Map<String, dynamic> json) =
      _$_LoginUserDto.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginUserDtoCopyWith<_$_LoginUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
