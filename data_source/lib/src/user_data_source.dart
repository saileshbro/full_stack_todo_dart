import 'package:models/models.dart';
import 'package:typedefs/typedefs.dart';

/// {@template user_data_source}
/// A class that manages the user data.
/// {@endtemplate}
abstract class UserDataSource {
  /// Gets a user by id.
  Future<User> getUserById(UserId id);

  /// Creates a user.
  Future<User> createUser(CreateUserDto user);

  /// Logs in a user.
  Future<User> getUserByEmail(String email);
}
