import 'package:exceptions/src/http_exception/not_found_exception.dart';
import 'package:test/test.dart';

const _exception = NotFoundException('Not found');
void main() {
  group('NotFoundExceptionTest -', () {
    test('message and status code', () {
      expect(_exception.message, 'Not found');
      expect(_exception.statusCode, 404);
    });
    test('toString', () {
      expect(_exception.toString(), 'NotFoundException: Not found');
    });
  });
}
