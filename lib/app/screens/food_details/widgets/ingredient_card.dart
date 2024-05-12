import 'package:flutter/material.dart';
import 'package:project_1/app/common/widgets/cached_network_image.dart';
import 'package:project_1/app/services/networking/endpoints.dart';

class IngredientCard extends StatelessWidget {
  final String name;
  const IngredientCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.all(8.0),
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).canvasColor),
      child: Center(
        child: Column(
          children: [
            MainCachedNetworkImage(url: "$urlIngredients$name-Small.png"),
            Wrap(children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                name,
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
