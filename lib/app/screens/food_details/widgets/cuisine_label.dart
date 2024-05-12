import 'package:flutter/material.dart';

class CuisineLabel extends StatelessWidget {
  final String label;
  const CuisineLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
          margin: const EdgeInsets.only(right: 10.0),
          padding: const EdgeInsets.all(10.0),
          color: Theme.of(context).canvasColor,
          child: Text(
            label,
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          )),
    );
  }
}
