import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  group('Todo test -', () {
    test('toJson test', () {
      final createdAt = DateTime.now();
      final todo = Todo(
        id: 1,
        title: 'title',
        description: 'description',
        createdAt: createdAt,
      );
      expect(todo.toJson(), {
        'id': 1,
        'title': 'title',
        'description': 'description',
        'completed': false,
        'created_at': createdAt.toIso8601String(),
        'updated_at': null,
      });
    });

    test('fromJson test', () {
      final createdAt = DateTime.now();
      final updatedAt = DateTime.now().subtract(const Duration(days: 1));
      final todo = Todo.fromJson({
        'id': 1,
        'title': 'title',
        'description': 'description',
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      });
      expect(todo.id, 1);
      expect(todo.title, 'title');
      expect(todo.description, 'description');
      expect(todo.completed, false);
      expect(todo.createdAt, createdAt);
      expect(todo.updatedAt, updatedAt);
    });
  });
}
