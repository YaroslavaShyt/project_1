import 'package:flutter/material.dart';
import 'package:project_1/app/app.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/routing/navigation_util.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:project_1/domain/local_storage/ilocal_storage.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final INavigationUtil navigationUtil = NavigationUtil();
  final ILocalStorage storage = LocalStorage();
  final UserService service = UserService();

  runApp(MultiProvider(
      providers: [
        Provider.value(value: navigationUtil),
        ChangeNotifierProvider(
            create: (context) => AuthViewModel(
                localStorage: storage,
                userService: service,
                navigationUtil: navigationUtil)),
        ChangeNotifierProvider(create: (context) => service),
      ],
      child: MyApp(
        navigationUtil: navigationUtil,
        router: AppRouter(),
      )));
}
