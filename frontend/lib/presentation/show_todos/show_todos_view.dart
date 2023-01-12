import 'package:flutter/material.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:fullstack_todo/presentation/show_todos/show_todos_viewmodel.dart';

import 'package:stacked/stacked.dart';

class ShowTodosView extends StatelessWidget {
  const ShowTodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShowTodosViewModel>.nonReactive(
      viewModelBuilder: () => locator<ShowTodosViewModel>(),
      builder: (
        BuildContext context,
        ShowTodosViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'ShowTodosView',
            ),
          ),
        );
      },
    );
  }
}
