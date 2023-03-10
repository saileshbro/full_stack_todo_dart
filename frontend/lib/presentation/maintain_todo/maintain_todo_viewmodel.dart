import 'package:fullstack_todo/data_services/todos_data_service.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class MaintainTodoViewModel extends BaseViewModel {
  MaintainTodoViewModel(
    this._todosDataService,
    this._repository,
    this._navigationService,
  );

  final TodosDataService _todosDataService;
  final TodoRepository _repository;
  final NavigationService _navigationService;
  String _title = '';
  String get title => _title;

  String _description = '';
  String get description => _description;

  bool _completed = false;
  bool get completed => _completed;

  bool get isValidated {
    final empty = _title.isEmpty || _description.isEmpty;
    if (empty) return false;
    final errors = error('title') != null || error('description') != null;
    if (errors) return false;
    return true;
  }

  void onTitleChanged(String value) {
    _title = value;
    if (value.isEmpty) {
      setErrorForObject('title', 'Title is required');
    } else {
      setErrorForObject('title', null);
    }
    notifyListeners();
  }

  void onDescriptionChanged(String value) {
    _description = value;
    if (value.isEmpty) {
      setErrorForObject('description', 'Description is required');
    } else {
      setErrorForObject('description', null);
    }
    notifyListeners();
  }

  Future<void> _createTodo() async {
    final dto = CreateTodoDto(title: title, description: description);
    final response = await runBusyFuture(_repository.createTodo(dto));
    return response.fold(
      (failure) {
        setError(failure.message);
      },
      (todo) {
        _todosDataService.add(todo);
        _navigationService.back<void>();
      },
    );
  }

  Todo? _todo;
  void init(Todo? todo) {
    if (todo == null) return;
    _title = todo.title;
    _description = todo.description;
    _todo = todo;
    _completed = todo.completed;
  }

  void onCompletedChanged({bool? value}) {
    _completed = value ?? false;
    notifyListeners();
  }

  Future<void> _updateTodo() async {
    if (_todo == null) return;
    final dto = UpdateTodoDto(
      title: title,
      description: description,
      completed: completed,
    );
    final response = await runBusyFuture(
      _repository.updateTodo(id: _todo!.id, updateTodoDto: dto),
    );
    return response.fold(
      (failure) {
        setError(failure.message);
      },
      (todo) {
        _todosDataService.add(todo);
        _navigationService.back<void>();
      },
    );
  }

  Future<void> handleTodo() {
    if (!isValidated) return Future.value();
    if (_todo == null) {
      return _createTodo();
    }
    return _updateTodo();
  }
}
