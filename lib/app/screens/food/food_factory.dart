import 'package:flutter/material.dart';
import 'package:project_1/app/screens/food/screens/food_screen.dart';
import 'package:project_1/app/screens/food/food_view_model.dart';
import 'package:project_1/app/screens/food_details/food_screen_details.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/networking/network_service.dart';
import 'package:project_1/app/services/user/user_service.dart';
import 'package:project_1/data/food/food_repository.dart';
import 'package:project_1/domain/food/ifood.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';
import 'package:provider/provider.dart';

class FoodFactory {
  static Widget build() {
    return ChangeNotifierProvider(
      create: (context) => FoodViewModel(
          foodRepository: FoodRepository(networkService: NetworkService()),
          localStorage: LocalStorage(),
          userService: context.read<UserService>(),
          navigationUtil: context.read<INavigationUtil>()),
      child: Consumer<FoodViewModel>(
        builder: (context, model, child) => FoodScreen(
          viewModel: model,
        ),
      ),
    );
  }
}

class FoodDetailsFactory {
  static Widget build(RouteSettings settings) {
    return FoodScreenDetails(model: settings.arguments as IFood,);
  }
}
