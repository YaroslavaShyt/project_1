import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/button.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/screens/auth/widgets/form_text_field.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';

class AuthScreen extends StatelessWidget {
  final AuthViewModel _authViewModel;
  const AuthScreen({
    super.key,
    required ILocalStorage storage,
    required UserService userService,
    required AuthViewModel authViewModel,
  }) : _authViewModel = authViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          "Login",
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 40),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                FormTextField(
                    errorText: _authViewModel.loginError,
                    label: 'Login',
                    onChanged: _authViewModel.onLoginChanged),
                const SizedBox(height: 40),
                FormTextField(
                  errorText: _authViewModel.passwordError,
                  label: 'Password',
                  onChanged: _authViewModel.onPasswordChanged,
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                Button(
                  onLoginButtonPressed: _authViewModel.onLoginButtonPressed,
                  title: 'Login',
                )
              ],
            ))
      ])),
    );
  }
}
