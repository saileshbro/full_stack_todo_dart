import 'package:backend/db/database_connection.dart';
import 'package:backend/todo/controller/todo_controller.dart';
import 'package:backend/todo/data_source/todo_data_source_impl.dart';
import 'package:backend/todo/repositories/todo_repository_impl.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:data_source/data_source.dart';
import 'package:dotenv/dotenv.dart';
import 'package:repository/repository.dart';

final env = DotEnv()..load();
final _db = DatabaseConnection(env);
final _ds = TodoDataSourceImpl(_db);
final _repo = TodoRepositoryImpl(_ds);
final _todoController = TodoController(_repo);

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<DatabaseConnection>((_) => _db))
      .use(provider<TodoDataSource>((_) => _ds))
      .use(provider<TodoRepository>((_) => _repo))
      .use(provider<TodoController>((_) => _todoController));
}
