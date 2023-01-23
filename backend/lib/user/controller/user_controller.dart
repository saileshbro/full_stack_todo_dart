import 'dart:async';
import 'dart:io';

import 'package:backend/controller/http_controller.dart';
import 'package:backend/request_handlers/unimplemented_handler.dart';
import 'package:backend/services/jwt_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';

/// {@template user_controller}
/// This is the controller for the user resource
/// Use this class to handle requests to the user resource
/// {@endtemplate}
class UserController extends HttpController {
  /// {@macro user_controller}
  UserController(this._repo, this._jwtService);

  final UserRepository _repo;
  final JWTService _jwtService;

  @override
  FutureOr<Response> show(Request request, String id) {
    // TODO: implement show
    // implement authorization middleware to check if the user is authorized to view the user
    return unimplementedHandler();
  }

  @override
  FutureOr<Response> store(Request request) async {
    final parsedBody = await parseJson(request);
    if (parsedBody.isLeft) {
      return Response.json(
        body: {'message': parsedBody.left.message},
        statusCode: parsedBody.left.statusCode,
      );
    }
    final json = parsedBody.right;
    final createTodoDto = CreateUserDto.validated(json);
    if (createTodoDto.isLeft) {
      return Response.json(
        body: {
          'message': createTodoDto.left.message,
          'errors': createTodoDto.left.errors,
        },
        statusCode: createTodoDto.left.statusCode,
      );
    }
    final res = await _repo.createUser(createTodoDto.right);
    return res.fold(
      (left) => Response.json(
        body: {'message': left.message},
        statusCode: left.statusCode,
      ),
      (right) => _signAndSendToken(right, HttpStatus.created),
    );
  }

  FutureOr<Response> login(Request request) async {
    final parsedBody = await parseJson(request);
    if (parsedBody.isLeft) {
      return Response.json(
        body: {'message': parsedBody.left.message},
        statusCode: parsedBody.left.statusCode,
      );
    }
    final json = parsedBody.right;
    final loginUserDto = LoginUserDto.validated(json);
    if (loginUserDto.isLeft) {
      return Response.json(
        body: {
          'message': loginUserDto.left.message,
          'errors': loginUserDto.left.errors,
        },
        statusCode: loginUserDto.left.statusCode,
      );
    }
    final res = await _repo.loginUser(loginUserDto.right);
    return res.fold(
      (left) => Response.json(
        body: {'message': left.message},
        statusCode: left.statusCode,
      ),
      _signAndSendToken,
    );
  }

  Response _signAndSendToken(User user, [int? httpStatus]) {
    final token = _jwtService.sign(user.toJson());
    return Response.json(
      body: {
        'token': token,
        'user': user.toJson(),
      },
      statusCode: httpStatus ?? HttpStatus.ok,
    );
  }
}
