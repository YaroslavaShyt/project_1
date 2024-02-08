import 'package:flutter/material.dart';
import 'package:project_1/app/routing/navigation_util.dart';
import 'package:project_1/app/screens/auth/auth_screen.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:provider/provider.dart';

class AuthFactory {
  static Widget build() {
    return ChangeNotifierProvider(
        create: (context) => AuthViewModel(
            localStorage: LocalStorage(),
            userService: UserService(),
            navigationUtil: NavigationUtil()),
        child: Consumer<AuthViewModel>(
            builder: (context, model, child) => AuthScreen(
                  authViewModel: model,
                  storage: LocalStorage(),
                  userService: context.read<UserService>(),
                )));
  }
}
