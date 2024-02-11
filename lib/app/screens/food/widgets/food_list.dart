import 'package:flutter/material.dart';
import 'package:project_1/app/screens/food/widgets/food_component.dart';
import 'package:project_1/domain/food/ifood.dart';

class FoodList extends StatelessWidget {
  final List<IFood> food;
  final Function({required IFood food}) onTap;
  const FoodList({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: food.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: ()=>onTap(food: food[index]),
          child: FoodComponent(model: food[index]));
      },
    );
  }
}
