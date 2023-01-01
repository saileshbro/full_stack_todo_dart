import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  late Todo createdTodo;
  tearDownAll(() async {
    final response = await http.get(Uri.parse('http://localhost:8080/todos'));
    final todos = (jsonDecode(response.body) as List)
        .map((e) => Todo.fromJson(e as Map<String, dynamic>))
        .toList();
    for (final todo in todos) {
      await http.delete(Uri.parse('http://localhost:8080/todos/${todo.id}'));
    }
  });
  group('E2E -', () {
    test('GET /todos returns empty list of todos', () async {
      final response = await http.get(Uri.parse('http://localhost:8080/todos'));
      expect(response.statusCode, HttpStatus.ok);
      expect(response.body, equals('[]'));
    });

    test('POST /todos to create a new todo', () async {
      final response = await http.post(
        Uri.parse('http://localhost:8080/todos'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(_createTodoDto.toJson()),
      );
      expect(response.statusCode, HttpStatus.created);
      createdTodo =
          Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      expect(createdTodo.title, equals(_createTodoDto.title));
      expect(createdTodo.description, equals(_createTodoDto.description));
    });

    test('GET /todos returns list of todos with one todo', () async {
      final response = await http.get(Uri.parse('http://localhost:8080/todos'));
      expect(response.statusCode, HttpStatus.ok);
      final todos = (jsonDecode(response.body) as List)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();
      expect(todos.length, equals(1));
      expect(todos.first, equals(createdTodo));
    });

    test('GET /todos/:id returns the created todo', () async {
      final response = await http.get(
        Uri.parse('http://localhost:8080/todos/${createdTodo.id}'),
      );
      expect(response.statusCode, HttpStatus.ok);
      final todo =
          Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      expect(todo, equals(createdTodo));
    });

    test('PUT /todos/:id to update the created todo', () async {
      final updateTodoDto = UpdateTodoDto(
        title: 'updated title',
        description: 'updated description',
      );
      final response = await http.put(
        Uri.parse('http://localhost:8080/todos/${createdTodo.id}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updateTodoDto.toJson()),
      );
      expect(response.statusCode, HttpStatus.ok);
      final todo =
          Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      expect(todo.title, equals(updateTodoDto.title));
      expect(todo.description, equals(updateTodoDto.description));
    });

    test('PATCH /todos/:id to update the created todo', () async {
      final updateTodoDto = UpdateTodoDto(
        title: 'UPDATED TITLE',
        description: 'UPDATED DESCRIPTION',
      );
      final response = await http.patch(
        Uri.parse('http://localhost:8080/todos/${createdTodo.id}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updateTodoDto.toJson()),
      );
      expect(response.statusCode, HttpStatus.ok);
      final todo =
          Todo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      expect(todo.title, equals(updateTodoDto.title));
      expect(todo.description, equals(updateTodoDto.description));
    });

    test('DELETE /todos/:id to delete the created todo', () async {
      final response = await http.delete(
        Uri.parse('http://localhost:8080/todos/${createdTodo.id}'),
      );
      expect(response.statusCode, HttpStatus.ok);
      expect(response.body, jsonEncode({'message': 'OK'}));
    });
    test('GET /todos returns empty list of todos', () async {
      final response = await http.get(Uri.parse('http://localhost:8080/todos'));
      expect(response.statusCode, HttpStatus.ok);
      expect(response.body, equals('[]'));
    });
  });
}

final _createTodoDto = CreateTodoDto(
  title: 'title',
  description: 'description',
);
