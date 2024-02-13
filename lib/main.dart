import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/routing/navigation_util.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user/user_service.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final INavigationUtil navigationUtil = NavigationUtil();
  final ILocalStorage storage = LocalStorage();
  final UserService service = UserService();
  final AuthViewModel authViewModel = AuthViewModel(
      localStorage: storage,
      userService: service,
      navigationUtil: navigationUtil);

  runApp(MultiProvider(
      providers: [
        Provider.value(value: navigationUtil),
        ChangeNotifierProvider(create: (context) => authViewModel),
        ChangeNotifierProvider(create: (context) => service),
      ],
      child: MyApp(
        navigationUtil: navigationUtil,
        router: AppRouter(),
      )));
}
