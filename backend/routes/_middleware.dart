import 'package:backend/db/database_connection.dart';
import 'package:backend/todo/data_source/todo_data_source_impl.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
final env = DotEnv()..load();
final _db = DatabaseConnection(env);
final _ds = TodoDataSourceImpl(_db);

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<DatabaseConnection>((_) => _db))
      .use(provider<TodoDataSource>((_) => _ds));
}
