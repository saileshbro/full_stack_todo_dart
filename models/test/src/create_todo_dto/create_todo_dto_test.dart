import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  group('CreateTodoDto -', () {
    test('toJson test', () {
      final dto = CreateTodoDto(
        title: 'title',
        description: 'description',
      );
      expect(dto.toJson(), {
        'title': 'title',
        'description': 'description',
      });
    });

    test('fromJson test', () {
      final dto = CreateTodoDto.fromJson({
        'title': 'title',
        'description': 'description',
      });
      expect(dto.title, 'title');
      expect(dto.description, 'description');
    });

    group('validated test', () {
      test('all fields missing', () {
        final invalid = CreateTodoDto.validated({});
        expect(invalid, isA<Left<ValidationFailure, CreateTodoDto>>());
        expect(invalid.left, isA<Failure>());
        expect(invalid.left, isA<ValidationFailure>());
        expect(invalid.left.message, 'Validation failed');
        expect(invalid.left.statusCode, HttpStatus.badRequest);
        expect(invalid.left.errors, {
          'title': ['Title is required'],
          'description': ['Description is required'],
        });
      });

      test('description missing', () {
        final invalid = CreateTodoDto.validated({'title': 'title'});
        expect(invalid, isA<Left<ValidationFailure, CreateTodoDto>>());
        expect(invalid.left, isA<Failure>());
        expect(invalid.left, isA<ValidationFailure>());
        expect(invalid.left.message, 'Validation failed');
        expect(invalid.left.statusCode, HttpStatus.badRequest);
        expect(invalid.left.errors, {
          'description': ['Description is required'],
        });
      });

      test('title missing', () {
        final invalid = CreateTodoDto.validated({'description': 'description'});
        expect(invalid, isA<Left<ValidationFailure, CreateTodoDto>>());
        expect(invalid.left, isA<Failure>());
        expect(invalid.left, isA<ValidationFailure>());
        expect(invalid.left.message, 'Validation failed');
        expect(invalid.left.statusCode, HttpStatus.badRequest);
        expect(invalid.left.errors, {
          'title': ['Title is required'],
        });
      });

      test('all fields present', () {
        final invalid = CreateTodoDto.validated({
          'title': 'title',
          'description': 'description',
        });
        expect(invalid, isA<Right<ValidationFailure, CreateTodoDto>>());
        expect(invalid.right, isA<CreateTodoDto>());
        expect(invalid.right.title, 'title');
        expect(invalid.right.description, 'description');
      });
    });
  });
}
