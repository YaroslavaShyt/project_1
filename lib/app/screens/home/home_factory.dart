import 'package:flutter/material.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/screens/home/home_screen.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:provider/provider.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider(
        create: (context) => AuthViewModel(
            localStorage: LocalStorage(), userService: UserService()),
        child: Consumer<AuthViewModel>(
            builder: (context, model, child) => HomeScreen(
                  authViewModel: model,
                )));
  }
}
