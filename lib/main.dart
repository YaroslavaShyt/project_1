import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthViewModel(
                localStorage: LocalStorage(), userService: UserService())),
        ChangeNotifierProvider(create: (context) => UserService()),
      ],
      child: MyApp(
        router: AppRouter(),
      )));
}
