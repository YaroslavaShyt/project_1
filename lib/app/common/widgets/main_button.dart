import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function() onButtonPressed;
  const MainButton({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).canvasColor,
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
