import 'package:data_source/data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_todo/data/data_source/todos_http_client/todos_http_client.dart';
import 'package:fullstack_todo/data/data_source/todo_remote_data_source/todos_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:models/models.dart';

import 'todos_remote_data_source_test.mocks.dart';

@GenerateMocks([TodosHttpClient])
void main() {
  late MockTodosHttpClient mockTodosHttpClient;
  late TodoDataSource todosRemoteDataSource;
  setUp(() {
    mockTodosHttpClient = MockTodosHttpClient();
    todosRemoteDataSource = TodosRemoteDataSource(mockTodosHttpClient);
  });
  group('TodosRemoteDataSourceTest -', () {
    test('createTodo test', () async {
      when(mockTodosHttpClient.createTodo(createTodoDto))
          .thenAnswer((_) async => todo);
      final result = todosRemoteDataSource.createTodo(createTodoDto);
      expect(result, completion(equals(todo)));
      verify(mockTodosHttpClient.createTodo(createTodoDto)).called(1);
      verifyNoMoreInteractions(mockTodosHttpClient);
    });

    test('getAllTodo test', () async {
      when(mockTodosHttpClient.getAllTodo()).thenAnswer((_) async => [todo]);
      final result = todosRemoteDataSource.getAllTodo();
      expect(result, completion(equals([todo])));
      verify(mockTodosHttpClient.getAllTodo()).called(1);
      verifyNoMoreInteractions(mockTodosHttpClient);
    });

    test('getTodoById test', () async {
      when(mockTodosHttpClient.getTodoById(1)).thenAnswer((_) async => todo);
      final result = todosRemoteDataSource.getTodoById(1);
      expect(result, completion(equals(todo)));
      verify(mockTodosHttpClient.getTodoById(1)).called(1);
      verifyNoMoreInteractions(mockTodosHttpClient);
    });

    test('updateTodo test', () async {
      when(mockTodosHttpClient.updateTodo(1, updateTodoDto))
          .thenAnswer((_) async => todo);
      final result =
          todosRemoteDataSource.updateTodo(id: 1, todo: updateTodoDto);
      expect(result, completion(equals(todo)));
      verify(mockTodosHttpClient.updateTodo(1, updateTodoDto)).called(1);
      verifyNoMoreInteractions(mockTodosHttpClient);
    });

    test('deleteTodo test', () async {
      when(mockTodosHttpClient.deleteTodoById(1))
          .thenAnswer((_) => Future.value());
      final result = todosRemoteDataSource.deleteTodoById(1);
      expect(result, completion(equals(null)));
      verify(mockTodosHttpClient.deleteTodoById(1)).called(1);
      verifyNoMoreInteractions(mockTodosHttpClient);
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
