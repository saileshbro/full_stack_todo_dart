// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:fullstack_todo/presentation/maintain_todo/maintain_todo_view.dart'
    as _i3;
import 'package:fullstack_todo/presentation/show_todos/show_todos_view.dart'
    as _i2;
import 'package:models/models.dart' as _i4;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const showTodosView = '/';

  static const maintainTodoView = '/maintain-todo-view';

  static const all = <String>{
    showTodosView,
    maintainTodoView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.showTodosView,
      page: _i2.ShowTodosView,
    ),
    _i1.RouteDef(
      Routes.maintainTodoView,
      page: _i3.MaintainTodoView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.ShowTodosView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.ShowTodosView(),
        settings: data,
      );
    },
    _i3.MaintainTodoView: (data) {
      final args = data.getArgs<MaintainTodoViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i3.MaintainTodoView(args.todo, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MaintainTodoViewArguments {
  const MaintainTodoViewArguments({
    required this.todo,
    this.key,
  });

  final _i4.Todo? todo;

  final _i5.Key? key;
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToShowTodosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.showTodosView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMaintainTodoView({
    required _i4.Todo? todo,
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.maintainTodoView,
        arguments: MaintainTodoViewArguments(todo: todo, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShowTodosView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.showTodosView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMaintainTodoView({
    required _i4.Todo? todo,
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.maintainTodoView,
        arguments: MaintainTodoViewArguments(todo: todo, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
