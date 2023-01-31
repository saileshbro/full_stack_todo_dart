import 'package:backend/services/jwt_service.dart';
import 'package:dotenv/dotenv.dart';
import 'package:models/models.dart';
import 'package:test/test.dart';

void main() {
  test('jwt service ...', () async {
    final jwtService = JWTService(DotEnv()..load());
    final user = User(
      id: 'id',
      name: 'Sailesh Dahal',
      email: 'saileshbro@gmail.com',
      password: 'password',
      createdAt: DateTime.now(),
    );
    final token = jwtService.sign(user.toJson());
    final decodedUser = jwtService.verify(token);
    user.toJson().forEach((key, value) {
      expect(decodedUser[key], value);
    });
  });
}
