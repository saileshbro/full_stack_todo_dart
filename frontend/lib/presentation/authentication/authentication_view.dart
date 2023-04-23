import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:fullstack_todo/presentation/authentication/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    const tabs = [Tab(text: 'Login'), Tab(text: 'Register')];
    return ViewModelBuilder<AuthenticationViewModel>.nonReactive(
      viewModelBuilder: locator.call,
      builder: (context, model, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Authentication'),
              bottom: TabBar(
                onTap: model.setIndex,
                tabs: tabs,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SelectorViewModelBuilder<AuthenticationViewModel, bool>(
                        selector: (vm) => vm.isLoginTab,
                        builder: (context, isLogin, child) {
                          if (isLogin) return const SizedBox.shrink();
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 14),
                            child: child,
                          );
                        },
                        child: TextFormField(
                          key: const Key('nameTextField'),
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: model.onNameChanged,
                        ),
                      ),
                      TextFormField(
                        key: const Key('emailTextField'),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: model.onEmailChanged,
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        key: const Key('passwordTextField'),
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: model.onPasswordChanged,
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: kToolbarHeight,
                    child: SelectorViewModelBuilder<AuthenticationViewModel,
                        Tuple3<bool, bool, bool>>(
                      selector: (viewModel) => Tuple3(
                        viewModel.isValid,
                        viewModel.isLoginTab,
                        viewModel.isBusy,
                      ),
                      builder: (context, val, _) => ElevatedButton(
                        onPressed: val.value1 ? model.onAuthPressed : null,
                        child: val.value3
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : val.value2
                                ? const Text('Login')
                                : const Text('Register'),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
