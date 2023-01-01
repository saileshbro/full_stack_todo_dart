import 'package:exceptions/exceptions.dart';
import 'package:test/test.dart';

void main() {
  test('ServerExceptionTest -', () {
    const exception = ServerException('Server error');
    expect(exception.message, 'Server error');
    expect(exception.toString(), 'ServerException: Server error');
  });
}
