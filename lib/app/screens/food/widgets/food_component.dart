import 'package:flutter/material.dart';
import 'package:project_1/domain/food/ifood.dart';

class FoodComponent extends StatelessWidget {
  final IFood model;
  const FoodComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.network(model.picture),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              Text(
                model.area,
                style: const TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
