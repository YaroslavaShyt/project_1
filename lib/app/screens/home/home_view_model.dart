import 'package:project_1/app/common/base_change_notifier.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';

class HomeViewModel extends BaseChangeNotifier {
  final ILocalStorage _storage;
  final UserService _userService;
  final INavigationUtil _navigationUtil;

  HomeViewModel(
      {required ILocalStorage localStorage,
      required UserService userService,
      required INavigationUtil navigationUtil})
      : _storage = localStorage,
        _userService = userService,
        _navigationUtil = navigationUtil {}

  void onLogOutButtonPressed() {
    _storage.delete('login');
    _storage.delete('password');

    Future.delayed(const Duration(seconds: 2))
        .then((value) => _navigationUtil.navigateToAndReplace(routeLogin));
  }
}
