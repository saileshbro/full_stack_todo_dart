import 'dart:convert';
import 'dart:io';

import 'package:backend/todo/controller/todo_controller.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:test/test.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

class FakeCreateTodoDto extends Fake implements CreateTodoDto {}

class FakeUpdateTodoDto extends Fake implements UpdateTodoDto {}

void main() {
  late MockTodoRepository mockTodoRepository;
  late TodoController todoController;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    todoController = TodoController(mockTodoRepository);
    registerFallbackValue(FakeCreateTodoDto());
    registerFallbackValue(FakeUpdateTodoDto());
  });
  group('TodoControllerTest', () {
    group('index test -', () {
      test('when issue with query, should return 505', () async {
        when(() => mockTodoRepository.getTodos()).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'Server error')),
        );
        final response = await todoController.index(
          Request(
            'GET',
            Uri.parse('http://localhost:8080/todos'),
          ),
        );
        verify(() => mockTodoRepository.getTodos()).called(1);
        expect(response, isA<Response>());
        expect(response.statusCode, 500);
        expect(
          response.body(),
          completion(jsonEncode({'message': 'Server error'})),
        );
        verifyNoMoreInteractions(mockTodoRepository);
      });

      test('when query returns empty, should return 200', () async {
        when(() => mockTodoRepository.getTodos()).thenAnswer(
          (_) async => const Right([]),
        );
        final response = await todoController.index(
          Request(
            'GET',
            Uri.parse('http://localhost:8080/todos'),
          ),
        );
        verify(() => mockTodoRepository.getTodos()).called(1);
        expect(response, isA<Response>());
        expect(response.statusCode, 200);
        expect(response.body(), completion(jsonEncode([])));
        verifyNoMoreInteractions(mockTodoRepository);
      });

      test('when query returns non-empty, should return 200', () async {
        final createdAt = DateTime.now();
        final todo = Todo(
          id: 1,
          userId: 'userId',
          title: 'title',
          description: 'description',
          createdAt: createdAt,
        );

        when(() => mockTodoRepository.getTodos()).thenAnswer(
          (_) async => Right([todo]),
        );
        final response = await todoController.index(
          Request(
            'GET',
            Uri.parse('http://localhost:8080/todos'),
          ),
        );
        verify(() => mockTodoRepository.getTodos()).called(1);
        expect(response, isA<Response>());
        expect(response.statusCode, 200);
        expect(response.body(), completion(jsonEncode([todo.toJson()])));
        verifyNoMoreInteractions(mockTodoRepository);
      });
    });
    group('show test -', () {
      test('when the id is invalid, it returns RequestFailure', () async {
        final response = await todoController.show(
          Request(
            'GET',
            Uri.parse('http://localhost:8080/todos/invalid'),
          ),
          'invalid',
        );
        verifyNoMoreInteractions(mockTodoRepository);
        expect(response, isA<Response>());
        expect(response.statusCode, 400);
        expect(
          response.body(),
          completion(jsonEncode({'message': 'Invalid id'})),
        );
        verifyNoMoreInteractions(mockTodoRepository);
      });

      test(
        'when the id is valid, and the todo does not exist, it returns 404',
        () async {
          when(() => mockTodoRepository.getTodoById(any())).thenAnswer(
            (_) async => const Left(
              ServerFailure(
                message: 'Todo not found',
                statusCode: 404,
              ),
            ),
          );
          final response = await todoController.show(
            Request(
              'GET',
              Uri.parse('http://localhost:8080/todos/1'),
            ),
            '1',
          );
          verify(() => mockTodoRepository.getTodoById(1)).called(1);
          expect(response, isA<Response>());
          expect(response.statusCode, 404);
          expect(
            response.body(),
            completion(jsonEncode({'message': 'Todo not found'})),
          );
          verifyNoMoreInteractions(mockTodoRepository);
        },
      );

      test(
        'when the id is valid, and the todo does exist, returns todo with 200',
        () async {
          final createdAt = DateTime.now();
          final todo = Todo(
            id: 1,
            userId: 'userId',
            title: 'title',
            description: 'description',
            createdAt: createdAt,
          );
          when(() => mockTodoRepository.getTodoById(any())).thenAnswer(
            (_) async => Right(todo),
          );
          final response = await todoController.show(
            Request(
              'GET',
              Uri.parse('http://localhost:8080/todos/1'),
            ),
            '1',
          );
          verify(() => mockTodoRepository.getTodoById(1)).called(1);
          expect(response, isA<Response>());
          expect(response.statusCode, 200);
          expect(response.body(), completion(jsonEncode(todo.toJson())));
          verifyNoMoreInteractions(mockTodoRepository);
        },
      );
    });
    group('destroy test -', () {
      test('when the id is invalid, it returns RequestFailure', () async {
        when(() => mockTodoRepository.deleteTodo(any())).thenAnswer(
          (_) async => const Left(
            RequestFailure(
              message: 'Invalid id',
              statusCode: 400,
            ),
          ),
        );
        final response = await todoController.destroy(
          Request(
            'DELETE',
            Uri.parse('http://localhost:8080/todos/invalid'),
          ),
          'invalid',
        );
        verifyNever(() => mockTodoRepository.deleteTodo(any()));
        expect(response, isA<Response>());
        expect(response.statusCode, 400);
        expect(
          response.body(),
          completion(jsonEncode({'message': 'Invalid id'})),
        );
        verifyNoMoreInteractions(mockTodoRepository);
      });
      test(
        'when the id is valid, and the todo does not exist, it returns 404',
        () async {
          when(() => mockTodoRepository.deleteTodo(any())).thenAnswer(
            (_) async => const Left(
              ServerFailure(
                message: 'Todo not found',
                statusCode: 404,
              ),
            ),
          );
          final response = await todoController.destroy(
            Request(
              'DELETE',
              Uri.parse('http://localhost:8080/todos/1'),
            ),
            '1',
          );
          verify(() => mockTodoRepository.deleteTodo(1)).called(1);
          expect(response, isA<Response>());
          expect(response.statusCode, 404);
          expect(
            response.body(),
            completion(jsonEncode({'message': 'Todo not found'})),
          );
          verifyNoMoreInteractions(mockTodoRepository);
        },
      );
      test(
        'when the id is valid, and the todo does 200',
        () async {
          when(() => mockTodoRepository.deleteTodo(any())).thenAnswer(
            (_) async => const Right(null),
          );
          final response = await todoController.destroy(
            Request(
              'DELETE',
              Uri.parse('http://localhost:8080/todos/1'),
            ),
            '1',
          );
          verify(() => mockTodoRepository.deleteTodo(1)).called(1);
          expect(response, isA<Response>());
          expect(response.statusCode, 200);
          expect(
            response.body(),
            completion(jsonEncode({'message': 'OK'})),
          );
        },
      );
    });
    group('store test -', () {
      test('should return Invalid body when not present', () async {
        final response = await todoController.store(
          Request('POST', Uri.parse('http://localhost:8080/todos')),
        );
        expect(response, isA<Response>());
        expect(response.statusCode, 400);
        expect(
          response.body(),
          completion(jsonEncode({'message': 'Invalid body'})),
        );
      });
      test('should return errors if data not present', () async {
        when(
          () => mockTodoRepository.createTodo(
            any(),
          ),
        ).thenAnswer(
          (_) async => const Left(
            ValidationFailure(
              message: 'Validation failed',
              statusCode: 406,
              errors: {
                'title': ['Title is required'],
                'description': ['Description is required'],
              },
            ),
          ),
        );
        final response = await todoController.store(
          Request('POST', Uri.parse('http://localhost:8080/todos'), body: '{}'),
        );
        verifyNever(() => mockTodoRepository.createTodo(any()));
        expect(response, isA<Response>());
        expect(response.statusCode, HttpStatus.badRequest);
        expect(
          response.body(),
          completion(
            jsonEncode({
              'message': 'Validation failed',
              'errors': {
                'title': ['Title is required'],
                'description': ['Description is required'],
              },
            }),
          ),
        );
        verifyNoMoreInteractions(mockTodoRepository);
      });

      test('should return errors if data not valid', () async {
        when(
          () => mockTodoRepository.createTodo(
            any(),
          ),
        ).thenAnswer(
          (_) async => const Left(
            ValidationFailure(
              message: 'Validation failed',
              statusCode: 406,
              errors: {
                'description': ['Description is required'],
              },
            ),
          ),
        );
        final response = await todoController.store(
          Request(
            'POST',
            Uri.parse('http://localhost:8080/todos'),
            body: '{"title":"title"}',
          ),
        );
        verifyNever(() => mockTodoRepository.createTodo(any()));
        expect(response, isA<Response>());
        expect(response.statusCode, HttpStatus.badRequest);
        expect(
          response.body(),
          completion(
            jsonEncode({
              'message': 'Validation failed',
              'errors': {
                'description': ['Description is required'],
              },
            }),
          ),
        );
        verifyNoMoreInteractions(mockTodoRepository);
      });

      test('should return todo if data valid', () async {
        final todo = Todo(
          id: 1,
          userId: 'userId',
          title: 'title',
          description: 'description',
          createdAt: DateTime.now(),
        );
        when(
          () => mockTodoRepository.createTodo(
            any(),
          ),
        ).thenAnswer(
          (_) async => Right(todo),
        );
        final response = await todoController.store(
          Request(
            'POST',
            Uri.parse('http://localhost:8080/todos'),
            body: '{"title":"title","description":"description"}',
          ),
        );
        verify(
          () => mockTodoRepository.createTodo(
            CreateTodoDto(
              title: 'title',
              description: 'description',
            ),
          ),
        ).called(1);
        expect(response, isA<Response>());
        expect(response.statusCode, 201);
        expect(
          response.body(),
          completion(jsonEncode(todo.toJson())),
        );
        verifyNoMoreInteractions(mockTodoRepository);
      });

      test('should return error if unable to create todo', () async {
        when(
          () => mockTodoRepository.createTodo(
            any(),
          ),
        ).thenAnswer(
          (_) async => const Left(
            ServerFailure(
              message: 'Unable to create todo',
              statusCode: 500,
            ),
          ),
        );
        final response = await todoController.store(
          Request(
            'POST',
            Uri.parse('http://localhost:8080/todos'),
            body: '{"title":"title","description":"description"}',
          ),
        );
        verify(
          () => mockTodoRepository.createTodo(
            CreateTodoDto(
              title: 'title',
              description: 'description',
            ),
          ),
        ).called(1);
        expect(response, isA<Response>());
        expect(response.statusCode, 500);
        expect(
          response.body(),
          completion(jsonEncode({'message': 'Unable to create todo'})),
        );
        verifyNoMoreInteractions(mockTodoRepository);
      });
    });
    group('update test -', () {
      test('should return Invalid body when not present', () async {
        for (final method in ['PATCH', 'PUT']) {
          final response = await todoController.update(
            Request(
              method,
              Uri.parse('http://localhost:8080/todos/1'),
            ),
            '1',
          );
          expect(response, isA<Response>());
          expect(response.statusCode, 400);
          expect(
            response.body(),
            completion(jsonEncode({'message': 'Invalid body'})),
          );
        }
      });

      test('should return Invalid body when body is not json', () async {
        for (final method in ['PATCH', 'PUT']) {
          final response = await todoController.store(
            Request(
              method,
              Uri.parse('http://localhost:8080/todos'),
              body: 'fasdf123',
            ),
          );
          expect(response, isA<Response>());
          expect(response.statusCode, 400);
          expect(
            response.body(),
            completion(jsonEncode({'message': 'Invalid body'})),
          );
        }
      });
      test('when the id is invalid, it returns RequestFailure', () async {
        when(
          () => mockTodoRepository.updateTodo(
            id: any(named: 'id'),
            updateTodoDto: any(named: 'updateTodoDto'),
          ),
        ).thenAnswer(
          (_) async => const Left(
            RequestFailure(
              message: 'Invalid id',
              statusCode: 400,
            ),
          ),
        );
        for (final method in ['PUT', 'PATCH']) {
          reset(mockTodoRepository);
          final response = await todoController.update(
            Request(
              method,
              Uri.parse('http://localhost:8080/todos/invalid'),
              body: '{}',
            ),
            'invalid',
          );
          verifyNever(
            () => mockTodoRepository.updateTodo(
              id: any(named: 'id'),
              updateTodoDto: any(named: 'updateTodoDto'),
            ),
          );
          expect(response, isA<Response>());
          expect(response.statusCode, 400);
          expect(
            response.body(),
            completion(jsonEncode({'message': 'Invalid id'})),
          );
          verifyNoMoreInteractions(mockTodoRepository);
        }
      });

      test('when the id is valid, and there is server failure', () async {
        when(
          () => mockTodoRepository.updateTodo(
            id: any(named: 'id'),
            updateTodoDto: any(named: 'updateTodoDto'),
          ),
        ).thenAnswer(
          (_) async => const Left(
            ServerFailure(
              message: 'Unable to update todo',
              statusCode: 500,
            ),
          ),
        );
        final response = await todoController.update(
          Request(
            'PATCH',
            Uri.parse('http://localhost:8080/todos/1'),
            body: '{"title":"updated"}',
          ),
          '1',
        );
        verify(
          () => mockTodoRepository.updateTodo(
            id: 1,
            updateTodoDto: UpdateTodoDto(title: 'updated'),
          ),
        ).called(1);
        expect(
          response.body(),
          completion(jsonEncode({'message': 'Unable to update todo'})),
        );
        expect(response.statusCode, 500);
      });
      test('when the body is not valid, then should return errors', () async {
        when(
          () => mockTodoRepository.updateTodo(
            id: any(named: 'id'),
            updateTodoDto: any(named: 'updateTodoDto'),
          ),
        ).thenAnswer(
          (_) async => const Left(
            ValidationFailure(
              message: 'Validation failed',
              errors: {
                'title': ['At least one field must be provided'],
                'description': ['At least one field must be provided'],
                'completed': ['At least one field must be provided'],
              },
            ),
          ),
        );
        final response = await todoController.update(
          Request(
            'PATCH',
            Uri.parse('http://localhost:8080/todos/1'),
            body: '{"title":""}',
          ),
          '1',
        );
        verifyNever(
          () => mockTodoRepository.updateTodo(
            id: 1,
            updateTodoDto: UpdateTodoDto(title: ''),
          ),
        );
        expect(
          response.body(),
          completion(
            jsonEncode({
              'message': 'Validation failed',
              'errors': {
                'title': ['At least one field must be provided'],
                'description': ['At least one field must be provided'],
                'completed': ['At least one field must be provided']
              }
            }),
          ),
        );
      });
      test('when the todo is successfully updated', () async {
        final createdAt = DateTime.now().subtract(const Duration(days: 1));
        final updatedAt = DateTime.now();
        final todo = Todo(
          id: 1,
          userId: '1',
          title: 'UPDATED',
          description: 'description',
          completed: false,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
        for (final method in ['PUT', 'PATCH']) {
          reset(mockTodoRepository);
          when(
            () => mockTodoRepository.updateTodo(
              id: any(named: 'id'),
              updateTodoDto: any(named: 'updateTodoDto'),
            ),
          ).thenAnswer(
            (_) async => Right(todo),
          );
          final response = await todoController.update(
            Request(
              method,
              Uri.parse('http://localhost:8080/todos/1'),
              body: '{"title":"UPDATED"}',
            ),
            '1',
          );
          verify(
            () => mockTodoRepository.updateTodo(
              id: 1,
              updateTodoDto: UpdateTodoDto(title: 'UPDATED'),
            ),
          ).called(1);
          expect(
            response.body(),
            completion(
              jsonEncode({
                'id': 1,
                'title': 'UPDATED',
                'description': 'description',
                'completed': false,
                'created_at': createdAt.toIso8601String(),
                'updated_at': updatedAt.toIso8601String(),
              }),
            ),
          );
          verifyNoMoreInteractions(mockTodoRepository);
        }
      });
    });
  });
}
