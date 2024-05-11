import 'package:flutter/material.dart';
import 'package:project_1/app/routing/routes.dart';
import 'package:project_1/app/screens/food/food_factory.dart';
import 'package:project_1/app/screens/auth/auth_factory.dart';
import 'package:project_1/app/screens/food_details/food_details_factory.dart';
import 'package:project_1/domain/food/ifood.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeLogin:
        return MaterialPageRoute(
            builder: (_) => _buildLoginSettings(routeSettings));
      case routeFood:
        return MaterialPageRoute(
            builder: (_) => _buildFoodSettings(routeSettings));
      case routeDetails:
        return MaterialPageRoute(
            builder: (_) => _buildFoodDetailsSettings(routeSettings));
      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }

  Widget _buildLoginSettings(RouteSettings settings) {
    return AuthFactory.build();
  }

  Widget _buildFoodSettings(RouteSettings settings) {
    return FoodFactory.build();
  }

  Widget _buildFoodDetailsSettings(RouteSettings settings) {
    IFood food = settings.arguments as IFood;
    return FoodDetailsFactory.build(food: food);
  }
}
