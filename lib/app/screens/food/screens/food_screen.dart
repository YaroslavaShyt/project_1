import 'package:flutter/material.dart';
import 'package:project_1/app/screens/food/food_view_model.dart';
import 'package:project_1/app/screens/food/widgets/food_list.dart';

class FoodScreen extends StatelessWidget {
  final FoodViewModel _viewModel;
  const FoodScreen({super.key, required FoodViewModel viewModel})
      : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    if (!_viewModel.isDataLoaded && !_viewModel.isDataLoading) {
      Future.delayed(Duration.zero, () {
        _viewModel.fetchFoodDataList();
      });
    }
    if (_viewModel.isDataLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (!_viewModel.isDataLoaded) {
      return const Text('Error loading data');
    } else {
      return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Food App'),
            actions: [
              IconButton(
                  onPressed: _viewModel.onLogOutButtonPressed,
                  icon: const Icon(Icons.logout_outlined))
            ],
          ),
          body: FoodList(
            onTap: _viewModel.navigateToFoodDetails,
            food: _viewModel.foodList,
          ));
    }
  }
}
