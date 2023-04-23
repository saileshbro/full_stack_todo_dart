// ignore_for_file: unused_element

import 'package:fullstack_todo/presentation/authentication/authentication_view.dart';
import 'package:fullstack_todo/presentation/maintain_todo/maintain_todo_view.dart';
import 'package:fullstack_todo/presentation/show_todos/show_todos_view.dart';
import 'package:fullstack_todo/presentation/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
    AdaptiveRoute(page: AuthenticationView),
    AdaptiveRoute(page: ShowTodosView),
    AdaptiveRoute(page: MaintainTodoView),
  ],
)
class _App {}
