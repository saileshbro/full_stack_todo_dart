import 'package:backend/db/database_connection.dart';
import 'package:data_source/data_source.dart';
import 'package:exceptions/exceptions.dart';
import 'package:models/models.dart';
import 'package:postgres/postgres.dart';
import 'package:typedefs/typedefs.dart';

/// {@template user_data_source_impl}
/// User data source implementation
/// This class is used to connect to the database and perform CRUD operations on users table
/// {@endtemplate}
class UserDataSourceImpl extends UserDataSource {
  /// {@macro user_data_source_impl}
  UserDataSourceImpl(this._databaseConnection);

  final DatabaseConnection _databaseConnection;

  @override
  Future<User> createUser(CreateUserDto user) async {
    try {
      await _databaseConnection.connect();
      final result = await _databaseConnection.db.query(
        '''
        INSERT INTO users (name, email, password, created_at)
        VALUES (@name, @email, @password, @created_at) RETURNING *
        ''',
        substitutionValues: {
          'name': user.name,
          'email': user.email,
          'password': user.password,
          'created_at': DateTime.now(),
        },
      );
      if (result.affectedRowCount == 0) {
        throw const ServerException('Failed to create todo');
      }
      final userMap = result.first.toColumnMap();
      return User.fromJson(userMap);
    } on PostgreSQLException catch (e) {
      throw ServerException(e.message ?? 'Unexpected error');
    } finally {
      await _databaseConnection.close();
    }
  }

  @override
  Future<User> getUserById(UserId id) async {
    try {
      await _databaseConnection.connect();
      final result = await _databaseConnection.db.query(
        'SELECT id, name, email, created_at FROM users WHERE id = @id',
        substitutionValues: {'id': id},
      );
      if (result.isEmpty) {
        throw const NotFoundException('User not found');
      }
      return User.fromJson(result.first.toColumnMap());
    } on PostgreSQLException catch (e) {
      throw ServerException(e.message ?? 'Unexpected error');
    } finally {
      await _databaseConnection.close();
    }
  }

  @override
  Future<User> getUserByEmail(String email) async {
    try {
      await _databaseConnection.connect();
      final result = await _databaseConnection.db.query(
        'SELECT id, name, email, password, created_at FROM users WHERE email = @email',
        substitutionValues: {'email': email},
      );
      if (result.isEmpty) {
        throw const NotFoundException('User not found');
      }
      return User.fromJson(result.first.toColumnMap());
    } on PostgreSQLException catch (e) {
      throw ServerException(e.message ?? 'Unexpected error');
    } finally {
      await _databaseConnection.close();
    }
  }
}
