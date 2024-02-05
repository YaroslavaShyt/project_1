import 'package:flutter/material.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/screens/auth/widgets/login_form.dart';

class AuthScreen extends StatelessWidget {
  final AuthViewModel viewModel;
  const AuthScreen({
    super.key,
    required this.viewModel
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginForm(),  
          ],
        ),
      ),
    );
  }
}
