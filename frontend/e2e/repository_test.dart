import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:failures/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

void main() {
  late Todo createdTodo;
  late TodoRepository todoRepository;
  late List<Todo> todos;
  setUpAll(() {
    setupLocator();
    todoRepository = locator<TodoRepository>();
  });
  tearDownAll(() async {
    for (final todo in todos) {
      await todoRepository.deleteTodo(todo.id);
    }
    await locator.reset();
  });
  group('RepositoryTest -', () {
    test('successful Create', () async {
      final todo = CreateTodoDto(
        title: 'Test',
        description: 'Test',
      );
      final result = await todoRepository.createTodo(todo);
      expect(result, isA<Right<Failure, Todo>>());
      createdTodo = result.right;
      expect(createdTodo.title, todo.title);
      expect(createdTodo.description, todo.description);
    });
    test('failing create', () async {
      final failedResult = await todoRepository
          .createTodo(CreateTodoDto(title: '', description: ''));
      expect(failedResult, isA<Left<Failure, Todo>>());
      final failure = failedResult.left as NetworkFailure;
      expect(failure, isA<NetworkFailure>());
      expect(failure.message, 'Validation failed');
      expect(failure.errors, {
        'title': ['Title is required'],
        'description': ['Description is required'],
      });
      expect(failure.statusCode, HttpStatus.badRequest);
    });
    test('successful update', () async {
      final updatedRes = await todoRepository.updateTodo(
        id: createdTodo.id,
        updateTodoDto: UpdateTodoDto(completed: true),
      );
      expect(updatedRes, isA<Right<Failure, Todo>>());
      final updated = updatedRes.right;
      expect(updated.completed, true);
      expect(updated.title, createdTodo.title);
      expect(updated.description, createdTodo.description);
    });
    test('failing update with not found', () async {
      final failedUpdateRes = await todoRepository.updateTodo(
        id: -1,
        updateTodoDto: UpdateTodoDto(completed: true),
      );
      expect(failedUpdateRes, isA<Left<Failure, Todo>>());
      final failedUpdate = failedUpdateRes.left as NetworkFailure;
      expect(failedUpdate, isA<NetworkFailure>());
      expect(failedUpdate.message, 'Todo not found');
      expect(failedUpdate.statusCode, HttpStatus.notFound);
    });
    test('failing update with validation failure', () async {
      final failedUpdateRes = await todoRepository.updateTodo(
        id: -1,
        updateTodoDto: UpdateTodoDto(),
      );
      expect(failedUpdateRes, isA<Left<Failure, Todo>>());
      final failedUpdate = failedUpdateRes.left as NetworkFailure;
      expect(failedUpdate, isA<NetworkFailure>());
      expect(failedUpdate.message, 'Validation failed');
      expect(failedUpdate.errors, {
        'title': ['At least one field must be provided'],
        'description': ['At least one field must be provided'],
        'completed': ['At least one field must be provided'],
      });
      expect(failedUpdate.statusCode, HttpStatus.badRequest);
    });
    test('successful get by id', () async {
      final result = await todoRepository.getTodoById(createdTodo.id);
      expect(result, isA<Right<Failure, Todo>>());
      final todo = result.right;
      expect(todo.id, createdTodo.id);
      expect(todo.title, createdTodo.title);
      expect(todo.description, createdTodo.description);
    });
    test('failing get by id with not found', () async {
      final failedUpdateRes = await todoRepository.getTodoById(-1);
      expect(failedUpdateRes, isA<Left<Failure, Todo>>());
      final failedUpdate = failedUpdateRes.left as NetworkFailure;
      expect(failedUpdate, isA<NetworkFailure>());
      expect(failedUpdate.message, 'Todo not found');
      expect(failedUpdate.statusCode, HttpStatus.notFound);
    });
    test('successful get all', () async {
      final result = await todoRepository.getTodos();
      expect(result, isA<Right<Failure, List<Todo>>>());
      todos = result.right;
      expect(todos, isA<List<Todo>>());
    });
    test('successful delete', () async {
      final result = await todoRepository.deleteTodo(createdTodo.id);
      expect(result, isA<Right<Failure, void>>());
    });
    test('failing delete with not found', () async {
      final failedUpdateRes = await todoRepository.deleteTodo(-1);
      expect(failedUpdateRes, isA<Left<Failure, void>>());
      final failedUpdate = failedUpdateRes.left as NetworkFailure;
      expect(failedUpdate, isA<NetworkFailure>());
      expect(failedUpdate.message, 'Todo not found');
      expect(failedUpdate.statusCode, HttpStatus.notFound);
    });
  });
}
