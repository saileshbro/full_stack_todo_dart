import 'package:fullstack_todo/presentation/show_todos/show_todos_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: routes,
)
const List<StackedRoute<dynamic>> routes = [
  AdaptiveRoute(page: ShowTodosView, initial: true),
];
