import 'dart:developer';

import 'package:failures/failures.dart';
import 'package:fullstack_todo/data_services/todos_data_service.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:stacked/stacked.dart';

@injectable
class ShowTodosViewModel extends ReactiveViewModel {
  ShowTodosViewModel(
    this._todoRepository,
    this._todosDataService,
  );

  final TodoRepository _todoRepository;
  final TodosDataService _todosDataService;
  List<Todo> get todos => _todosDataService.todos;

  Future<void> init() => runBusyFuture(refresh());

  void handleFailure(Failure failure) {
    setError(failure.message);
    log(failure.message);
  }

  Future<void> refresh() async {
    final response = await _todoRepository.getTodos();
    response.fold(handleFailure, _todosDataService.addAll);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_todosDataService];
}
