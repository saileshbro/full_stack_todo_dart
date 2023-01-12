// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkFailure _$$_NetworkFailureFromJson(Map<String, dynamic> json) =>
    _$_NetworkFailure(
      message: json['message'] as String,
      statusCode: json['status_code'] as int,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_NetworkFailureToJson(_$_NetworkFailure instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status_code': instance.statusCode,
      'errors': instance.errors,
    };
