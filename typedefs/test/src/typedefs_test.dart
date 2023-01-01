import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:test/test.dart';
import 'package:typedefs/typedefs.dart';

void main() {
  group('typedefs test', () {
    group('mapTodoId', () {
      test('valid id tests', () {
        final todoId = mapTodoId('1');
        expect(todoId, isA<Right>());
        expect(todoId.right, isA<TodoId>());
      });

      test('invalid id tests', () {
        final todoId = mapTodoId('1s');
        expect(todoId, isA<Left>());
        expect(todoId.left, isA<Failure>());
        expect(todoId.left, isA<RequestFailure>());
        expect(todoId.left.message, 'Invalid id');
        expect(todoId.left.statusCode, 400);
      });
    });
  });
}
