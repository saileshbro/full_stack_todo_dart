import 'package:backend/services/password_hasher_service.dart';
import 'package:test/test.dart';

void main() {
  test('Password Hasher Service', () async {
    const passwordHasherService = PasswordHasherService();
    for (var i = 0; i < 10; i++) {
      var password = 'seed';
      final hashedPassword = passwordHasherService.hashPassword(password);
      final isPasswordCorrect =
          passwordHasherService.checkPassword(password, hashedPassword);
      expect(isPasswordCorrect, true);
      password = hashedPassword;
    }
  });
}
