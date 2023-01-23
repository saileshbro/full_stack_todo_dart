import 'package:bcrypt/bcrypt.dart';

/// {@template password_hasher_service}
/// A service that hashes passwords.
/// This service is used to hash passwords before storing them in the database.
/// {@endtemplate}
class PasswordHasherService {
  /// {@macro password_hasher_service}
  const PasswordHasherService();

  /// Hashes the given [password].
  /// The returned [Future] completes with the hashed password.
  String hashPassword(String password) {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  /// Checks if the given [password] matches the given [hashedPassword].
  /// The returned [Future] completes with `true` if the password matches the
  /// hashed password, otherwise it completes with `false`.

  bool checkPassword(String password, String hashedPassword) {
    return BCrypt.checkpw(password, hashedPassword);
  }
}
