import 'dart:developer';

import 'package:failures/failures.dart';
import 'package:fullstack_todo/core/app/routes.router.dart';
import 'package:fullstack_todo/data_services/todos_data_service.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class ShowTodosViewModel extends ReactiveViewModel {
  ShowTodosViewModel(
    this._todoRepository,
    this._todosDataService,
    this._navigationService,
  );

  final TodoRepository _todoRepository;
  final TodosDataService _todosDataService;
  final NavigationService _navigationService;
  List<Todo> get todos => _todosDataService.todos;

  Future<void> init() => runBusyFuture(refresh());

  void handleFailure(Failure failure) {
    setError(failure.message);
    log(failure.message);
  }

  Future<void> deleteTodo(Todo todo) async {
    final response = await _todoRepository.deleteTodo(todo.id);
    response.fold(
      handleFailure,
      (_) => _todosDataService.remove(todo),
    );
  }

  Future<void> markCompleted(Todo todo) async {
    if (busy('updating')) return;
    final completed = !todo.completed;
    _todosDataService.add(todo.copyWith(completed: completed));
    final updateDto = UpdateTodoDto(
      completed: !todo.completed,
    );
    final update = await runBusyFuture(
      _todoRepository.updateTodo(id: todo.id, updateTodoDto: updateDto),
      busyObject: 'updating',
    );
    update.fold(
      (failure) {
        _todosDataService.add(todo.copyWith(completed: !completed));
        handleFailure(failure);
      },
      (_) {},
    );
  }

  Future<void> refresh() async {
    final response = await _todoRepository.getTodos();
    response.fold(handleFailure, _todosDataService.addAll);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_todosDataService];

  Future<void>? handleTodo([Todo? todo]) {
    return _navigationService.navigateTo<void>(
      Routes.maintainTodoView,
      arguments: MaintainTodoViewArguments(todo: todo),
    );
  }
}
