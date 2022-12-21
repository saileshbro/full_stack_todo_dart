import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  group('CreateTodoDto -', () {
    test('toJson test', () {
      final dto = CreateTodoDto(
        title: 'title',
        description: 'description',
      );
      expect(dto.toJson(), {
        'title': 'title',
        'description': 'description',
      });
    });

    test('fromJson test', () {
      final dto = CreateTodoDto.fromJson({
        'title': 'title',
        'description': 'description',
      });
      expect(dto.title, 'title');
      expect(dto.description, 'description');
    });
  });
}
