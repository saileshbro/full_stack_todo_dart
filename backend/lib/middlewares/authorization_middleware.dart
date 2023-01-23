import 'dart:io';

import 'package:backend/services/jwt_service.dart';
import 'package:dart_frog/dart_frog.dart';
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
      final updated = context.provide<User>(() => user.right);
      return handler(updated);
    } on UnauthorizedException catch (e) {
      return Response.json(
        body: {'message': e.message},
        statusCode: e.statusCode,
      );
    }
  };
}
