import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateTodoDto -', () {
    test('empty toJson test', () {
      final dto = UpdateTodoDto();
      expect(dto.toJson(), {
        'title': null,
        'description': null,
        'completed': null,
      });
    });

    test('nonEmpty toJson test', () {
      final dto = UpdateTodoDto(
        completed: true,
        description: 'description',
        title: 'title',
      );
      expect(dto.toJson(), {
        'title': 'title',
        'description': 'description',
        'completed': true,
      });
    });

    test('empty fromJson test', () {
      final dto = UpdateTodoDto.fromJson({});
      expect(dto, UpdateTodoDto());
      expect(dto.title, null);
      expect(dto.description, null);
    });

    test('nonEmpty fromJson test', () {
      final dto = UpdateTodoDto.fromJson({
        'title': 'title',
        'description': 'description',
        'completed': true,
      });
      expect(dto.title, 'title');
      expect(dto.description, 'description');
      expect(dto.completed, true);
    });
    group('validated test -', () {
      test('all fields missing', () {
        final invalid = UpdateTodoDto.validated({});
        expect(invalid, isA<Left>());
        expect(invalid.left, isA<Failure>());
        expect(invalid.left, isA<ValidationFailure>());
        expect(invalid.left.message, 'Validation failed');
        expect(invalid.left.statusCode, HttpStatus.badRequest);
        expect(invalid.left.errors, {
          'title': ['At least one field must be provided'],
          'description': ['At least one field must be provided'],
          'completed': ['At least one field must be provided'],
        });
      });

      test('description missing', () {
        final invalid = UpdateTodoDto.validated({
          'title': 'title',
          'completed': true,
        });
        expect(invalid, isA<Right>());
        expect(invalid.right, isA<UpdateTodoDto>());
        expect(invalid.right.title, 'title');
        expect(invalid.right.description, null);
        expect(invalid.right.completed, true);
      });

      test('title missing', () {
        final invalid = UpdateTodoDto.validated({
          'description': 'description',
          'completed': true,
        });
        expect(invalid, isA<Right>());
        expect(invalid.right, isA<UpdateTodoDto>());
        expect(invalid.right.title, null);
        expect(invalid.right.description, 'description');
        expect(invalid.right.completed, true);
      });

      test('completed missing', () {
        final invalid = UpdateTodoDto.validated({
          'title': 'title',
          'description': 'description',
        });
        expect(invalid, isA<Right>());
        expect(invalid.right, isA<UpdateTodoDto>());
        expect(invalid.right.title, 'title');
        expect(invalid.right.description, 'description');
        expect(invalid.right.completed, null);
      });

      test('all fields present', () {
        final invalid = UpdateTodoDto.validated({
          'title': 'title',
          'description': 'description',
          'completed': true,
        });
        expect(invalid, isA<Right>());
        expect(invalid.right, isA<UpdateTodoDto>());
        expect(invalid.right.title, 'title');
        expect(invalid.right.description, 'description');
        expect(invalid.right.completed, true);
      });
    });
  });
}
