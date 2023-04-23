// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticated_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticatedUser _$AuthenticatedUserFromJson(Map<String, dynamic> json) {
  return _AuthenticatedUser.fromJson(json);
}

/// @nodoc
mixin _$AuthenticatedUser {
  String get token => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticatedUserCopyWith<AuthenticatedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatedUserCopyWith<$Res> {
  factory $AuthenticatedUserCopyWith(
          AuthenticatedUser value, $Res Function(AuthenticatedUser) then) =
      _$AuthenticatedUserCopyWithImpl<$Res, AuthenticatedUser>;
  @useResult
  $Res call({String token, User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthenticatedUserCopyWithImpl<$Res, $Val extends AuthenticatedUser>
    implements $AuthenticatedUserCopyWith<$Res> {
  _$AuthenticatedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AuthenticatedUserCopyWith<$Res>
    implements $AuthenticatedUserCopyWith<$Res> {
  factory _$$_AuthenticatedUserCopyWith(_$_AuthenticatedUser value,
          $Res Function(_$_AuthenticatedUser) then) =
      __$$_AuthenticatedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token, User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_AuthenticatedUserCopyWithImpl<$Res>
    extends _$AuthenticatedUserCopyWithImpl<$Res, _$_AuthenticatedUser>
    implements _$$_AuthenticatedUserCopyWith<$Res> {
  __$$_AuthenticatedUserCopyWithImpl(
      _$_AuthenticatedUser _value, $Res Function(_$_AuthenticatedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? user = null,
  }) {
    return _then(_$_AuthenticatedUser(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthenticatedUser implements _AuthenticatedUser {
  const _$_AuthenticatedUser({required this.token, required this.user});

  factory _$_AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticatedUserFromJson(json);

  @override
  final String token;
  @override
  final User user;

  @override
  String toString() {
    return 'AuthenticatedUser(token: $token, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatedUser &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedUserCopyWith<_$_AuthenticatedUser> get copyWith =>
      __$$_AuthenticatedUserCopyWithImpl<_$_AuthenticatedUser>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticatedUserToJson(
      this,
    );
  }
}

abstract class _AuthenticatedUser implements AuthenticatedUser {
  const factory _AuthenticatedUser(
      {required final String token,
      required final User user}) = _$_AuthenticatedUser;

  factory _AuthenticatedUser.fromJson(Map<String, dynamic> json) =
      _$_AuthenticatedUser.fromJson;

  @override
  String get token;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticatedUserCopyWith<_$_AuthenticatedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
