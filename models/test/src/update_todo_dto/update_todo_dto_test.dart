import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateTodoDto -', () {
    test('empty toJson test', () {
      final dto = UpdateTodoDto();
      expect(dto.toJson(), {
        'title': null,
        'description': null,
        'completed': null,
      });
    });

    test('nonEmpty toJson test', () {
      final dto = UpdateTodoDto(
        completed: true,
        description: 'description',
        title: 'title',
      );
      expect(dto.toJson(), {
        'title': 'title',
        'description': 'description',
        'completed': true,
      });
    });

    test('empty fromJson test', () {
      final dto = UpdateTodoDto.fromJson({});
      expect(dto, UpdateTodoDto());
      expect(dto.title, null);
      expect(dto.description, null);
    });

    test('nonEmpty fromJson test', () {
      final dto = UpdateTodoDto.fromJson({
        'title': 'title',
        'description': 'description',
        'completed': true,
      });
      expect(dto.title, 'title');
      expect(dto.description, 'description');
      expect(dto.completed, true);
    });
  });
}
