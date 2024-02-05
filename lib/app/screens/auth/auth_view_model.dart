import 'package:project_1/app/common/base_change_notifier.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:project_1/data/login/auth.dart';

class AuthViewModel extends BaseChangeNotifier {
  final UserService _userService;
  String _login = '';
  String _password = '';

  String? _loginError;
  String? _passwordError;

  AuthViewModel({required UserService userService})
      : _userService = userService;

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

  bool validate() {
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

    _userService.setUser(Auth(login: _login, password: _password));
    return true;
  }
}
