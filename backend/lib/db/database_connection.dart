import 'dart:developer';

import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

/// {@template database_connection}
/// Database connection class
/// This class is used to connect to the database
/// {@endtemplate}
class DatabaseConnection {
  /// {@macro database_connection}
  DatabaseConnection(this._dotEnv) {
    _host = _dotEnv['DB_HOST'] ?? 'localhost';
    _port = int.tryParse(_dotEnv['DB_PORT'] ?? '') ?? 5432;
    _database = _dotEnv['DB_DATABASE'] ?? 'test';
    _username = _dotEnv['DB_USERNAME'] ?? 'test';
    _password = _dotEnv['DB_PASSWORD'] ?? 'test';
  }

  final DotEnv _dotEnv;
  late final String _host;
  late final int _port;
  late final String _database;
  late final String _username;
  late final String _password;
  PostgreSQLConnection? _connection;

  /// Get the database connection
  PostgreSQLConnection get db =>
      _connection ??= throw Exception('Database connection not initialized');

  /// Connect to the database with the given credentials
  Future<void> connect() async {
    try {
      _connection = PostgreSQLConnection(
        _host,
        _port,
        _database,
        username: _username,
        password: _password,
      );
      log('Database connection successful');
      return _connection!.open();
    } catch (e) {
      log('Database connection failed: $e');
    }
  }

  /// Close the database connection
  Future<void> close() => _connection!.close();
}
