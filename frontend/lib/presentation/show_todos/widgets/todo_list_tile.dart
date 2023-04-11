import 'package:flutter/material.dart';
import 'package:fullstack_todo/presentation/show_todos/show_todos_viewmodel.dart';
import 'package:models/models.dart';
import 'package:stacked/stacked.dart';

class TodoListTile extends ViewModelWidget<ShowTodosViewModel> {
  const TodoListTile({
    required this.todo,
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context, ShowTodosViewModel viewModel) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      leading: Checkbox(
        key: Key('todoCheckbox${todo.title}}'),
        value: todo.completed,
        onChanged: (val) => viewModel.markCompleted(todo),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            onPressed: () => viewModel.handleTodo(todo),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () => viewModel.deleteTodo(todo),
          ),
        ],
      ),
    );
  }
}
