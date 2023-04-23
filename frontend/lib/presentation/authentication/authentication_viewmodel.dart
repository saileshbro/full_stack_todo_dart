import 'dart:developer';

import 'package:either_dart/src/either.dart';
import 'package:failures/src/failure.dart';
import 'package:fullstack_todo/core/app/routes.router.dart';
import 'package:fullstack_todo/services/shared_preferences_service.dart';
import 'package:injectable/injectable.dart';
import 'package:models/models.dart';
import 'package:repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class AuthenticationViewModel extends IndexTrackingViewModel {
  AuthenticationViewModel(
    this._userRepository,
    this._navigationService,
    this._sharedPreferencesService,
    this._snackbarService,
  );
  final SnackbarService _snackbarService;
  final UserRepository _userRepository;
  final NavigationService _navigationService;
  final SharedPreferencesService _sharedPreferencesService;

  CreateUserDto _createUserDto = CreateUserDto.empty();
  LoginUserDto _loginUserDto = LoginUserDto.empty();
  bool get isLoginTab => currentIndex == 0;

  bool get isValid {
    if (isLoginTab) {
      return LoginUserDto.validated(_createUserDto.toJson()).isRight;
    }
    return CreateUserDto.validated(_createUserDto.toJson()).isRight;
  }

  void onEmailChanged(String value) {
    _createUserDto = _createUserDto.copyWith(email: value);
    _loginUserDto = _loginUserDto.copyWith(email: value);
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _createUserDto = _createUserDto.copyWith(password: value);
    _loginUserDto = _loginUserDto.copyWith(password: value);
    notifyListeners();
  }

  void onNameChanged(String value) {
    _createUserDto = _createUserDto.copyWith(name: value);
    notifyListeners();
  }

  Future<void> onAuthPressed() async {
    final res = await runBusyFuture(_auth());
    return res.fold(
      handleFailure,
      (r) async {
        await _sharedPreferencesService.setUserToken(r.token);
        return _navigationService.replaceWith<void>(Routes.showTodosView);
      },
    );
  }

  Future<Either<Failure, AuthenticatedUser>> _auth() {
    if (isLoginTab) {
      return _userRepository.loginUser(_loginUserDto);
    }
    return _userRepository.createUser(_createUserDto);
  }

  void handleFailure(Failure failure) {
    setError(failure.message);
    log(failure.message);
    _snackbarService.showSnackbar(message: failure.message);
  }
}
