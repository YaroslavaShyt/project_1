import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/button.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';

class HomeScreen extends StatelessWidget {
  final AuthViewModel _authViewModel;
  HomeScreen({super.key, required AuthViewModel authViewModel})
      : _authViewModel = authViewModel;

  final TextEditingController _controllerTextField = TextEditingController();

  final TextEditingController _controllerTextFormField =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controllerTextField,
            ),
            Button(
                onLoginButtonPressed: _authViewModel.onLogOutButtonPressed,
                title: 'A'),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _controllerTextFormField,
            ),
            Button(
                onLoginButtonPressed: _authViewModel.onLogOutButtonPressed,
                title: 'B')
          ]),
    );
  }
}
