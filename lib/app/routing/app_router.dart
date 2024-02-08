import 'package:flutter/material.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/screens/home/home_factory.dart';
import 'package:project_1/app/screens/auth/auth_factory.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeLogin:
        return MaterialPageRoute(
            builder: (_) => _buildLoginSettings(routeSettings));
      case routeHome:
        return MaterialPageRoute(
            builder: (_) => _buildHomeSettings(routeSettings));
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }

  Widget _buildLoginSettings(RouteSettings settings) {
    return AuthFactory.build();
  }

  Widget _buildHomeSettings(RouteSettings settings) {
    return HomeFactory.build();
  }
}
