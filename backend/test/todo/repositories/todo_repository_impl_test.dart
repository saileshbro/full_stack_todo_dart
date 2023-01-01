import 'package:backend/todo/repositories/todo_repository_impl.dart';
import 'package:data_source/data_source.dart';
import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:mocktail/mocktail.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

class MockTodoDataSource extends Mock implements TodoDataSource {}

class FakeCreateTodoDto extends Fake implements CreateTodoDto {}

class FakeUpdateTodoDto extends Fake implements UpdateTodoDto {}

class FakeTodo extends Fake implements Todo {}

void main() {
  late MockTodoDataSource mockTodoDataSource;
  late TodoRepositoryImpl todoRepositoryImpl;
  setUp(() {
    mockTodoDataSource = MockTodoDataSource();
    todoRepositoryImpl = TodoRepositoryImpl(mockTodoDataSource);
    registerFallbackValue(FakeCreateTodoDto());
    registerFallbackValue(FakeUpdateTodoDto());
    registerFallbackValue(FakeTodo());
  });
  group('TodoRepositoryTest', () {
    group('createTodo test -', () {
      test(
        'when creating throws server exception, it resolves to server failure',
        () async {
          when(() => mockTodoDataSource.createTodo(any()))
              .thenThrow(const ServerException('Internal Server Error'));
          final result = await todoRepositoryImpl.createTodo(_createTodoDto);
          verify(() => mockTodoDataSource.createTodo(_createTodoDto)).called(1);
          expect(result, isA<Left<Failure, Todo>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Internal Server Error');
          expect(result.left.statusCode, 500);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );

      test('when created successfully, it returns a todo', () async {
        when(() => mockTodoDataSource.createTodo(any())).thenAnswer(
          (_) async => _todo,
        );
        final result = await todoRepositoryImpl.createTodo(_createTodoDto);
        verify(() => mockTodoDataSource.createTodo(_createTodoDto)).called(1);
        expect(result, isA<Right<Failure, Todo>>());
        expect(result.right, isA<Todo>());
        expect(result.right.id, 1);
        expect(result.right.title, 'title');
        expect(result.right.description, 'description');
        verifyNoMoreInteractions(mockTodoDataSource);
      });
    });
    group('getTodos test -', () {
      test(
        'when fetching throws server exception, it resolves to server failure',
        () async {
          when(() => mockTodoDataSource.getAllTodo())
              .thenThrow(const ServerException('Internal Server Error'));
          final result = await todoRepositoryImpl.getTodos();
          verify(() => mockTodoDataSource.getAllTodo()).called(1);
          expect(result, isA<Left<Failure, List<Todo>>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Internal Server Error');
          expect(result.left.statusCode, 500);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );

      test('should return todos', () async {
        when(() => mockTodoDataSource.getAllTodo()).thenAnswer(
          (_) async => [_todo],
        );
        final result = await todoRepositoryImpl.getTodos();
        verify(() => mockTodoDataSource.getAllTodo()).called(1);
        expect(result, isA<Right<Failure, List<Todo>>>());
        expect(result.right, isA<List<Todo>>());
        expect(result.right, orderedEquals([_todo]));
        verifyNoMoreInteractions(mockTodoDataSource);
      });
    });
    group('getTodoById test -', () {
      test(
        'when fetching throws server exception, it resolves to server failure',
        () async {
          when(() => mockTodoDataSource.getTodoById(any()))
              .thenThrow(const ServerException('Internal Server Error'));
          final result = await todoRepositoryImpl.getTodoById(1);
          verify(() => mockTodoDataSource.getTodoById(1)).called(1);
          expect(result, isA<Left<Failure, Todo>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Internal Server Error');
          expect(result.left.statusCode, 500);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );
      test(
        'when fetching if not found for id, then it returns 404',
        () async {
          when(() => mockTodoDataSource.getTodoById(any()))
              .thenThrow(const NotFoundException('Todo not found'));
          final result = await todoRepositoryImpl.getTodoById(1);
          verify(() => mockTodoDataSource.getTodoById(1)).called(1);
          expect(result, isA<Left<Failure, Todo>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Todo not found');
          expect(result.left.statusCode, 404);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );
      test('should return a todo', () async {
        when(() => mockTodoDataSource.getTodoById(1)).thenAnswer(
          (_) async => _todo,
        );
        final result = await todoRepositoryImpl.getTodoById(1);
        verify(() => mockTodoDataSource.getTodoById(1)).called(1);
        expect(result, isA<Right<Failure, Todo>>());
        expect(result.right, isA<Todo>());
        expect(result.right, equals(_todo));
        verifyNoMoreInteractions(mockTodoDataSource);
      });
    });
    group('deleteTodo test -', () {
      test(
        'when fetching if not found for id, then it returns 404',
        () async {
          when(() => mockTodoDataSource.getTodoById(any()))
              .thenThrow(const NotFoundException('Todo not found'));
          final result = await todoRepositoryImpl.deleteTodo(1);
          verify(() => mockTodoDataSource.getTodoById(1)).called(1);
          verifyNever(() => mockTodoDataSource.deleteTodoById(1));
          expect(result, isA<Left<Failure, void>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Todo not found');
          expect(result.left.statusCode, 404);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );

      test(
        'when deleting throws exception, it resolves to server failure',
        () async {
          when(() => mockTodoDataSource.getTodoById(any()))
              .thenAnswer((_) async => _todo);
          when(() => mockTodoDataSource.deleteTodoById(1))
              .thenThrow(const ServerException('Internal Server Error'));
          final result = await todoRepositoryImpl.deleteTodo(1);
          verify(() => mockTodoDataSource.getTodoById(1)).called(1);
          verify(() => mockTodoDataSource.deleteTodoById(1)).called(1);
          expect(result, isA<Left<Failure, void>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Internal Server Error');
          expect(result.left.statusCode, 500);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );
      test(
        'when deleting succeds, it returns right void',
        () async {
          when(() => mockTodoDataSource.getTodoById(any()))
              .thenAnswer((_) async => _todo);
          when(() => mockTodoDataSource.deleteTodoById(1))
              .thenAnswer((_) => Future.value());
          final result = await todoRepositoryImpl.deleteTodo(1);
          verify(() => mockTodoDataSource.getTodoById(1)).called(1);
          verify(() => mockTodoDataSource.deleteTodoById(1)).called(1);
          expect(result, isA<Right<Failure, void>>());
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );
    });
    group('updateTodo test -', () {
      test(
        'when fetching if not found for id, then it returns 404',
        () async {
          when(
            () => mockTodoDataSource.updateTodo(
              id: any(named: 'id'),
              todo: any(named: 'todo'),
            ),
          ).thenThrow(const NotFoundException('Todo not found'));
          final result = await todoRepositoryImpl.updateTodo(
            id: 1,
            updateTodoDto: _updateTodoDto,
          );
          verify(
            () => mockTodoDataSource.updateTodo(id: 1, todo: _updateTodoDto),
          ).called(1);
          expect(result, isA<Left<Failure, Todo>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Todo not found');
          expect(result.left.statusCode, 404);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );
      test(
        'when updating throws exception, it resolves to server failure',
        () async {
          when(
            () => mockTodoDataSource.updateTodo(
              id: any(named: 'id'),
              todo: any(named: 'todo'),
            ),
          ).thenThrow(const ServerException('Internal Server Error'));
          final result = await todoRepositoryImpl.updateTodo(
            id: 1,
            updateTodoDto: _updateTodoDto,
          );
          verify(
            () => mockTodoDataSource.updateTodo(id: 1, todo: _updateTodoDto),
          ).called(1);
          expect(result, isA<Left<Failure, Todo>>());
          expect(result.left, isA<ServerFailure>());
          expect(result.left.message, 'Internal Server Error');
          expect(result.left.statusCode, 500);
          verifyNoMoreInteractions(mockTodoDataSource);
        },
      );
      test('when updating succeds, it returns updated todo', () async {
        when(
          () => mockTodoDataSource.updateTodo(
            id: any(named: 'id'),
            todo: any(named: 'todo'),
          ),
        ).thenAnswer(
          (_) async => _todo.copyWith(
            title: _updateTodoDto.title!,
          ),
        );
        final result = await todoRepositoryImpl.updateTodo(
          id: 1,
          updateTodoDto: _updateTodoDto,
        );
        verify(
          () => mockTodoDataSource.updateTodo(id: 1, todo: _updateTodoDto),
        ).called(1);
        expect(result, isA<Right<Failure, Todo>>());
        expect(result.right, isA<Todo>());
        expect(result.right.title, _updateTodoDto.title);
        verifyNoMoreInteractions(mockTodoDataSource);
      });
    });
  });
}

final _createTodoDto = CreateTodoDto(
  title: 'title',
  description: 'description',
);
final _updateTodoDto = UpdateTodoDto(
  title: 'UPDATED',
  description: 'description',
  completed: false,
);
final _todo = Todo(
  id: 1,
  title: 'title',
  description: 'description',
  completed: false,
  createdAt: DateTime.now(),
  updatedAt: DateTime.now(),
);
