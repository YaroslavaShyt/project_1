import 'package:flutter/material.dart';

class Indicators extends StatelessWidget {
  final int current;
  final Function() onTap;
  const Indicators({super.key, required this.current, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          2,
          (index) => GestureDetector(
            onTap: onTap,
            child: Icon(
                  Icons.dining_sharp,
                  color: index == current ? Colors.amber : Colors.grey,
                ),
          )),
    );
  }
}
