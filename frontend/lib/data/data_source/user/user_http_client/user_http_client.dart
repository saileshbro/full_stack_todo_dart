import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';

part 'user_http_client.g.dart';

@RestApi()
@lazySingleton
abstract class UserHttpClient {
  @factoryMethod
  factory UserHttpClient(Dio dio) = _UserHttpClient;
  @POST('/users/login')
  Future<AuthenticatedUser> login(@Body() LoginUserDto request);
  @POST('/users/signup')
  Future<AuthenticatedUser> signup(@Body() CreateUserDto request);
}
