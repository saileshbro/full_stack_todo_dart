import 'package:models/src/serializers/date_time_converter.dart';
import 'package:test/test.dart';

void main() {
  test('DateTimeConverterTests', () async {
    final dateTime = DateTime.now();
    final dateTimeString = dateTime.toIso8601String();
    const dateTimeConverter = DateTimeConverterNullable();
    final convertedDateTime = dateTimeConverter.fromJson(dateTimeString);
    expect(convertedDateTime, dateTime);
    final convertedDateTimeString = dateTimeConverter.toJson(dateTime);
    expect(convertedDateTimeString, dateTimeString);
    expect(dateTimeConverter.fromJson(null), null);
    expect(dateTimeConverter.toJson(null), null);
  });
}
