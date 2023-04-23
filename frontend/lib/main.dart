import 'package:flutter/material.dart';
import 'package:fullstack_todo/core/app/routes.router.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Fullstack Todo App',
        theme: ThemeData(primarySwatch: Colors.blue),
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      );
}
