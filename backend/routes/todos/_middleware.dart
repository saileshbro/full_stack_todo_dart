import 'package:backend/middlewares/authorization_middleware.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) => authorizationMiddleware(handler);
