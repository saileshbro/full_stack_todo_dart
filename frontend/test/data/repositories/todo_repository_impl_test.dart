import 'package:either_dart/either.dart';
import 'package:exceptions/exceptions.dart';
import 'package:failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_todo/data/data_source/todo_remote_data_source/todos_remote_data_source.dart';
import 'package:fullstack_todo/data/data_source/todos_http_client/todos_http_client.dart';
import 'package:fullstack_todo/data/repositories/todo_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

import 'todo_repository_impl_test.mocks.dart';

@GenerateMocks([TodosRemoteDataSource, TodosHttpClient])
void main() {
  late MockTodosRemoteDataSource mockTodoDataSource;
  late TodoRepository todoRepositoryImpl;
  late MockTodosHttpClient mockTodosHttpClient;
  setUp(() {
    mockTodosHttpClient = MockTodosHttpClient();
    mockTodoDataSource = MockTodosRemoteDataSource();
    todoRepositoryImpl = TodoRepositoryImpl(mockTodoDataSource);
    when(mockTodoDataSource.httpClient).thenReturn(mockTodosHttpClient);
    when(mockTodoDataSource.createTodo(any))
        .thenAnswer((_) => mockTodosHttpClient.createTodo(any));
    when(
      mockTodoDataSource.updateTodo(
        id: anyNamed('id'),
        todo: anyNamed('todo'),
      ),
    ).thenAnswer((_) => mockTodosHttpClient.updateTodo(any, any));
    when(mockTodoDataSource.deleteTodoById(any))
        .thenAnswer((_) => mockTodosHttpClient.deleteTodoById(any));
  });
  group('TodoRepositoryTest -', () {
    group('getTodos -', () {
      test('getTodos returns all values', () async {
        when(mockTodosHttpClient.getAllTodo()).thenAnswer((_) async => [todo]);
        when(mockTodoDataSource.getAllTodo())
            .thenAnswer((_) => mockTodosHttpClient.getAllTodo());
        final result = await todoRepositoryImpl.getTodos();
        expect(result, isA<Right<Failure, List<Todo>>>());
        expect(result.right, equals([todo]));
        verify(mockTodoDataSource.getAllTodo()).called(1);
        verify(mockTodosHttpClient.getAllTodo()).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });

      test('getTodos throws NetworkException', () async {
        when(mockTodoDataSource.getAllTodo())
            .thenAnswer((_) => mockTodosHttpClient.getAllTodo());
        when(mockTodosHttpClient.getAllTodo()).thenThrow(
          NetworkException(
            message: 'Unexpected Error',
            statusCode: 500,
          ),
        );
        final result = await todoRepositoryImpl.getTodos();
        expect(result, isA<Left<Failure, List<Todo>>>());
        expect(
          result.left,
          NetworkFailure(
            message: result.left.message,
            statusCode: result.left.statusCode,
          ),
        );
        verify(mockTodoDataSource.getAllTodo()).called(1);
        verify(mockTodosHttpClient.getAllTodo()).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });
    });
    group('getTodoById -', () {
      test('getTodoById returns value', () async {
        when(mockTodosHttpClient.getTodoById(1)).thenAnswer((_) async => todo);
        when(mockTodoDataSource.getTodoById(1))
            .thenAnswer((realInvocation) => mockTodosHttpClient.getTodoById(1));
        final result = await todoRepositoryImpl.getTodoById(1);
        expect(result, isA<Right<Failure, Todo>>());
        expect(result.right, equals(todo));
        verify(mockTodoDataSource.getTodoById(1)).called(1);
        verify(mockTodosHttpClient.getTodoById(1)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });

      test('getTodoById throws not found exception', () async {
        const notFoundException = NotFoundException('Not Found');
        when(mockTodosHttpClient.getTodoById(1)).thenThrow(
          NetworkException(
            message: notFoundException.message,
            statusCode: notFoundException.statusCode,
          ),
        );
        when(mockTodoDataSource.getTodoById(1))
            .thenAnswer((realInvocation) => mockTodosHttpClient.getTodoById(1));
        final result = await todoRepositoryImpl.getTodoById(1);
        expect(
          result.left,
          NetworkFailure(
            message: result.left.message,
            statusCode: result.left.statusCode,
          ),
        );
        verify(mockTodoDataSource.getTodoById(1)).called(1);
        verify(mockTodosHttpClient.getTodoById(1)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });
    });

    group('createTodo -', () {
      test('createTodo returns created todo', () async {
        when(mockTodosHttpClient.createTodo(createTodoDto))
            .thenAnswer((_) async => todo);
        when(mockTodoDataSource.createTodo(createTodoDto))
            .thenAnswer((_) => mockTodosHttpClient.createTodo(createTodoDto));
        final result = await todoRepositoryImpl.createTodo(createTodoDto);
        expect(result, isA<Right<Failure, Todo>>());
        expect(result.right, equals(todo));
        verify(mockTodoDataSource.createTodo(createTodoDto)).called(1);
        verify(mockTodosHttpClient.createTodo(createTodoDto)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });

      test('createTodo throws error', () async {
        when(mockTodoDataSource.createTodo(createTodoDto))
            .thenAnswer((_) => mockTodosHttpClient.createTodo(createTodoDto));
        when(mockTodosHttpClient.createTodo(createTodoDto)).thenThrow(
          NetworkException(
            message: 'Unexpected Error',
            statusCode: 500,
          ),
        );
        final result = await todoRepositoryImpl.createTodo(createTodoDto);
        expect(result, isA<Left<Failure, Todo>>());
        expect(
          result.left,
          NetworkFailure(
            message: result.left.message,
            statusCode: result.left.statusCode,
          ),
        );
        verify(mockTodoDataSource.createTodo(createTodoDto)).called(1);
        verify(mockTodosHttpClient.createTodo(createTodoDto)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });
    });

    group('updateTodo -', () {
      test('updateTodo returns updated todo', () async {
        when(mockTodosHttpClient.updateTodo(1, updateTodoDto))
            .thenAnswer((_) async => todo);
        when(mockTodoDataSource.updateTodo(id: 1, todo: updateTodoDto))
            .thenAnswer(
          (_) => mockTodosHttpClient.updateTodo(1, updateTodoDto),
        );
        final result = await todoRepositoryImpl.updateTodo(
          id: 1,
          updateTodoDto: updateTodoDto,
        );
        expect(result, isA<Right<Failure, Todo>>());
        expect(result.right, equals(todo));
        verify(mockTodoDataSource.updateTodo(id: 1, todo: updateTodoDto))
            .called(1);
        verify(mockTodosHttpClient.updateTodo(1, updateTodoDto)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });

      test('updateTodo throws error', () async {
        const notFoundException = NotFoundException('Not Found');
        when(mockTodoDataSource.updateTodo(id: 1, todo: updateTodoDto))
            .thenAnswer(
          (_) => mockTodosHttpClient.updateTodo(1, updateTodoDto),
        );
        when(mockTodosHttpClient.updateTodo(1, updateTodoDto)).thenThrow(
          NetworkException(
            message: notFoundException.message,
            statusCode: notFoundException.statusCode,
          ),
        );
        final result = await todoRepositoryImpl.updateTodo(
          id: 1,
          updateTodoDto: updateTodoDto,
        );
        expect(result, isA<Left<Failure, Todo>>());
        expect(
          result.left,
          NetworkFailure(
            message: result.left.message,
            statusCode: result.left.statusCode,
          ),
        );
        verify(mockTodoDataSource.updateTodo(id: 1, todo: updateTodoDto))
            .called(1);
        verify(mockTodosHttpClient.updateTodo(1, updateTodoDto)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });
    });

    group('deleteTodo -', () {
      test('deleteTodo works fine', () async {
        when(mockTodosHttpClient.deleteTodoById(1))
            .thenAnswer((_) async => todo);
        when(mockTodoDataSource.deleteTodoById(1)).thenAnswer(
          (_) => mockTodosHttpClient.deleteTodoById(1),
        );
        final result = await todoRepositoryImpl.deleteTodo(1);
        expect(result, isA<Right<Failure, void>>());
        verify(mockTodoDataSource.deleteTodoById(1)).called(1);
        verify(mockTodosHttpClient.deleteTodoById(1)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });

      test('deleteTodo throws error', () async {
        const notFoundException = NotFoundException('Not Found');
        when(mockTodoDataSource.deleteTodoById(1)).thenAnswer(
          (_) => mockTodosHttpClient.deleteTodoById(1),
        );
        when(mockTodosHttpClient.deleteTodoById(1)).thenThrow(
          NetworkException(
            message: notFoundException.message,
            statusCode: notFoundException.statusCode,
          ),
        );
        final result = await todoRepositoryImpl.deleteTodo(1);
        expect(result, isA<Left<Failure, void>>());
        expect(
          result.left,
          NetworkFailure(
            message: result.left.message,
            statusCode: result.left.statusCode,
          ),
        );
        verify(mockTodoDataSource.deleteTodoById(1)).called(1);
        verify(mockTodosHttpClient.deleteTodoById(1)).called(1);
        verifyNoMoreInteractions(mockTodoDataSource);
        verifyNoMoreInteractions(mockTodosHttpClient);
      });
    });
  });
}

final todo = Todo(
  id: 1,
  title: 'title',
  createdAt: DateTime.now(),
  description: 'description',
);

final createTodoDto = CreateTodoDto(
  title: 'title',
  description: 'description',
);

final updateTodoDto = UpdateTodoDto(
  title: 'title',
  description: 'description',
  completed: true,
);
