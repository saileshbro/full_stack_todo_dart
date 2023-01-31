import 'dart:io';

import 'package:backend/db/database_connection.dart';
import 'package:backend/services/jwt_service.dart';
import 'package:backend/todo/controller/todo_controller.dart';
import 'package:backend/todo/data_source/todo_data_source_impl.dart';
import 'package:backend/todo/repositories/todo_repository_impl.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:data_source/data_source.dart';
import 'package:exceptions/exceptions.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

/// {@template authorization_middleware}
/// This is the authorization middleware
/// It checks if the request has a valid token
/// {@endtemplate}
///
Handler authorizationMiddleware(Handler handler) {
  return (context) async {
    try {
      final request = context.request;
      final authHeader = request.headers[HttpHeaders.authorizationHeader] ?? '';
      final token = authHeader.replaceFirst('Bearer ', '');
      if (token.isEmpty) throw const UnauthorizedException();
      final jwtService = context.read<JWTService>();
      final decoded = jwtService.verify(token);
      final decodedUser = User.fromJson(decoded);
      final userRepo = context.read<UserRepository>();
      final user = await userRepo.getUserById(decodedUser.id);
      if (user.isLeft) throw const UnauthorizedException();
      context = _handleAuthDependencies(context, user.right);
      return handler(context);
    } on UnauthorizedException catch (e) {
      return Response.json(
        body: {'message': e.message},
        statusCode: e.statusCode,
      );
    }
  };
}

RequestContext _handleAuthDependencies(
  RequestContext context,
  User user,
) {
  final db = context.read<DatabaseConnection>();
  final todoDs = TodoDataSourceImpl(db, user);
  final todoRepo = TodoRepositoryImpl(todoDs);
  final todoController = TodoController(todoRepo);
  late RequestContext updatedContext;
  updatedContext = context.provide<User>(() => user);
  updatedContext = updatedContext.provide<TodoController>(() => todoController);
  updatedContext = updatedContext.provide<TodoRepository>(() => todoRepo);
  updatedContext = updatedContext.provide<TodoDataSource>(() => todoDs);
  return updatedContext;
}
