import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/button.dart';
import 'package:project_1/app/screens/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel _viewModel;
  HomeScreen({super.key, required HomeViewModel viewModel})
      : _viewModel = viewModel;

  final TextEditingController _controllerTextField = TextEditingController();

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
                onLoginButtonPressed: _viewModel.onLogOutButtonPressed,
                title: 'A'),
           
          ]),
    );
  }
}
