import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthViewModel(userService: UserService())),
          ChangeNotifierProvider(create: (context) => UserService()),
        ],
        child:MyApp()));
}



