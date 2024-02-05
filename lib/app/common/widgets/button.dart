import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onLoginButtonPressed;
  final String title;
  const Button(
      {super.key, required this.onLoginButtonPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: () => onLoginButtonPressed(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
