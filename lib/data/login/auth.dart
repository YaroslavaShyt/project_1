import 'package:project_1/domain/login/iauth.dart';

class Auth implements IAuth {
  @override
  String login;

  @override
  String password;

  Auth({required this.login, required this.password});

}