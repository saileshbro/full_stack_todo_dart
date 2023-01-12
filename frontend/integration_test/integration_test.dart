import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:fullstack_todo/main.dart';

final _randomTitle = DateTime.now().microsecondsSinceEpoch;
final _randomDescription = DateTime.now().microsecondsSinceEpoch;
void main() {
  setUpAll(setupLocator);
  testWidgets('overall flow test', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Todos'), findsOneWidget);
    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);
    await createTodoTest(tester);
  });
}

Future<void> createTodoTest(WidgetTester tester) async {
  final fab = find.byType(FloatingActionButton);
  expect(fab, findsOneWidget);
  await tester.tap(fab);
  await tester.pumpAndSettle();
  final title = find.byKey(const Key('titleTextField'));
  final description = find.byKey(const Key('descriptionTextField'));
  final checkBox = find.byKey(const Key('completedCheckbox'));
  await tester.enterText(title, '$_randomTitle');
  await tester.enterText(description, '$_randomDescription');
  expect(checkBox, findsNothing);
  await tester.pumpAndSettle();

  final saveButton = find.byKey(const Key('saveButton'));
  expect(saveButton, findsOneWidget);
  await tester.tap(saveButton);
  await tester.pumpAndSettle();
  expect(find.text('$_randomTitle'), findsOneWidget);
  expect(find.text('$_randomDescription'), findsOneWidget);
  final newTodoCheckBox = find.byKey(Key('todoCheckbox$_randomTitle}'));
  expect(newTodoCheckBox, findsOneWidget);
  final checkBoxWidget = tester.widget<Checkbox>(newTodoCheckBox);
  expect(checkBoxWidget.value, false);
}
