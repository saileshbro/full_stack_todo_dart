import 'package:freezed_annotation/freezed_annotation.dart';

/// {@template date_time_converter_nullable}
/// {@macro date_time_converter}
///
/// If the json is null, this will return null
/// {@endtemplate}
class DateTimeConverterNullable extends JsonConverter<DateTime?, dynamic> {
  /// {@macro date_time_converter_nullable}
  const DateTimeConverterNullable();

  @override
  DateTime? fromJson(dynamic json) {
    if (json == null) return null;
    return const DateTimeConverter().fromJson(json);
  }

  @override
  String? toJson(DateTime? object) {
    if (object == null) return null;
    return const DateTimeConverter().toJson(object);
  }
}

/// {@template date_time_converter}
/// This is a custom json converter for [DateTime]
///
/// This will parse the date time from a ISO8601 string
/// {@endtemplate}
class DateTimeConverter extends JsonConverter<DateTime, dynamic> {
  /// {@macro date_time_converter}
  const DateTimeConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is DateTime) return json;
    return DateTime.parse(json as String);
  }

  @override
  String toJson(DateTime object) {
    return object.toIso8601String();
  }
}
