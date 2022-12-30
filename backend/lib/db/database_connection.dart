import 'dart:developer';

import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

class DatabaseConnection {
  DatabaseConnection(this._dotEnv) {
    host = _dotEnv['DB_HOST'] ?? 'localhost';
    port = int.tryParse(_dotEnv['DB_PORT'] ?? '') ?? 5432;
    database = _dotEnv['DB_DATABASE'] ?? 'test';
    username = _dotEnv['DB_USERNAME'] ?? 'test';
    password = _dotEnv['DB_PASSWORD'] ?? 'test';
  }

  final DotEnv _dotEnv;
  late final String host;
  late final int port;
  late final String database;
  late final String username;
  late final String password;
  PostgreSQLConnection? _connection;
  PostgreSQLConnection get db =>
      _connection ??= throw Exception('Database connection not initialized');

  Future<void> connect() async {
    try {
      _connection = PostgreSQLConnection(
        host,
        port,
        database,
        username: username,
        password: password,
      );
      log('Database connection successful');
      return _connection!.open();
    } catch (e) {
      log('Database connection failed: $e');
    }
  }

  Future<void> close() => _connection!.close();
}
