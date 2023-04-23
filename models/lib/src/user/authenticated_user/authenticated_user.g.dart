// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthenticatedUser _$$_AuthenticatedUserFromJson(Map<String, dynamic> json) =>
    _$_AuthenticatedUser(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthenticatedUserToJson(
        _$_AuthenticatedUser instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user.toJson(),
    };
