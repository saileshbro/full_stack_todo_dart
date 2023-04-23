import 'package:fullstack_todo/data/data_source/user/user_http_client/user_http_client.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';

@lazySingleton
class UserRemoteDataSource {
  const UserRemoteDataSource(this.httpClient);
  final UserHttpClient httpClient;
  Future<AuthenticatedUser> login(LoginUserDto request) =>
      httpClient.login(request);
  Future<AuthenticatedUser> signup(CreateUserDto request) =>
      httpClient.signup(request);
}
