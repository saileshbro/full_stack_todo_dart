import 'package:fullstack_todo/core/app/routes.router.dart';
import 'package:fullstack_todo/services/user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

@injectable
class StartupViewModel extends BaseViewModel {
  StartupViewModel(this._navigationService, this._userService);
  final NavigationService _navigationService;
  final UserService _userService;

  Future<void> init() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (_userService.isLoggedIn) {
      return _navigationService.replaceWith<void>(Routes.showTodosView);
    }
    return _navigationService.replaceWith<void>(Routes.authenticationView);
  }
}
