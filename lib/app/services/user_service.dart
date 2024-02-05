import 'package:flutter/material.dart';
import 'package:project_1/domain/login/iauth.dart';

class UserService extends ChangeNotifier {
  IAuth? _user;

  IAuth? get user => _user;

  void setUser(IAuth? user) {
    _user = user;
    notifyListeners();
  }
}
