import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_todo/data_services/todos_data_service.dart';
import 'package:models/models.dart';

void main() {
  late TodosDataService sut;
  setUp(() {
    sut = TodosDataService();
  });
  group('TodosDataServiceTest -', () {
    test('operations test', () {
      expect(sut.todos, equals([]));
      sut.add(_todo1);
      expect(sut.todos, orderedEquals([_todo1]));
      sut.add(_todo2);
      expect(sut.todos, orderedEquals([_todo2, _todo1]));
      sut.remove(_todo1);
      expect(sut.todos, orderedEquals([_todo2]));
      sut.remove(_todo2);
      expect(sut.todos, equals([]));
      sut.addAll(_todos);
      expect(sut.todos, orderedEquals(_todos));
      final updated = _todo1.copyWith(
        completed: true,
        updatedAt: DateTime.now(),
      );
      sut.add(updated);
      expect(sut.todos, orderedEquals([updated, _todo2]));
    });
    test('reactivityTest', () async {
      sut.add(_todo1);
      expect(await sut.todosStream.first, equals([_todo1]));
      sut.add(_todo2);
      expect(await sut.todosStream.first, equals([_todo2, _todo1]));
      sut.remove(_todo1);
      expect(await sut.todosStream.first, equals([_todo2]));
      final updated = _todo2.copyWith(
        completed: true,
        updatedAt: DateTime.now(),
      );
      sut.add(updated);
      expect(await sut.todosStream.first, equals([updated]));
      sut.remove(_todo2);
      expect(await sut.todosStream.first, equals([]));
    });
  });
}

final _todo1 = Todo(
  id: 1,
  userId: 'userId1',
  title: 'title1',
  description: 'description1',
  completed: false,
  createdAt: DateTime.now(),
);

final _todo2 = Todo(
  id: 2,
  userId: 'userId2',
  title: 'title2',
  description: 'description2',
  completed: false,
  createdAt: DateTime.now(),
);

final _todos = [_todo1, _todo2];
