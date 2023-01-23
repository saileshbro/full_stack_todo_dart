import 'package:backend/db/database_connection.dart';
import 'package:backend/services/jwt_service.dart';
import 'package:backend/services/password_hasher_service.dart';
import 'package:backend/todo/controller/todo_controller.dart';
import 'package:backend/todo/data_source/todo_data_source_impl.dart';
import 'package:backend/todo/repositories/todo_repository_impl.dart';
import 'package:backend/user/controller/user_controller.dart';
import 'package:backend/user/data_source/user_data_source_impl.dart';
import 'package:backend/user/repositories/user_repository_impl.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:data_source/data_source.dart';
import 'package:dotenv/dotenv.dart';
import 'package:repository/repository.dart';

final env = DotEnv()..load();
final _db = DatabaseConnection(env);
final _todoDs = TodoDataSourceImpl(_db);
final _todoRepo = TodoRepositoryImpl(_todoDs);
final _userDs = UserDataSourceImpl(_db);
const _passwordHasher = PasswordHasherService();
final _userRepo = UserRepositoryImpl(_userDs, _passwordHasher);
final _jwtService = JWTService(env);
final _todoController = TodoController(_todoRepo);
final _userController = UserController(_userRepo, _jwtService);

Handler middleware(Handler handler) {
  return handler
      .use(requestLogger())
      .use(provider<DatabaseConnection>((_) => _db))
      .use(provider<TodoDataSource>((_) => _todoDs))
      .use(provider<TodoRepository>((_) => _todoRepo))
      .use(provider<JWTService>((_) => _jwtService))
      .use(provider<TodoController>((_) => _todoController))
      .use(provider<UserDataSource>((_) => _userDs))
      .use(provider<UserRepository>((_) => _userRepo))
      .use(provider<UserController>((_) => _userController))
      .use(provider<PasswordHasherService>((_) => _passwordHasher));
}
