import 'package:flutter/material.dart';
import 'package:project_1/app/routing/navigation_util.dart';
import 'package:project_1/app/screens/home/home_screen.dart';
import 'package:project_1/app/screens/home/home_view_model.dart';
import 'package:project_1/app/services/local_storage/local_storage.dart';
import 'package:project_1/app/services/user_service.dart';
import 'package:project_1/domain/navigation/inavigation_util.dart';
import 'package:provider/provider.dart';

class HomeFactory {
  static Widget build() {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
          localStorage: LocalStorage(),
          userService: context.read<UserService>(),
          navigationUtil: context.read<INavigationUtil>()),
      child: Consumer<HomeViewModel>(
          builder: (context, model, child) => HomeScreen(
                viewModel: model,
              )),
    );
  }
}
