import 'package:project_1/domain/login/iuser.dart';

class User implements IUser {
  @override
  String login;

  @override
  String password;

  User({required this.login, required this.password});

}