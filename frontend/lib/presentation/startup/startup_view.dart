import 'package:flutter/material.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:fullstack_todo/presentation/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      viewModelBuilder: locator.call,
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, model, child) =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
