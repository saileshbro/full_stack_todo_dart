// Mocks generated by Mockito 5.3.2 from annotations
// in fullstack_todo/test/data/repositories/todo_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:fullstack_todo/data/data_source/todo_remote_data_source/todos_remote_data_source.dart'
    as _i4;
import 'package:fullstack_todo/data/data_source/todos_http_client/todos_http_client.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:models/models.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTodosHttpClient_0 extends _i1.SmartFake
    implements _i2.TodosHttpClient {
  _FakeTodosHttpClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTodo_1 extends _i1.SmartFake implements _i3.Todo {
  _FakeTodo_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodosRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodosRemoteDataSource extends _i1.Mock
    implements _i4.TodosRemoteDataSource {
  MockTodosRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TodosHttpClient get httpClient => (super.noSuchMethod(
        Invocation.getter(#httpClient),
        returnValue: _FakeTodosHttpClient_0(
          this,
          Invocation.getter(#httpClient),
        ),
      ) as _i2.TodosHttpClient);
  @override
  _i5.Future<_i3.Todo> createTodo(_i3.CreateTodoDto? todo) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTodo,
          [todo],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #createTodo,
            [todo],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
  @override
  _i5.Future<void> deleteTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodoById,
          [id],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<List<_i3.Todo>> getAllTodo() => (super.noSuchMethod(
        Invocation.method(
          #getAllTodo,
          [],
        ),
        returnValue: _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
      ) as _i5.Future<List<_i3.Todo>>);
  @override
  _i5.Future<_i3.Todo> getTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTodoById,
          [id],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
  @override
  _i5.Future<_i3.Todo> updateTodo({
    required int? id,
    required _i3.UpdateTodoDto? todo,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [],
          {
            #id: id,
            #todo: todo,
          },
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #updateTodo,
            [],
            {
              #id: id,
              #todo: todo,
            },
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
}

/// A class which mocks [TodosHttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodosHttpClient extends _i1.Mock implements _i2.TodosHttpClient {
  MockTodosHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i3.Todo>> getAllTodo() => (super.noSuchMethod(
        Invocation.method(
          #getAllTodo,
          [],
        ),
        returnValue: _i5.Future<List<_i3.Todo>>.value(<_i3.Todo>[]),
      ) as _i5.Future<List<_i3.Todo>>);
  @override
  _i5.Future<_i3.Todo> getTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getTodoById,
          [id],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #getTodoById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
  @override
  _i5.Future<_i3.Todo> createTodo(_i3.CreateTodoDto? todo) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTodo,
          [todo],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #createTodo,
            [todo],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
  @override
  _i5.Future<_i3.Todo> updateTodo(
    int? id,
    _i3.UpdateTodoDto? todo,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateTodo,
          [
            id,
            todo,
          ],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #updateTodo,
            [
              id,
              todo,
            ],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
  @override
  _i5.Future<_i3.Todo> deleteTodoById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteTodoById,
          [id],
        ),
        returnValue: _i5.Future<_i3.Todo>.value(_FakeTodo_1(
          this,
          Invocation.method(
            #deleteTodoById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Todo>);
}
