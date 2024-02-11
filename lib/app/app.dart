import 'package:flutter/material.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/routing/navigation_util.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user/user_service.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';


class MyApp extends StatelessWidget {
  final AppRouter _router;
  final INavigationUtil _navigationUtil;
  late String initialRoute = routeLogin;

  MyApp(
      {super.key,
      required AppRouter router,
      required INavigationUtil navigationUtil})
      : _router = router,
        _navigationUtil = navigationUtil {
   _initializeApp();
  }

  Future<void> _initializeApp() async {
    AuthViewModel authViewModel = AuthViewModel(
        localStorage: LocalStorage(),
        userService: UserService(),
        navigationUtil: NavigationUtil());
    await authViewModel.checkUserExists();
    initialRoute = authViewModel.initialRoute;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigationUtil.navigatorKey,
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
