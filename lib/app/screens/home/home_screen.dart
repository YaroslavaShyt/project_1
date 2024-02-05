import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/button.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';

class HomeScreen extends StatelessWidget {
  final ILocalStorage _storage = LocalStorage();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Button(
              onLoginButtonPressed: _onLogOutButtonPressed, title: 'Log out')),
    );
  }

  void _onLogOutButtonPressed(BuildContext context) {
    _storage.delete('login');
    _storage.delete('password');
   
    Future.delayed(const Duration(seconds: 2)).then(
        (value) => Navigator.of(context).pushReplacementNamed(routeLogin));
  }
}
