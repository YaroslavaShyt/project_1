import 'package:flutter/material.dart';
import 'package:project_1/app/routing/app_router.dart';
import 'package:project_1/app/screens/auth/auth_view_model.dart';
import 'package:project_1/app/services/theming/theme_provider.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final AppRouter _router;
  final INavigationUtil _navigationUtil;

  const MyApp(
      {super.key,
      required AppRouter router,
      required INavigationUtil navigationUtil})
      : _router = router,
        _navigationUtil = navigationUtil;

  Future<void> _initializeApp(BuildContext context) async {
    await context.read<AuthViewModel>().checkUserExists();
  }

  @override
  Widget build(BuildContext context) {
    _initializeApp(context);
    return Consumer<ThemeProvider>(
      builder: ((context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: _navigationUtil.navigatorKey,
          onGenerateRoute: _router.onGenerateRoute,
          theme: value.getTheme,
          initialRoute: context.read<AuthViewModel>().initialRoute,
        );
      }),
    );
  }
}
