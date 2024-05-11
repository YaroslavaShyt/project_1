import 'package:flutter/material.dart';
import 'package:project_1/app/screens/food/food_view_model.dart';
import 'package:project_1/app/screens/food/widgets/food_component.dart';
import 'package:project_1/domain/food/ifood.dart';

class FoodScreen extends StatefulWidget {
  final FoodViewModel _viewModel;
  const FoodScreen({super.key, required FoodViewModel viewModel})
      : _viewModel = viewModel;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    super.initState();
    if (!widget._viewModel.isDataLoaded && !widget._viewModel.isDataLoading) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        widget._viewModel.fetchFoodDataList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Foody',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF6FB08A),
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Food List',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: widget._viewModel.swapTheme,
              icon: const Icon(Icons.sunny)),
          IconButton(
              onPressed: widget._viewModel.onLogOutButtonPressed,
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: widget._viewModel.isDataLoading
          ? Center(
              child: CircularProgressIndicator(
              color: Theme.of(context).canvasColor,
            ))
          : !widget._viewModel.isDataLoaded
              ? const Center(child: Text('Error loading data'))
              : ListView.builder(
                  itemCount: widget._viewModel.foodList.length,
                  itemBuilder: (context, index) {
                    IFood food = widget._viewModel.foodList[index];
                    return GestureDetector(
                        onTap: () =>
                            widget._viewModel.navigateToFoodDetails(food: food),
                        child: FoodComponent(model: food));
                  },
                ),
    );
  }
}
