// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkFailure _$$_NetworkFailureFromJson(Map<String, dynamic> json) =>
    _$_NetworkFailure(
      message: json['message'] as String,
      code: json['code'] as int,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_NetworkFailureToJson(_$_NetworkFailure instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'errors': instance.errors,
    };
