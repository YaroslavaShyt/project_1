import 'package:flutter/material.dart';
import 'package:project_1/domain/food/ifood.dart';

class FoodScreenDetails extends StatelessWidget {
  final IFood model;
  const FoodScreenDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Image.network(model.picture),
          ),
          Text(model.title),
          Text(model.area)
        ],
      ),
    );
  }
}
