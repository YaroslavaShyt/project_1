import 'package:flutter/material.dart';
import 'package:project_1/app/screens/auth/auth_screen.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:provider/provider.dart';

class AuthFactory {
  static Widget build() {
    return ChangeNotifierProvider(
        create: (context) =>
            AuthViewModel(userService: context.read<UserService>()),
        child: Consumer<AuthViewModel>(
            builder: (context, model, child) => AuthScreen(
                  viewModel: model,
                )));
  }
}
