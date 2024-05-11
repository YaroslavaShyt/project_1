import 'package:project_1/app/common/base_change_notifier.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/services/local_storage/keys.dart';
import 'package:project_1/app/services/user/user_service.dart';
import 'package:project_1/data/login/user.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';

class AuthViewModel extends BaseChangeNotifier {
  final ILocalStorage _storage;
  final UserService _userService;
  final INavigationUtil _navigationUtil;

  String _email = '';
  String _password = '';
  String initialRoute = routeLogin;

  String? _emailError;
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

  set email(String value) {
    _email = value.trim();
    _emailError = null;
  }

  set password(String value) {
    _password = value.trim();
    _passwordError = null;
  }

  bool get isValid => _emailError == null && _passwordError == null;

  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  String get email => _email;
  String get password => _password;

  void onPasswordChanged(value) => password = value;

  void onEmailChanged(value) => email = value;

  bool isValidated() {
    if (_email.isEmpty) {
      _emailError = 'Email is required!';
    } else if (!_email.contains('@')) {
      _emailError = 'Incorrect email format!';
    }

    if (_password.isEmpty) {
      _passwordError = 'Password is required!';
    } else if (_password.length < 5) {
      _passwordError = 'Password must be at least 5 characters!';
    }

    if (_emailError != null || _passwordError != null) {
      notifyListeners();
      return false;
    }
    return true;
  }

  Future<void> checkUserExists() async {
    try {
      String email = await _storage.read(keyEmail);
      String password = await _storage.read(keyPassword);
      if (email.isNotEmpty && password.isNotEmpty) {
        initialRoute = routeFood;
        notifyListeners();
      }
    } catch (err) {
      initialRoute = routeLogin;
      notifyListeners();
    }
  }

  void onLoginButtonPressed() {
    final bool isValid = isValidated();

    if (isValid) {
      _userService.setUser(User(email: email));
      _storage.save(keyEmail, email);
      _storage.save(keyPassword, password);
     _navigationUtil.navigateToAndReplace(routeFood);
    }
  }
}
