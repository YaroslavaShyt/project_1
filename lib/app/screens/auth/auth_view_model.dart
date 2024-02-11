import 'package:project_1/app/common/base_change_notifier.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:project_1/data/login/user.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';

class AuthViewModel extends BaseChangeNotifier {
  final ILocalStorage _storage;
  final UserService _userService;
  final INavigationUtil _navigationUtil;

  String _login = '';
  String _password = '';
  String initialRoute = routeLogin;

  String? _loginError;
  String? _passwordError;

  AuthViewModel(
      {required ILocalStorage localStorage,
      required UserService userService,
      required INavigationUtil navigationUtil})
      : _storage = localStorage,
        _userService = userService,
        _navigationUtil = navigationUtil {
    checkUserExists();
  }

  set login(String value) {
    _login = value.trim();
    _loginError = null;
  }

  set password(String value) {
    _password = value.trim();
    _passwordError = null;
  }

  bool get isValid => _loginError == null && _passwordError == null;

  String? get loginError => _loginError;
  String? get passwordError => _passwordError;
  String get login => _login;
  String get password => _password;

  void onPasswordChanged(value) => password = value;

  void onLoginChanged(value) => login = value;

  bool isValidate() {
    if (_login.isEmpty) {
      _loginError = 'Login is required!';
    } else if (_login.length < 5) {
      _loginError = 'Login must be at least 5 characters!';
    }

    if (_password.isEmpty) {
      _passwordError = 'Password is required!';
    } else if (_password.length < 5) {
      _passwordError = 'Password must be at least 5 characters!';
    }

    if (_loginError != null || _passwordError != null) {
      notifyListeners();
      return false;
    }
    return true;
  }

  Future<void> checkUserExists() async {
    try {
      String login = await _storage.read('login');
      String password = await _storage.read('password');
      if (login.isNotEmpty && password.isNotEmpty) {
        initialRoute = routeHome;
        notifyListeners();
      }
    } catch (err) {
      initialRoute = routeLogin;
      notifyListeners();
    }
  }

  void onLoginButtonPressed() {
    final bool isValid = isValidate();

    if (isValid) {
      _userService.setUser(User(login: login, password: password));
      _storage.save('login', login);
      _storage.save('password', password);

      Future.delayed(const Duration(seconds: 2))
          .then((value) => _navigationUtil.navigateToAndReplace(routeHome));
    }
  }
}
