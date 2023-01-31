import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:fullstack_todo/presentation/show_todos/show_todos_viewmodel.dart';
import 'package:fullstack_todo/presentation/show_todos/widgets/todo_list_tile.dart';
import 'package:stacked/stacked.dart';

class ShowTodosView extends StatelessWidget {
  const ShowTodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowTodosViewModel>.reactive(
      viewModelBuilder: locator,
      onViewModelReady: (model) => model.init(),
      builder: (
        BuildContext context,
        ShowTodosViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todos'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: model.handleTodo,
            child: const Icon(Icons.add),
          ),
          body: Builder(
            builder: (context) {
              if (model.isBusy) {
                return const Center(child: CircularProgressIndicator());
              }
              if (model.hasError) {
                return Center(child: Text(model.modelError.toString()));
              }
              if (model.todos.isEmpty) {
                return Center(
                  child: Text(
                    'No todos found!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: model.refresh,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: model.todos.length,
                    itemBuilder: (context, index) =>
                        TodoListTile(todo: model.todos[index]),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
