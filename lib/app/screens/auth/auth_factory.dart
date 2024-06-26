import 'package:flutter/material.dart';
import 'package:project_1/app/screens/auth/auth_screen.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user/user_service.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';
import 'package:provider/provider.dart';

class AuthFactory {
  static Widget build() {
    return ChangeNotifierProvider(
      create: (context) => AuthViewModel(
          localStorage: LocalStorage(),
          userService: context.read<UserService>(),
          navigationUtil: context.read<INavigationUtil>()),
      child: Consumer<AuthViewModel>(
        builder: (context, model, child) => AuthScreen(
          viewModel: model,
        ),
      ),
    );
  }
}
