import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dotenv/dotenv.dart';

/// {@template jwt_service}
/// JWT service to sign and verify tokens
/// {@endtemplate}
class JWTService {
  /// {@macro jwt_service}
  const JWTService(this._env);

  final DotEnv _env;

  /// Sign a payload
  String sign(Map<String, dynamic> payload) {
    final secret = _env['JWT_SECRET']!;
    final jwt = JWT(payload);
    return jwt.sign(SecretKey(secret));
  }

  /// Verify a token
  Map<String, dynamic> verify(String token) {
    final secret = _env['JWT_SECRET']!;
    final jwt = JWT.verify(token, SecretKey(secret));
    return jwt.payload as Map<String, dynamic>;
  }
}
