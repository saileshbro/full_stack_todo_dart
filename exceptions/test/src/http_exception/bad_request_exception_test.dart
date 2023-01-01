import 'dart:io';

import 'package:exceptions/exceptions.dart';
import 'package:test/test.dart';

const _exception = BadRequestException(
  message: 'Validation failed',
  errors: {
    'name': ['Name is required']
  },
);
void main() {
  group('BadRequestExceptionTest -', () {
    test('message and status code', () {
      expect(_exception.message, 'Validation failed');
      expect(_exception.statusCode, HttpStatus.badRequest);
    });
    test('toString', () {
      expect(_exception.toString(), 'BadRequestException: Validation failed');
    });
    test('when no errors provided, it should have empty map', () {
      const exception = BadRequestException(message: 'Validation failed');
      expect(exception.errors, isEmpty);
    });
  });
}
