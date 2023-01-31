import 'dart:async';

import 'package:backend/request_handlers/not_allowed_request_handler.dart';
import 'package:backend/user/controller/user_controller.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context) {
  final userController = context.read<UserController>();
  if (context.request.method != HttpMethod.post) {
    return notAllowedRequestHandler(context);
  }
  return userController.login(context.request);
}
