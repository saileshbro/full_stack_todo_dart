import 'package:fullstack_todo/constants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferencesService {
  const SharedPreferencesService(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  String? get userToken => _sharedPreferences.getString(kUserTokenKey);
  Future<void> setUserToken(String value) =>
      _sharedPreferences.setString(kUserTokenKey, value);
}
