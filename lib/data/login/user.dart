import 'package:project_1/domain/login/iuser.dart';

class User implements IUser {
  @override
  String email;

  User({required this.email});

}