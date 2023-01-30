import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class TodosDataService with ListenableServiceMixin {
  TodosDataService() {
    listenToReactiveValues([_todos]);
  }
  late final ReactiveValue<List<Todo>> _todos = ReactiveValue<List<Todo>>([]);

  List<Todo> get todos => _todos.value;

  @visibleForTesting
  Stream<Iterable<Todo>> get todosStream => _todos.values;

  void add(Todo todo) {
    final index = _todos.value.indexWhere((element) => element.id == todo.id);
    if (index == -1) {
      _todos.value.insert(0, todo);
    } else {
      _todos.value[index] = todo;
    }
    notifyListeners();
  }

  void addAll(List<Todo> todos) {
    _todos.value
      ..clear()
      ..insertAll(0, todos);
    notifyListeners();
  }

  void remove(Todo todo) {
    _todos.value.removeWhere((element) => element.id == todo.id);
    notifyListeners();
  }
}
