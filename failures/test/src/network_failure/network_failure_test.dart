import 'package:failures/failures.dart';
import 'package:test/test.dart';

void main() {
  group('NetworkFailureTest -', () {
    test('fromJson Test', () {
      final json = {
        'message': 'message',
        'status_code': 1,
        'errors': ['error1', 'error2'],
      };
      final networkFailure = NetworkFailure.fromJson(json);
      expect(networkFailure.message, 'message');
      expect(networkFailure.statusCode, 1);
      expect(networkFailure.errors, orderedEquals(['error1', 'error2']));
    });

    test('toJson Test', () {
      const networkFailure = NetworkFailure(
        message: 'message',
        statusCode: 1,
        errors: ['error1', 'error2'],
      );
      final json = networkFailure.toJson();
      expect(json['message'], 'message');
      expect(json['status_code'], 1);
      expect(json['errors'], orderedEquals(['error1', 'error2']));
    });
  });
}
