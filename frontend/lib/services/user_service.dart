import 'package:fullstack_todo/services/shared_preferences_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserService {
  const UserService(this._sharedPreferencesService);
  final SharedPreferencesService _sharedPreferencesService;

  String? get token => _sharedPreferencesService.userToken;
  bool get isLoggedIn => token != null;
}
