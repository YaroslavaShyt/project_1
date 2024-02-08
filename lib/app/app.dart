import 'package:flutter/material.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user_service.dart';

class MyApp extends StatelessWidget {
  final AppRouter _router;
  late String initialRoute;

  MyApp({super.key, required AppRouter router}) : _router = router {
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    AuthViewModel authViewModel = AuthViewModel(localStorage: LocalStorage(), userService: UserService());
    await authViewModel.checkUserExists();
    initialRoute = authViewModel.initialRoute;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _router.onGenerateRoute,
      title: 'Project 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
    );
  }
}

