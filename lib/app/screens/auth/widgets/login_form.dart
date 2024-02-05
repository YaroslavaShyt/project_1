import 'package:flutter/material.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/screens/auth/widgets/form_text_field.dart';
import 'package:project_1/app/common/widgets/button.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  final ILocalStorage _storage = LocalStorage();
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                errorText: Provider.of<AuthViewModel>(context).loginError,
                label: 'Login',
                onChanged: (value) => {
                  Provider.of<AuthViewModel>(context, listen: false).login =
                      value,
                },
              ),
              const SizedBox(height: 40),
              FormTextField(
                errorText: Provider.of<AuthViewModel>(context).passwordError,
                label: 'Password',
                onChanged: (value) => {
                  Provider.of<AuthViewModel>(context, listen: false).password =
                      value,
                },
                obscureText: true,
              ),
              const SizedBox(height: 40),
              Button(
                onLoginButtonPressed: onLoginButtonPressed,
                title: 'Login',
              )
            ],
          ))
    ]);
  }

  void onLoginButtonPressed(BuildContext context) {
    final isValid =
        Provider.of<AuthViewModel>(context, listen: false).validate();
    final user = Provider.of<UserService>(context, listen: false).user;
    if (isValid) {
      _storage.save('login', user!.login);
      _storage.save('password', user.password);
      
      Future.delayed(const Duration(seconds: 2)).then(
          (value) => Navigator.of(context).pushReplacementNamed(routeHome));
    }
  }
}
