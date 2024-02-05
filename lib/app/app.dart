import 'package:flutter/material.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';

// тут питання з не final змінною initialRoute
// як краще всього її ініціалізувати відповідно до роботи з local_storage
class MyApp extends StatelessWidget {

  final AppRouter router = AppRouter();
  final ILocalStorage storage = LocalStorage();

  String initialRoute = routeLogin;

  MyApp({super.key});

  Future<void> _checkUserExists() async {
    try {
      String login = await storage.read('login');
      String password = await storage.read('password');
      if (login.isNotEmpty && password.isNotEmpty) {
        initialRoute = routeHome;
      }
    } catch (err) {
      initialRoute = routeLogin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.onGenerateRoute,
      title: 'Project 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
    );
  }

  
}
