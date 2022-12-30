import 'package:backend/db/database_connection.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';

Handler middleware(Handler handler) {
  final env = DotEnv()..load();
  final db = DatabaseConnection(env);
  return handler
    ..use(provider<DatabaseConnection>((context) => db))
    ..use(requestLogger());
}
